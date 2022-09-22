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

    [type="radio"]{
        appearance: none;
        border: max(2px, 0.1em) solid #33a474;
        border-radius: 50%;
        width: 2em;
        height: 2em;
    }

    [type="radio"]:checked{
        background-color: #33a474;
    }

    [type="radio"]:focus-visible{
        outline-offset: max(2px, 0.1em);
        outline: max(2px, 0.1em) dotted #33a474;
    }

    [type="radio"]:hover{
        box-shadow: 0 0 0 max(4px, 0.1em) lightgray;
        cursor: pointer;
    }
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="dicision" role="radiogroup">
        <div class="option" role="radio" aria-checked="false">
            <span></span>
        </div>
        <div class="option" role="radio" aria-checked="false">
            <span></span>
        </div>
        <div class="option" role="radio" aria-checked="false">
            <span></span>
        </div>
        <div class="option" role="radio" aria-checked="false">
            <span></span>
        </div>
        <div class="option" role="radio" aria-checked="false">
            <span></span>
        </div>
    </div>
    <div class="radio">
        <input type="radio" name="1">
        <input type="radio" name="1">
        <input type="radio" name="1">
        <input type="radio" name="1">
        <input type="radio" name="1">
    </div>
</body>
<script>
    let button = document.getElementsByClassName("option");
    console.log(button);
    for(let i = 0; i<button.length; i++){
        button[i].addEventListener("click", function(){
            if(this.classList.contains('active')){
                this.classList.remove('active');
                this.style.backgroundColor = "white";
            }else{
                this.classList.add('active');
                this.style.backgroundColor = "#33a474";
            }
        });
    }
</script>
</html>
