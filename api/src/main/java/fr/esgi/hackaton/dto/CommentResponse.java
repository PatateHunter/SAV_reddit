package fr.esgi.hackaton.dto;

import fr.esgi.hackaton.dto.user.UserResponse;

import java.time.LocalDate;
import java.util.List;

public class CommentResponse {
    private Long id;
    private String title;
    private UserResponse user;
    private LocalDate dateHourAdd;
    private String content;
    private DownloadCommentFileDto file;
    private Integer ranking;
    private List<CommentResponse> comments;
}
