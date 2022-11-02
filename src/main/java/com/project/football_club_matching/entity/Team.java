package com.project.football_club_matching.entity;

import javax.persistence.Embedded;
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

    private Integer count;
    private String imgUrl;

    @Embedded
    private Address address;

    public void setCount(int count){
        this.count = count;
    }
}