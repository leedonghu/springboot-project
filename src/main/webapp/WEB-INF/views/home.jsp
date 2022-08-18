<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    .wrapper{
        display: flex;
    }
</style>
<title>Insert title here</title>
</head>
<body>
    <form action="/home" method="post">
        <c:forEach items="${questions}" var="que">
            <div>${que.content}</div>
            <div class="wrapper">
                <c:forEach items="${que.examples}" var="exam">
                    <div><input type="radio" class="form-check-input"  name="${que.id}" value="${exam.id.id}"></div>
                </c:forEach>
            </div>
        </c:forEach>
        <button type="submit">전송</button>
    </form>
</body>
</html>
