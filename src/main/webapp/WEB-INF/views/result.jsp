<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- You can use Open Graph tags to customize link previews.
Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<meta property="og:url"           content="https://localhost:8080/result/맨유" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="test" />
<meta property="og:description"   content="test" />
<meta property="og:image"         content="https://ifh.cc/g/9vgczC.jpg" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/result.css">

<title>Insert title here</title>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <a href="/home">
                <img src="/img/logo.png" alt="">
            </a>
        </div>
        <div class="option">
            <div class="home">
                <a href="/home">팀 추천</a>
            </div>
            <div class="statistics">
                <a href="/statistics">통계</a>
            </div>
        </div>
        <div class="space"></div>
    </div>
    <div class="container">
        <div id="title">${result.name}</div>
        <div class="address">
            <div class="homepage-address">
                <a href="${result.address.homepage}">홈페이지</a>  
            </div>
            <div class="facebook-address">
                <a href="${result.address.facebook}">페이스북</a>
            </div>
            <div class="instagram-address">
                <a href="${result.address.instagram}">인스타그램</a>
            </div>
            <div class="youtube-address">
                <a href="${result.address.youtube}">youtube</a>
            </div>
        </div>
        <button onclick="location.href='/logout'" class="btn">
            <span class="span-button">확인</span>
        </button>
    </div>
    <div class="share">
        <div class="kakao">
            <a id="kakaotalk-sharing-btn">
                <img src="/img/kakao.png" alt="" width="50px" height="50px">
            </a>
        </div>
        <div class="facebook">
            <a id="facebook-btn">
                <img src="/img/facebook.png" alt="" width="50px" height="50px">
            </a>
        </div>
        <div class="naver">
            <a id="naver-btn" href="javascript:sendNaverLine();">
                <img src="/img/line.png" alt="" width="50px" height="50px">
            </a>
        </div>

    </div>
    <footer>
        <div class="notice">
            <strong>주의사항 : </strong>
            해당 사이트는 사이드 프로젝트로 만들어진 것으로 <strong>질문이나 결과에 어떠한 공신력도 없습니다.</strong>
            혹여나 문제점이 발견되시면 아래의 이메일로 문의해주시면 감사하겠습니다.
        </div>
        <div class="contact">contact : ldh930517@gmail.com</div>
    </footer>
     
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/result.js"></script>
<script>
    var title = document.getElementById('title').innerText;
    var manuUrl = 'https://ifh.cc/g/9vgczC.jpg';
    var mancUrl = 'https://ifh.cc/g/AJ0oR9.jpg';
    var rivUrl = 'https://ifh.cc/g/dJSJ9W.jpg';
    var totUrl = 'https://ifh.cc/g/THmAKr.png';
    var cheUrl = 'https://ifh.cc/g/hBYB2n.jpg';
    var arsUrl = 'https://ifh.cc/g/bt1aAo.png';

    var url = '';
    var link = document.getElementById('kakaotalk-sharing-btn');
    switch(title){
        case '맨유' : url = manuUrl;
        break;

        case '맨시티' : url = mancUrl;
        break;

        case '리버풀' : url = rivUrl;
        break;

        case '토트넘' : url = totUrl;
        break;

        case '첼시' : url = cheUrl;
        break;

        case '아스날' : url = arsUrl;
        break;
    }

    function sendNaverLine(){
      
      var title = "나에게 어울리는 축구팀은";
    //   var link = "http://localhost:8080/home";
      var img = url;
      var lineUrl = "http://line.me/R/msg/text/?" + encodeURIComponent(title+img);
      return lineUrl;
    }
</script>

</html>
