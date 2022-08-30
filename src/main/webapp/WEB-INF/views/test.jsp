<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/1a3214f3e3.js" crossorigin="anonymous"></script>
<style>
    .container{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .q{
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    .option:hover{
        cursor: pointer;
        display: table;
        
    }
    .max{
        width: 70px;
        height: 70px;
        
    }

    .med{
        width: 55px;
        height: 55px;
    }

    .mid{
        width: 35px;
        height: 35px;
    }
    span{
        display: table-cell;
		text-align: left;
		vertical-align: middle;
		text-align: right;
    }
</style>
<title>Insert title here</title>
</head>
<body>
    <form hidden action="/test/get" method="post" class="form">
        <input type="text" name="result1" value="" id="result1">
        <input type="text" name="result2" value="" id="result2">
        
    </form>
    <div class="container">
        <div class="q">
            <div class="option left max" data-value="11" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option left med" data-value="12" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option mid" data-value="13" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option right med" data-value="14" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option right max" data-value="15" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
        </div>
        <div class="q">
            <div class="option left max" data-value="21" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option left med" data-value="22" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option mid" data-value="23" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option right med" data-value="24" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
            <div class="option right max" data-value="25" aria-checked="false" role="checkbox">
                <span>
                    <i class="fa-solid fa-circle-check"></i>
                </span>
            </div>
        </div>
    </div>
    <button class="btn">버튼</button>
</body>

<script>
    let question1 = document.getElementsByClassName("q");
    console.log(question1);
    let option1 = question1[0];
    let option2 = question1[1];
    console.log(option1);
    console.log(option1.children[0]);
    let q1 = ""
    for(let i=0; i<option1.children.length; i++){
        option1.children[i].addEventListener("click", function(){
            q1 = this.getAttribute("data-value").substring(0,1);
            let id = "result" + q1;
            console.log(id);
            let input1 = document.getElementById(id);
            input1.setAttribute("value", this.getAttribute("data-value"));
            console.log(input1.getAttribute("value"));
        })
    }

    for(let i=0; i<option2.children.length; i++){
        option2.children[i].addEventListener("click", function(){
            q2 = this.getAttribute("data-value").substring(0,1);
            let id = "result" + q2;
            console.log(id);
            let input2 = document.getElementById(id);
            input2.setAttribute("value", this.getAttribute("data-value"));
            console.log(input2.getAttribute("value"));
        })
    }

    let btn = document.getElementsByClassName("btn");
    console.log(btn);
    btn[0].addEventListener("click", function(){
        let form = document.getElementsByClassName("form");
        form[0].submit();
    })
    console.log("q1 : "+q1);
</script>
</html>
