package com.project.football_club_matching.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;


import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;

@Repository
public class MatchingRepository {
    
    @PersistenceContext
    EntityManager em;

    public void save(Member member){
        em.persist(member);
    }

    @Transactional
    public List<Question> findQuestions(){
        List<Question> list = em.createQuery("select q from Question q join fetch q.examples", Question.class).getResultList();
        System.out.println("question query");
        
        return list;
    }
}