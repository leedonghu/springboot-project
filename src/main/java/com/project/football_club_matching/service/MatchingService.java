package com.project.football_club_matching.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.football_club_matching.entity.Example;
import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;
import com.project.football_club_matching.entity.QuestionResult;
import com.project.football_club_matching.entity.Team;
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

    public Member find(Long id){
        return matchingRepository.find(id);
    }

    public void countTeam(String teamName){
        Team team = matchingRepository.findTeam(teamName);
        team.setCount(team.getCount() + 1);
    }

    public String getResult(QuestionResult result, Long id){
        List<String> resultList = result.getResultList();
        List<Example> examples = new ArrayList<>();
        for(String str : resultList){
            Long questionId = 0l;
            Long exampleId = 0l;
            if(str.length() != 2){
                questionId = Long.parseLong(str.substring(0, 2));
                exampleId = (long) (str.charAt(2) - '0');
            }else{
                questionId = (long) (str.charAt(0) -'0');
                exampleId = (long) (str.charAt(1) -'0');
            }
            
            Example example = matchingRepository.findExample(questionId, exampleId);
            examples.add(example);
            System.out.println(questionId + " " + exampleId);
        }

        String teamName = result(examples);
        countTeam(teamName);
        Member member = find(id);
        
        member.setTeamName(teamName);
        
        return teamName;
    }

    public Team getTeam(String name){
        Team team = matchingRepository.findTeam(name);
        return team;
        
    }

    public List<Team> getTeams(){
        List<Team> teams = matchingRepository.findTeams();
        return teams;
    }

    static String result(List<Example> list){
        Map<String, Integer> map = new HashMap<>();
        int max = Integer.MIN_VALUE;
        String teamName = "";
        for(Example example : list){
            String[] arr = example.getTeams().split(",");
            int score = example.getScore();

            for(String name : arr){
                if(!map.containsKey(name)){
                    map.put(name, score);
                    if(score > max){
                        teamName = name;
                    }
                }else{
                    map.put(name, map.get(name) + score);
                    if(map.get(name) + score > max){
                        teamName = name;
                    }
                }
            }
        }

        return teamName;
    }
}