<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="/js/home.js"></script>
<link rel="stylesheet" href="/css/home.css">
<style>
    
</style>
<title>PL BIG6 추천</title>
</head>
<body>
    <a href="localhost:8080/statistics">통계</a>
    <div class="main-app">
        <header>
            <div class="title">나에게 어울리는 축구팀</div>
        </header>
        <div class="tips">
            <div class="tip">
                <div class="tip-img">⚽</div>
                <div class="tip-text">Premier League의 BIG6 팀만 추천합니다</div>
            </div>
            <div class="tip">
                <div class="tip-img">🛸</div>
                <div class="tip-text">질문에 공신력은 없습니다</div>
            </div>
            <!-- <div class="shape"></div>
            <div class="shadow"></div> -->
        </div>
        <div class="test-question">
            <form action="/home/${id}" method="post" id="question-form">
                <c:forEach items="${questions}" var="que" varStatus="i">
                    <c:if test="${i.index eq 0}">
                        <div class="question">
                            <div class="content">${que.content}</div>
                            <div class="radiogroup" checked="false">
                                <div class="left-option">${que.leftOption}</div>
                                <c:forEach items="${que.examples}" var="exam" varStatus="status">
                                    <div class="radio-container">
                                        <input type="radio" class="form-check-input ${status.index}"  name="result${que.id}" value="${que.id}${exam.id.id}"></input>
                                    </div>
                                </c:forEach>
                                <div class="right-option">${que.rightOption}</div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${i.index ne 0}">
                        <div class="question inactive">
                            <div class="content">${que.content}</div>
                            <div class="radiogroup" checked="false">
                                <div class="left-option">${que.leftOption}</div>
                                <c:forEach items="${que.examples}" var="exam" varStatus="status">
                                    <div class="radio-container">
                                        <input type="radio" class="form-check-input ${status.index}"  name="result${que.id}" value="${que.id}${exam.id.id}">
                                    </div>
                                </c:forEach>
                                <div class="right-option">${que.rightOption}</div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="button-container">
                    <button type="button" class="button">
                        <span class="span-button">확인</span>
                    </button>
                </div>
            </form>
        </div>
        <footer>
            <div class="notice">
                <strong>주의사항 : </strong>
                해당 사이트는 사이드 프로젝트로 만들어진 것으로 <strong>질문이나 결과에 어떠한 공신력도 없습니다.</strong>
                혹여나 문제점이 발견되시면 아래의 이메일로 문의해주시면 감사하겠습니다.
            </div>
            <div class="contact">contact : ldh930517@gmail.com</div>
        </footer>
    </div>
</body>
</html>
