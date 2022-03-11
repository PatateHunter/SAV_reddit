package fr.esgi.hackaton.mapper;


import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.CommentAndFileRequest;
import fr.esgi.hackaton.dto.CommentRequest;
import fr.esgi.hackaton.dto.CommentResponse;
import fr.esgi.hackaton.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CommentMapper {

    private final ModelMapper modelMapper;
    private final CommentService commentService;

    private Comment convertToEntity(CommentAndFileRequest commentRequest) {
        return modelMapper.map(commentRequest.getCommentRequest(), Comment.class);
    }

    CommentResponse convertToResponseDto(Comment comment) {
        CommentResponse response = new CommentResponse();

        return modelMapper.map(comment, CommentResponse.class);
    }

    public CommentResponse findCommentById(Long commentId) {
        return convertToResponseDto(commentService.findCommentyById(commentId));
    }
    public Comment registerComment(CommentAndFileRequest commentRequest) {
        return commentService.registerComment(convertToEntity(commentRequest),commentRequest.getFile());
    }

    public List<CommentResponse> findAllComments() {
        List<CommentResponse> comments= commentService.findAllComments()
                .stream()
                .map(this::convertToResponseDto)
                .collect(Collectors.toList());
        List<CommentResponse> commentResponses = new ArrayList<>();
        for(CommentResponse response:comments){
            response.setFile(commentService.downloadUserFiles(response.getId()));
            commentResponses.add(response);
        }
        return commentResponses;
    }

    public CommentResponse updateComment(CommentAndFileRequest commentRequest) {
        return convertToResponseDto(commentService.updateComment(convertToEntity(commentRequest)));
    }

}
