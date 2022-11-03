<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- You can use Open Graph tags to customize link previews.
Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<meta property="og:url"           content="https://football-club-matching.herokuapp.com/home" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="나에게 어울리는 축구팀" />
<meta property="og:description"   content="PL의 BIG6팀중 한팀을 추천해 드립니다" />
<meta property="og:image"         content="${result.imgUrl}" />
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
            <div class="address-title">
                공식 사이트
            </div>
            <div class="address-link">
                <div class="homepage-address">
                    <a href="${result.address.homepage}">
                        <img src="/img/축구공.jpg" alt="" id="address-img" width="40px" height="40px">
                    </a>  
                </div>
                <div class="facebook-address">
                    <a href="${result.address.facebook}">
                        <img src="/img/facebook.png" alt="" width="40px" height="40px">
                    </a>
                </div>
                <div class="instagram-address">
                    <a href="${result.address.instagram}">
                        <img src="/img/인스타.png" alt="" width="40px" height="40px">
                    </a>
                </div>
                <div class="youtube-address">
                    <a href="${result.address.youtube}">
                        <img src="/img/유튜브.png" alt="" width="40px" height="40px">
                    </a>
                </div>
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
            <a id="naver-btn">
                <img src="/img/line.png" alt="" width="50px" height="50px">
            </a>
        </div>
        <div id="fb-root"></div>
        <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">공유</a></div>
    </div>
    <footer>
        <div class="notice">
            <strong>주의사항 : </strong>
            해당 사이트는 사이드 프로젝트로 만들어진 것으로 <strong>질문이나 결과에 어떠한 공신력도 없습니다.</strong>
            혹여나 문제점이 발견되시면 아래의 이메일로 문의해주시면 감사하겠습니다.
        </div>
        <div class="contact">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;e-mail : ldh930517@gmail.com</span>
        </div>
    </footer>
    
</body>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v15.0" nonce="5juMjy7F"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/result.js"></script>


</html>
