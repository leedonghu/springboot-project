<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="js/home.js">
<style>
    .main-app{
        margin-top: 100px;
        display: flex;
        justify-content: center;
    }
    .question{
        display: flex;
    }
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="main-app">
        <div class="test-question">
            <form action="/home/${id}" method="post">
                <c:forEach items="${questions}" var="que">
                    <div class="question">
                        <div class="content">${que.content}</div>
                        <div class="radiogroup">
                            <div class="left">왼쪽</div>
                            <c:forEach items="${que.examples}" var="exam">
                                <div><input type="radio" class="form-check-input"  name="result${que.id}" value="${que.id}${exam.id.id}"></div>
                            </c:forEach>
                            <div class="right">오른쪽</div>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit">전송</button>
            </form>
        </div>
    </div>
    
</body>
</html>
