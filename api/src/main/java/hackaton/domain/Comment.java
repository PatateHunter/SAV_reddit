package hackaton.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity
@Table(name = "comment")
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    private String title;
    @OneToOne
    private User user;
    private LocalDate dateHourAdd;
    private String content;
    @OneToOne
    private CommentFile commentFile;
    private Integer ranking;
    @OneToMany
    private List<Comment> comments;
}
