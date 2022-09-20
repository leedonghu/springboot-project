<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    .dicision{
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    .option{
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        border: 2px solid #33a474;
        width: 20px;
        height: 20px;
        cursor: pointer;
    }

    span{
        display: inline-block;
    }
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="dicision">
        <div class="option">
            <span></span>
        </div>
        <div class="option">
            <span></span>
        </div>
        <div class="option">
            <span></span>
        </div>
        <div class="option">
            <span></span>
        </div>
        <div class="option">
            <span></span>
        </div>
    </div>
</body>
<script>
    let button = document.getElementsByClassName("option");
    console.log(button);
    for(let i = 0; i<button.length; i++){
        button[i].addEventListener("click", function(){
            this.className += ' active';
            this.style.backgroundColor = "#33a474";
        });
    }
</script>
</html>
