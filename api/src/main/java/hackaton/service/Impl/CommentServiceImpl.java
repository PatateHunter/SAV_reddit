package hackaton.service.Impl;

import fr.esgi.hackaton.bucket.BucketName;
import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.domain.CommentFile;
import fr.esgi.hackaton.dto.DownloadCommentFileDto;
import fr.esgi.hackaton.dto.UploadCommentFileDto;
import fr.esgi.hackaton.filestore.FileStore;
import fr.esgi.hackaton.repository.CommentRepository;
import fr.esgi.hackaton.service.CommentService;

import java.io.IOException;
import java.util.*;

import static org.apache.http.entity.ContentType.*;

public final class CommentServiceImpl implements CommentService {
    private static final List IMAGES_EXE = Arrays.asList(IMAGE_GIF.getMimeType(),
            IMAGE_PNG.getMimeType(),
            IMAGE_JPEG.getMimeType());
    private final FileStore fileStore;
    private final CommentRepository commentRepository;

    public CommentServiceImpl(FileStore fileStore, CommentRepository commentRepository) {
        this.fileStore = fileStore;
        this.commentRepository = commentRepository;
    }

    @Override
    public List<Comment> findAllComments() {
        return commentRepository.findAll();
    }

    @Override
    public Comment findCommentyById(Long commentId) {
        return commentRepository.getById(commentId);
    }

    @Override
    public Comment updateComment(Comment comment) {
        return commentRepository.save(comment);
    }

    @Override
    public Comment registerComment(Comment comment) {
        return commentRepository.save(comment);
    }
   // @Override
    public void uploadUserFile(Long commentId, UploadCommentFileDto uploadCommentFileDto) {
        //1. Chek if image is not empty
        if(uploadCommentFileDto.getFile().isEmpty()){
            throw new IllegalStateException(String.format("Cannot upload empty file [%d] ", uploadCommentFileDto.getFile().getSize()));
        }
        //2. If file is an image
        if(!IMAGES_EXE.contains(uploadCommentFileDto.getFile().getContentType())){
            throw new IllegalStateException(String.format("File must be an image"));
        }
        //3. The user exists in our BDD
        Comment comment = findCommentyById(commentId);
        //4. Grap some metadata from file if any
        Map<String,String> metadata= new HashMap<>();
        metadata.put("Content-Type", uploadCommentFileDto.getFile().getContentType());
        metadata.put("Content-Length",String.valueOf(uploadCommentFileDto.getFile().getSize()));
        //5. Store the image in s3 and Update BDD with s3 image link
        String path = String.format("%s/%s", BucketName.COMMENT_FILE.getBucketName(),comment.getId());
        String fileName = String.format("%s-%s", uploadCommentFileDto.getFile().getOriginalFilename(), UUID.randomUUID());
        try{
            fileStore.save(path,fileName, Optional.of(metadata), uploadCommentFileDto.getFile().getInputStream());
            CommentFile newFile = new CommentFile(fileName);
            comment.setCommentFile(newFile);
        }catch (IOException e){
            throw new IllegalStateException(e);
        }
    }
    
    @Override
    public DownloadCommentFileDto downloadUserFiles(Long commentId) {
        Comment comment = findCommentyById(commentId);
        String path = String.format("%s/%s", BucketName.COMMENT_FILE.getBucketName(),commentId);
        CommentFile file = comment.getCommentFile();
        DownloadCommentFileDto commentFileDto = new DownloadCommentFileDto(fileStore.download(path, file.getFileLink()));
        return commentFileDto;
    }

}
