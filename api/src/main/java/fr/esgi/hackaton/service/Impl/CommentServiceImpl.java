package fr.esgi.hackaton.service.Impl;

import fr.esgi.hackaton.bucket.BucketName;
import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.DownloadCommentFileDto;
import fr.esgi.hackaton.dto.UploadCommentFileDto;
import fr.esgi.hackaton.filestore.FileStore;
import fr.esgi.hackaton.repository.CommentRepository;
import fr.esgi.hackaton.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

import static org.apache.http.entity.ContentType.*;

@Service
@RequiredArgsConstructor
public final class CommentServiceImpl implements CommentService {
    private static final List IMAGES_EXE = Arrays.asList(IMAGE_GIF.getMimeType(),
            IMAGE_PNG.getMimeType(),
            IMAGE_JPEG.getMimeType());
    private final FileStore fileStore;
    private final CommentRepository commentRepository;
    private final UserServiceImpl userService;

    @Override
    public List<Comment> findAllComments() {
        List<Comment> comments = commentRepository.findAll();

        return comments;
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
    public Comment registerComment(Comment comment, MultipartFile file) {
        Comment newComment = commentRepository.save(comment);
        
        return uploadUserFile(newComment.getId(), file);
    }
   
    private Comment uploadUserFile(Long commentId, MultipartFile file) {
        //1. Chek if image is not empty
        if(file.isEmpty()){
            throw new IllegalStateException(String.format("Cannot upload empty file [%d] ", file.getSize()));
        }
        //2. If file is an image
        if(!IMAGES_EXE.contains(file.getContentType())){
            throw new IllegalStateException(String.format("File must be an image"));
        }
        //3. The user exists in our BDD
        Comment comment = findCommentyById(commentId);
        //4. Grap some metadata from file if any
        Map<String,String> metadata= new HashMap<>();
        metadata.put("Content-Type", file.getContentType());
        metadata.put("Content-Length",String.valueOf(file.getSize()));
        //5. Store the image in s3 and Update BDD with s3 image link
        String path = String.format("%s/%s", BucketName.COMMENT_FILE.getBucketName(),comment.getId());
        String fileName = String.format("%s-%s", file.getOriginalFilename(), UUID.randomUUID());
        try{
            fileStore.save(path,fileName, Optional.of(metadata), file.getInputStream());
            comment.setFileLink(fileName);
            return  commentRepository.save(comment);
        }catch (IOException e){
            throw new IllegalStateException(e);
        }
    }
    
    @Override
    public DownloadCommentFileDto downloadUserFiles(Long commentId) {
        Comment comment = findCommentyById(commentId);
        String path = String.format("%s/%s", BucketName.COMMENT_FILE.getBucketName(),commentId);
        DownloadCommentFileDto commentFileDto = new DownloadCommentFileDto(fileStore.download(path, comment.getFileLink()));
        return commentFileDto;
    }

    @Override
    public Comment updateVote(Long commentId, String email, int vote){
        Comment comment = findCommentyById(commentId);
        comment.setRanking(commentRepository.getById(commentId).getRanking()+vote);
        userService.updateRewards(email, vote);
        return commentRepository.save(comment);
    }
}
