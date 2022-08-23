package com.project.football_club_matching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.football_club_matching.entity.Example;
import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;
import com.project.football_club_matching.entity.QuestionResult;
import com.project.football_club_matching.service.MatchingService;

@Controller
public class MatchingController {
    
    @Autowired MatchingService matchingService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model model){
        
        Member member = new Member();
        matchingService.saveMember(member);
        List<Question> list = matchingService.findQuestions();
        

        model.addAttribute("id", member.getId());
        model.addAttribute("questions", list);
        return "home";
    }

    @RequestMapping(value = "/home/{id}", method = RequestMethod.POST)
    public String getData(QuestionResult questionResult, Model model, @PathVariable("id") String id){
        
        
        String result = matchingService.getResult(questionResult, Long.parseLong(id));
        

        model.addAttribute("result", result);
        return "result";
    }
}