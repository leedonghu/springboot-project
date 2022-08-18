package com.project.football_club_matching.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ManyToAny;

import lombok.Getter;

@Entity
@Getter
public class Team {
    
    @Id
    private String name;

    private Long count;

    
}