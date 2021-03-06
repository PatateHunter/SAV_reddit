package fr.esgi.hackaton.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentAndFileRequest {
    private CommentRequest commentRequest;
    private MultipartFile file;
}
