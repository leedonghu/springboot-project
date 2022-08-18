package com.project.football_club_matching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;
import com.project.football_club_matching.repository.MatchingRepository;

@Service
@Transactional
public class MatchingService {
    
    @Autowired MatchingRepository matchingRepository;

    public List<Question> findQuestions(){
        return matchingRepository.findQuestions();
    }

    public void saveMember(Member member){
        matchingRepository.save(member);
    }
}