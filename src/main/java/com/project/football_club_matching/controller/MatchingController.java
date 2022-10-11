package com.project.football_club_matching.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.football_club_matching.entity.Member;
import com.project.football_club_matching.entity.Question;
import com.project.football_club_matching.entity.QuestionResult;
import com.project.football_club_matching.entity.Team;
import com.project.football_club_matching.service.MatchingService;
import com.project.football_club_matching.session.SessionManager;

@Controller
public class MatchingController {
    
    @Autowired MatchingService matchingService;
    @Autowired SessionManager sessionManager;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model model, HttpServletResponse response, HttpServletRequest request){
        
        Member checkMember = (Member) sessionManager.getSession(request);
        List<Question> list = matchingService.findQuestions();
        if(checkMember == null){

            Member member = new Member();
            sessionManager.createSession(member, response);
            matchingService.saveMember(member);
            model.addAttribute("id", member.getId());
            model.addAttribute("questions", list);
            System.out.println("세션 생성");
        }else{
            model.addAttribute("id", checkMember.getId());
            model.addAttribute("questions", list);
            System.out.println("세션 이미 있음");

        }
        
        return "home";
    }

    @RequestMapping(value = "/home/{id}", method = RequestMethod.POST)
    public String getData(QuestionResult questionResult, Model model, @PathVariable("id") String id, HttpServletRequest request){
        Member checkMember = (Member) sessionManager.getSession(request);
        if(checkMember == null){
            return "home";
        }
        
        String result = matchingService.getResult(questionResult, Long.parseLong(id));
        

        model.addAttribute("result", result);
        return "load";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        sessionManager.expire(request);
        return "redirect:/home";
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(){
        return "test";
    }

    @RequestMapping(value = "/test/get", method = RequestMethod.POST)
    public String get(@RequestParam("result1") String result1, @RequestParam("result2") String result2, Model model){
        model.addAttribute("result1", result1);
        model.addAttribute("result2", result2);
        return "test2";
    }

    @RequestMapping(value = "/test3", method = RequestMethod.GET)
    public String test3(){
        return "test3";
    }

    @RequestMapping(value = "/test4", method = RequestMethod.GET)
    public String test4(){
        return "test4";
    }

    @RequestMapping(value = "/result/{result}", method = RequestMethod.GET)
    public String result(@PathVariable("result") String result, Model model){
        Team team = matchingService.getTeam(result);
        model.addAttribute("result", team);
        return "result";
    }

    @RequestMapping(value = "/statistics")
    public String statistics(Model model){
        List<Team> teams = matchingService.getTeams();
        model.addAttribute("teams", teams);
        return "statistics";
    }
}