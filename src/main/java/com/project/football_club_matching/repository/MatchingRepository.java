package com.project.football_club_matching.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.project.football_club_matching.entity.Example;
import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;
import com.project.football_club_matching.entity.Team;

@Repository
public class MatchingRepository {
    
    @PersistenceContext
    EntityManager em;

    public void save(Member member){
        em.persist(member);
    }

    public Member find(Long id){
        return em.find(Member.class, id);
    }

    public Team findTeam(String teamName){
        return em.find(Team.class, teamName);
    }

    @Transactional
    public List<Question> findQuestions(){
        List<Question> list = em.createQuery("select distinct q from Question q join fetch q.examples", Question.class).getResultList();
        
        return list;
    }

    public List<Team> findTeams(){
        List<Team> teams = em.createQuery("select t from Team t order by t.count desc", Team.class).getResultList();
        return teams;
    }

    @Transactional
    public Example findExample(Long questionId, Long exampleId){
        TypedQuery<Example> query = em.createQuery("select e from Example e where e.id.id = :id and e.id.questionId = :questionId", Example.class)
        .setParameter("id", exampleId)
        .setParameter("questionId", questionId);

        Example example = query.getSingleResult();
        
        return example;

    }
}