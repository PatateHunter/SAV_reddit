package fr.esgi.hackaton.dto;

import lombok.Data;

@Data
public class VoteRequest {
    Long commentId;
    String email;
    int vote;
}
