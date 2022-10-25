window.onload = function(){
    var result = document.getElementById("result").innerText;
    console.log(result);

    setTimeout(go_url, 3500);
    function go_url(){
        location.href = "/result/"+result;
    }


}