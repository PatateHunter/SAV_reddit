package fr.esgi.hackaton.service;

import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.DownloadCommentFileDto;

import java.util.List;

public interface CommentService {
    List<Comment> findAllComments();
    Comment findCommentyById(Long commentId);
    Comment updateComment(Comment comment);
    Comment registerComment(Comment comment);
   // void uploadCommentFile(String userProfileId, UploadUserFileDto uploadUserFileDto);
   DownloadCommentFileDto downloadUserFiles(Long commentId);
}
