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

    @Autowired
    MatchingRepository matchingRepository; // MatchingRepository를 자동으로 주입

    public List<Question> findQuestions() { // 질문 목록을 조회하는 메소드
        return matchingRepository.findQuestions(); // MatchingRepository에서 질문 목록을 조회하여 반환
    }

    public void saveMember(Member member) { // 회원 정보를 저장하는 메소드
        matchingRepository.save(member); // MatchingRepository에 회원 정보를 저장
    }

    public Member find(Long id) { // 회원 정보를 조회하는 메소드
        return matchingRepository.find(id); // MatchingRepository에서 해당 id의 회원 정보를 조회하여 반환
    }

    public void countTeam(String teamName) { // 팀의 인원 수를 증가시키는 메소드
        Team team = matchingRepository.findTeam(teamName); // MatchingRepository에서 해당 팀을 조회하여 Team 객체에 저장
        team.setCount(team.getCount() + 1); // Team 객체의 인원 수를 1 증가시킴
    }

    public String getResult(QuestionResult result, Long id) { // 결과를 계산하는 메소드
        List<String> resultList = result.getResultList(); // 결과 목록을 가져옴
        List<Example> examples = new ArrayList<>(); // Example 객체를 저장할 ArrayList 생성
        for (String str : resultList) { // 결과 목록을 반복문으로 돌면서
            Long questionId = 0l; // 질문 id를 저장할 변수 초기화
            Long exampleId = 0l; // Example id를 저장할 변수 초기화
            if (str.length() != 2) { // 결과 문자열의 길이가 2가 아니면
                questionId = Long.parseLong(str.substring(0, 2)); // 0번째부터 2번째 전까지의 문자열을 Long 타입으로 변환하여 questionId에 저장
                exampleId = (long) (str.charAt(2) - '0'); // 2번째 문자를 숫자로 변환하여 exampleId에 저장
            } else { // 결과 문자열의 길이가 2이면
                questionId = (long) (str.charAt(0) - '0'); // 0번째 문자를 숫자로 변환하여 questionId에 저장
                exampleId = (long) (str.charAt(1) - '0'); // 1번째 문자를 숫자로 변환하여 exampleId에 저장
            }

            Example example = matchingRepository.findExample(questionId, exampleId); // MatchingRepository에서 해당 질문 id와
                                                                                     // Example id에 해당하는 Example 객체를
                                                                                     // 조회하여 example에 저장
            examples.add(example); // examples 리스트에 example 객체를 추가
            System.out.println(questionId + " " + exampleId); // questionId와 exampleId를 출력
        }

        String teamName = result(examples); // Example 객체들을 이용하여 결과를 계산하여 teamName에 저장
        countTeam(teamName); // 해당 팀의 인원 수를 증가시킴
        Member member = find(id); // 해당 id의 회원 정보를 조회하여 member에 저장

        member.setTeamName(teamName); // 회원 정보의 팀 이름을 teamName으로 설정

        return teamName; // 계산된 결과인 teamName을 반환
    }

    public String getResult(QuestionResult result) { // 결과를 계산하는 메소드
        List<String> resultList = result.getResultList(); // 결과 목록을 가져옴
        List<Example> examples = new ArrayList<>(); // Example 객체를 저장할 ArrayList 생성
        for (String str : resultList) { // 결과 목록을 반복문으로 돌면서
            Long questionId = 0l; // 질문 id를 저장할 변수 초기화
            Long exampleId = 0l; // Example id를 저장할 변수 초기화
            if (str.length() != 2) { // 결과 문자열의 길이가 2가 아니면
                questionId = Long.parseLong(str.substring(0, 2)); // 0번째부터 2번째 전까지의 문자열을 Long 타입으로 변환하여 questionId에 저장
                exampleId = (long) (str.charAt(2) - '0'); // 2번째 문자를 숫자로 변환하여 exampleId에 저장
            } else { // 결과 문자열의 길이가 2이면
                questionId = (long) (str.charAt(0) - '0'); // 0번째 문자를 숫자로 변환하여 questionId에 저장
                exampleId = (long) (str.charAt(1) - '0'); // 1번째 문자를 숫자로 변환하여 exampleId에 저장
            }

            Example example = matchingRepository.findExample(questionId, exampleId); // MatchingRepository에서 해당 질문 id와
                                                                                     // Example id에 해당하는 Example 객체를
                                                                                     // 조회하여 example에 저장
            examples.add(example); // examples 리스트에 example 객체를 추가
            System.out.println(questionId + " " + exampleId); // questionId와 exampleId를 출력
        }
        String teamName = result(examples); // Example 객체들을 이용하여 결과를 계산하여 teamName에 저장
        countTeam(teamName); // 해당 팀의 인원 수를 증가시킴
        return teamName; // 계산된 결과인 teamName을 반환
    }

    public Team getTeam(String name) { // 팀 정보를 조회하는 메소드
        Team team = matchingRepository.findTeam(name); // MatchingRepository에서 해당 팀을 조회하여 Team 객체에 저장
        return team; // 조회된 Team 객체를 반환
    }

    public List<Team> getTeams() { // 모든 팀 정보를 조회하는 메소드
        List<Team> teams = matchingRepository.findTeams(); // MatchingRepository에서 모든 팀 정보를 조회하여 List에 저장
        return teams; // 조회된 팀 정보를 담은 List를 반환
    }

    static String result(List<Example> list) { // Example 객체들을 이용하여 결과를 계산하는 메소드
        Map<String, Integer> map = new HashMap<>(); // 팀 이름과 점수를 저장할 Map 생성
        int max = 0; // 최대 점수를 저장할 변수 초기화
        String teamName = ""; // 최대 점수를 받은 팀 이름을 저장할 변수 초기화
        for (Example example : list) { // Example 객체들을 반복문으로 돌면서
            String[] arr = example.getTeams().split(","); // Example 객체의 팀 이름들을 ','를 기준으로 분리하여 배열에 저장
            int score = example.getScore(); // Example 객체의 점수를 가져옴

            for (String name : arr) { // 팀 이름 배열을 반복문으로 돌면서
                if (!map.containsKey(name)) { // Map에 해당 팀 이름이 없으면
                    map.put(name, score); // 팀 이름과 점수를 Map에 추가

                } else { // Map에 해당 팀 이름이 있으면
                    map.put(name, map.get(name) + score); // 해당 팀의 점수에 현재 Example 객체의 점수를 더하여 Map에 저장

                }
            }
        }

        for (Map.Entry<String, Integer> entry : map.entrySet()) { // Map을 반복문으로 돌면서
            System.out.println("team name : " + entry.getKey() + ", team score : " + entry.getValue()); // 팀 이름과 점수를 출력
            if (entry.getValue() > max) { // 현재 팀의 점수가 최대 점수보다 크면
                teamName = entry.getKey(); // 최대 점수를 받은 팀 이름을 teamName에 저장
                max = entry.getValue(); // 최대 점수를 현재 팀의 점수로 변경
            }
        }

        return teamName; // 최대 점수를 받은 팀 이름을 반환
    }
}