package com.project.football_club_matching.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;

@Entity
@Getter
public class Team {
    
    @Id
    private String name;

    private Long count;
}