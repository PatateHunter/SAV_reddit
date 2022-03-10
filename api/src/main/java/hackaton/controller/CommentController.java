package hackaton.controller;

import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.CommentRequest;
import fr.esgi.hackaton.dto.CommentResponse;
import fr.esgi.hackaton.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/comment")
public final class CommentController {
private final CommentMapper commentMapper;

    @PostMapping
    public ResponseEntity<CommentResponse> create(@RequestBody CommentRequest commentRequest){
        Comment comment = commentMapper.registerComment(commentRequest);
        URI location = URI.create(
                ServletUriComponentsBuilder.fromCurrentRequest().build().toUri() + "/" + comment.getId());
        return ResponseEntity.created(location).build();
    }
    @GetMapping
    public ResponseEntity<List<CommentResponse>> getAll(){
       return  ResponseEntity.ok(commentMapper.findAllComments());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommentResponse> getById(@RequestParam Long commentId){
        return  ResponseEntity.ok(commentMapper.findCommentById(commentId));
    }

}
