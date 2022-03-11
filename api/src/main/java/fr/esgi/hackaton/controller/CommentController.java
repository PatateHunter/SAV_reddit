package fr.esgi.hackaton.controller;

import fr.esgi.hackaton.domain.Comment;
import fr.esgi.hackaton.dto.CommentRequest;
import fr.esgi.hackaton.dto.CommentResponse;
import fr.esgi.hackaton.dto.UploadCommentFileDto;
import fr.esgi.hackaton.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.jni.Local;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/comment")
public class CommentController {
private final CommentMapper commentMapper;

    @PostMapping
    //public ResponseEntity<CommentResponse> create(@RequestPart CommentRequest commentRequest, @ModelAttribute MultipartFile file){

    public ResponseEntity<CommentResponse> create(@RequestParam String title,
                                                  @RequestParam Long userId,
                                                  @RequestParam String dateHourAdd,
                                                  @RequestParam String content,
                                                  @RequestParam Integer ranking,
                                                  @ModelAttribute MultipartFile file){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime localDate = LocalDateTime.parse(dateHourAdd, formatter);
        CommentRequest commentRequest = new CommentRequest(title,userId,localDate,content,ranking);
        CommentAndFileRequest uploadCommentFileDto= new CommentAndFileRequest(commentRequest,file);
        Comment comment = commentMapper.registerComment(uploadCommentFileDto);
        URI location = URI.create(
                ServletUriComponentsBuilder.fromCurrentRequest().build().toUri() + "/" + comment.getId());
        return ResponseEntity.created(location).build();
    }
    @GetMapping
    public ResponseEntity<List<CommentResponse>> getAll(){
        List<CommentResponse> allComments=commentMapper.findAllComments();
       return  ResponseEntity.ok(allComments);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommentResponse> getById(@RequestParam Long commentId){
        return  ResponseEntity.ok(commentMapper.findCommentById(commentId));
    }

    @PostMapping("/vote")
    public ResponseEntity<CommentResponse> updateVote(@RequestBody VoteRequest voteRequest){
        return ResponseEntity.ok(commentMapper.updateVote(voteRequest.getCommentId(), voteRequest.getEmail(),voteRequest.getVote()));
    }
}
