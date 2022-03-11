package fr.esgi.hackaton.service;

import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.DownloadCommentFileDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CommentService {
    List<Comment> findAllComments();
    Comment findCommentyById(Long commentId);
    Comment updateComment(Comment comment);
    Comment registerComment(Comment comment, MultipartFile file);
    DownloadCommentFileDto downloadUserFiles(Long commentId);
    Comment updateVote(Long commentId, String email, int vote);
}
