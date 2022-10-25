package com.project.football_club_matching.entity;

import javax.persistence.Embeddable;

import lombok.Getter;

@Embeddable
@Getter
public class Address {
    private String homepage;
    private String facebook;
    private String instagram;
    private String youtube;
}