package com.project.football_club_matching.session;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class SessionManager {
    
    private static final String SESSION_NAME = "comstomSession";
    private Map<String, Object> sessionMap = new ConcurrentHashMap<>();

    public void createSession(Object value, HttpServletResponse response){
        String sessionId = UUID.randomUUID().toString();
        sessionMap.put(sessionId, value);

        //쿠키 생성
        Cookie cookie = new Cookie(SESSION_NAME, sessionId);
        response.addCookie(cookie);
    }

    public Object getSession(HttpServletRequest request){
        String value = findCookie(request, SESSION_NAME);
        if(value == null){
            return null;
        }
        return sessionMap.get(value);
    }

    public void expire(HttpServletRequest request){
        String value = findCookie(request, SESSION_NAME);
        if(value != null){
            sessionMap.remove(value);
        }
    }


    private String findCookie(HttpServletRequest request, String cookieName){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                String name = c.getName();
                String value = c.getValue();
                if(name.equals(cookieName)){
                    return value;
                }
            }
        }
        return null;
    }
}