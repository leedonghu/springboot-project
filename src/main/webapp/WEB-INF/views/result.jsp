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
    <div class="container">
        <div id="title">${result}</div>
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
        <button onclick="location.href='/logout'" class="btn">
            <span class="span-button">확인</span>
        </button>
    </div>
     
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
