package fr.esgi.hackaton.dto;

import fr.esgi.hackaton.dto.user.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentResponse {
    private Long id;
    private String title;
    private UserResponse user;
    private LocalDateTime dateHourAdd;
    private String content;
    private DownloadCommentFileDto file;
    private Integer ranking;
    private List<CommentResponse> comments;
}
