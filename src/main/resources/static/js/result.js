window.onload = function(){
    Kakao.init('3b751d01e9c710efb57fdf81a42def17');
    console.log(Kakao.isInitialized());
    var title = document.getElementById('title').innerText;
    var manuUrl = 'https://ifh.cc/g/9vgczC.jpg';
    var mancUrl = 'https://ifh.cc/g/AJ0oR9.jpg';
    var rivUrl = 'https://ifh.cc/g/dJSJ9W.jpg';
    var totUrl = 'https://ifh.cc/g/THmAKr.png';
    var cheUrl = 'https://ifh.cc/g/hBYB2n.jpg';
    var arsUrl = 'https://ifh.cc/g/bt1aAo.png';

    var url = '';
    var container = document.getElementsByClassName('container')[0];
    var link = document.getElementById('kakaotalk-sharing-btn');
    switch(title){
        case '맨유' : url = manuUrl;
        container.style.backgroundColor = "#ec2b2e";
        break;

        case '맨시티' : url = mancUrl;
        container.style.backgroundColor = "#6cadde";
        break;

        case '리버풀' : url = rivUrl;
        container.style.backgroundColor = "#d4001f";
        break;

        case '토트넘' : url = totUrl;
        container.style.backgroundColor = "#fff";
        break;

        case '첼시' : url = cheUrl;
        container.style.backgroundColor = "#001487";
        break;

        case '아스날' : url = arsUrl;
        container.style.backgroundColor = "#e50007";
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
              description: title,
              imageUrl:
              url,
              link: {
                mobileWebUrl: 'https://localhost:8080/home',
                webUrl: 'https://localhost:8080/home',
              },
            },
            // itemContent: {
            //   profileText: 'Kakao',
            //   profileImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            //   titleImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            //   titleImageText: 'Cheese cake',
            //   titleImageCategory: 'Cake',
            //   items: [
            //     {
            //       item: 'Cake1',
            //       itemOp: '1000원',
            //     },
            //     {
            //       item: 'Cake2',
            //       itemOp: '2000원',
            //     },
            //     {
            //       item: 'Cake3',
            //       itemOp: '3000원',
            //     },
            //     {
            //       item: 'Cake4',
            //       itemOp: '4000원',
            //     },
            //     {
            //       item: 'Cake5',
            //       itemOp: '5000원',
            //     },
            //   ],
            //   sum: 'Total',
            //   sumOp: '15000원',
            // },
            // social: {
            //   likeCount: 10,
            //   commentCount: 20,
            //   sharedCount: 30,
            // },
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
      window.open("https://www.facebook.com/sharer/sharer.php?u="+ encodeURIComponent("https://sports.news.naver.com/news?oid=417&aid=0000858571"), "_blank", "width=600,height=400");
    });

    
}