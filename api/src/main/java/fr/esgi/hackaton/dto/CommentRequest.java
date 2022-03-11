package fr.esgi.hackaton.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CommentRequest {
    private String title;
    private Long userId;
    private LocalDate dateHourAdd;
    private String content;
    private String urlFile;
    private Integer ranking;
    private UploadCommentFileDto file;
}
