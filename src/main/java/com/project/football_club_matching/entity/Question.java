package com.project.football_club_matching.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;

@Entity
@Getter
public class Question {
    
    @Id
    @Column(name = "QUESTION_ID")
    private Long id;

    private String Content;
    private String leftOption;
    private String rightOption;

    @OneToMany(mappedBy = "question", fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<Example> examples = new ArrayList<>();
}