package com.project.football_club_matching.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;


import lombok.Getter;

@Entity
@Getter
public class Member {
    
    @Id
    @GeneratedValue
    @Column(name = "MEMBER_ID")
    private Long id;

    private String teamName;

    public void setTeamName(String teamName){
        this.teamName = teamName;
    }
}