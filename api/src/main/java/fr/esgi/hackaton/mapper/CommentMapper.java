package fr.esgi.hackaton.mapper;


import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.CommentRequest;
import fr.esgi.hackaton.dto.CommentResponse;
import fr.esgi.hackaton.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CommentMapper {

    private final ModelMapper modelMapper;
    private final CommentService commentService;

    private Comment convertToEntity(CommentRequest commentRequest) {
        return modelMapper.map(commentRequest, Comment.class);
    }

    CommentResponse convertToResponseDto(Comment comment) {
        return modelMapper.map(comment, CommentResponse.class);
    }

    public CommentResponse findCommentById(Long commentId) {
        return convertToResponseDto(commentService.findCommentyById(commentId));
    }

    public Comment registerComment(CommentRequest commentRequest) {
        return commentService.registerComment(convertToEntity(commentRequest));
    }

    public List<CommentResponse> findAllComments() {
        return commentService.findAllComments()
                .stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
    }

    public CommentResponse updateComment(CommentRequest commentRequest) {
        return convertToResponseDto(commentService.updateComment(convertToEntity(commentRequest)));
    }

    public CommentResponse updateVote(Long commentId, String email, int vote) {
        return convertToResponseDto(commentService.updateVote(commentId, email, vote));
    }

}
