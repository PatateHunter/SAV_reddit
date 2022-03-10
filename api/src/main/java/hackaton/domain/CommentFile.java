package hackaton.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;

@Data
@Table(name = "file")
@NoArgsConstructor
public class CommentFile {
    private String fileLink;

    public CommentFile(String fileLink) {
        this.fileLink = fileLink;

    }
}
