window.onload = function(){
    Kakao.init('3b751d01e9c710efb57fdf81a42def17');
    console.log(Kakao.isInitialized());
    console.log(true);
    var title = document.getElementById('title');
    var manuUrl = 'https://ifh.cc/g/9vgczC.jpg';
    var mancUrl = 'https://ifh.cc/g/AJ0oR9.jpg';
    var rivUrl = 'https://ifh.cc/g/dJSJ9W.jpg';
    var totUrl = 'https://ifh.cc/g/THmAKr.png';
    var cheUrl = 'https://ifh.cc/g/hBYB2n.jpg';
    var arsUrl = 'https://ifh.cc/g/bt1aAo.png';

    var url = '';
    var container = document.getElementsByClassName('container')[0];
    var link = document.getElementById('kakaotalk-sharing-btn');


    var img = document.getElementById('address-img');
    var totAddressTitle = document.getElementsByClassName('address-title')[0];
    var totAddressLink = document.getElementsByClassName('address-link')[0];
    
    console.log(img+" "+totAddressTitle+" "+totAddressLink+" "+title);
    console.log(totAddressLink[0]);
    switch(title.innerText){
        case '맨유' : url = manuUrl;
        container.style.backgroundColor = "#ec2b2e";
        img.src = "https://ifh.cc/g/9vgczC.jpg";
        break;

        case '맨시티' : url = mancUrl;
        container.style.backgroundColor = "#6cadde";
        img.src = "https://ifh.cc/g/AJ0oR9.jpg";
        break;

        case '리버풀' : url = rivUrl;
        container.style.backgroundColor = "#d4001f";
        img.src = "https://ifh.cc/g/dJSJ9W.jpg";
        break;

        case '토트넘' : url = totUrl;
        container.style.backgroundColor = "#fff";
        title.style.color = "#000";
        totAddressTitle.style.color = "#000";
        totAddressTitle.style.border = "1px double #000";
        totAddressLink.style.border = "1px double #000";
        img.src = "https://ifh.cc/g/THmAKr.png";
        break;

        case '첼시' : url = cheUrl;
        container.style.backgroundColor = "#001487";
        img.src = "https://ifh.cc/g/hBYB2n.jpg";
        break;

        case '아스날' : url = arsUrl;
        container.style.backgroundColor = "#e50007";
        img.src = "https://ifh.cc/g/bt1aAo.png";
        break;
    }
    kakao();
    // link.addEventListener('click', function(){
        
    // });
    
    function kakao(){
        Kakao.Share.createDefaultButton({
            container: '#kakaotalk-sharing-btn',
            objectType: 'feed',
            content: {
              title: '당신에게 어울리는 축구팀',
              description: title.innerText,
              imageUrl:
              url,
              link: {
                mobileWebUrl: 'https://localhost:8080/home',
                webUrl: 'https://localhost:8080/home',
              },
            },
            buttons: [
              {
                title: '웹으로 이동',
                link: {
                  mobileWebUrl: 'https://localhost:8080/home',
                  webUrl: 'https://localhost:8080/home',
                },
              },
              {
                title: '앱으로 이동',
                link: {
                  mobileWebUrl: 'https://localhost:8080/home',
                  webUrl: 'https://localhost:8080/home',
                },
              },
            ],
          });
    }

    var facebook = document.getElementById('facebook-btn');
    facebook.addEventListener('click', function(){
      
      console.log("click");
      /** localhost는 공유가 안됨, 고정 아이피사용 */ 
      window.open("https://www.facebook.com/sharer/sharer.php?u="+ encodeURIComponent("https://football-club-matching.herokuapp.com/result/맨유"), title.innerText, "width=600,height=400");
    });
    
    function sendNaverLine(){
          
      var title = "나에게 어울리는 축구팀은";
    //   var link = "http://localhost:8080/home";
      var summary = "PL의 BIG6중 어울리는 팀을 추천해드립니다";
      var link = "https://football-club-matching.herokuapp.com/home";
      var img = "${result.imgUrl}";
      console.log(img);
      var lineUrl = "http://line.me/R/msg/text/?" + encodeURIComponent(title+"\n"+summary+"\n"+link+"\n"+img);
    //   document.location = lineUrl;
      window.open(lineUrl);
    }



    var naver = document.getElementById("naver-btn");
    console.log(naver);
    naver.addEventListener("click", sendNaverLine);
}