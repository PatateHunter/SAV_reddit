package fr.esgi.hackaton.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentRequest {
    private String title;
    private Long userId;
    private LocalDateTime dateHourAdd;
    private String content;
    private Integer ranking;
}
