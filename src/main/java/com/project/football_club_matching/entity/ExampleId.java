package com.project.football_club_matching.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ExampleId implements Serializable {
    
    private Long questionId;

    @Column(name = "EXAMPLE_ID")
    private Long id;

    public ExampleId(){

    }

    @Override
    public boolean equals(Object obj) {
        
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        
        return super.hashCode();
    }

}