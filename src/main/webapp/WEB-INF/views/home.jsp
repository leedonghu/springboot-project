<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/home.js"></script>
<link rel="stylesheet" href="css/home.css">
<style>
    
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="main-app">
        <div class="test-question">
            <form action="/home/${id}" method="post">
                <c:forEach items="${questions}" var="que" varStatus="i">
                    <c:if test="${i.index eq 0}">
                        <div class="question">
                            <div class="content">${que.content}</div>
                            <div class="radiogroup" checked="false">
                                <div class="left">${que.leftOption}</div>
                                <c:forEach items="${que.examples}" var="exam" varStatus="status">
                                    <div><input type="radio" class="form-check-input ${status.index}"  name="result${que.id}" value="${que.id}${exam.id.id}"></div>
                                </c:forEach>
                                <div class="right">${que.rightOption}</div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${i.index ne 0}">
                        <div class="question inactive">
                            <div class="content">${que.content}</div>
                            <div class="radiogroup" checked="false">
                                <div class="left">${que.leftOption}</div>
                                <c:forEach items="${que.examples}" var="exam" varStatus="status">
                                    <div>
                                        <input type="radio" class="form-check-input ${status.index}"  name="result${que.id}" value="${que.id}${exam.id.id}">
                                    </div>
                                </c:forEach>
                                <div class="right">${que.rightOption}</div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="button-container">
                    <button type="submit" class="button" disabled>전송</button>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
