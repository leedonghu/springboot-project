<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/result.css">

<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <div id="title">${result}</div>
        <div class="share">
            <div class="kakao">
                <a id="kakaotalk-sharing-btn">
                    <img src="/img/kakao.png" alt="" width="50px" height="50px">
                </a>
            </div>
        </div>
        <button onclick="location.href='/logout'" class="btn">
            <span class="span-button">확인</span>
        </button>
    </div>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/result.js"></script>
</html>
