window.onload = function(){
    var radios = document.getElementsByClassName("form-check-input");
    
    for(var i=0; i<radios.length; i++){
        if(radios[i].classList.contains('0')){
            radios[i].classList.add('left','max');
        }else if(radios[i].classList.contains('1')){
            radios[i].classList.add('left','min');
        }else if(radios[i].classList.contains('2')){
            radios[i].classList.add('mid');
        }else if(radios[i].classList.contains('3')){
            radios[i].classList.add('right','min');
        }else{
            radios[i].classList.add('right','max');
        }
    }

}

// 요소들이 DOM에 세워지기 전에 JS 코드가 먼저 돌아감
document.addEventListener("DOMContentLoaded", function(e){

    var input = document.getElementsByClassName("form-check-input");
    for(var radio of input){
        radio.addEventListener("change", function(){
            //console.log(this.parentElement.parentElement.parentElement);
            var active = this.parentElement.parentElement.parentElement;
            //console.log(active.classList);
            active.classList.add('inactive');
            //console.log(active.nextElementSibling);
            var next = active.nextElementSibling;
            next.classList.remove('inactive');
            next.scrollIntoView({behavior:"smooth", block:"center"});
            //console.log(this.checked);

            /** check attribute 변경 */
            var checked = this.parentElement.parentElement;
            checked.setAttribute('checked', 'true');
            
            
        });
    }

    /**버튼 클릭시 화면이동과 SUBMIT */
    var button = document.getElementsByClassName('button')[0];
    button.addEventListener("click", function(){
        var radioGroup = document.getElementsByClassName("radiogroup");
        
        var bool = radioCheck(radioGroup);
        
        if(bool === true){
            
            document.getElementById("question-form").submit();
        }else{
            radioGroup[bool].scrollIntoView({behavior:"smooth", block:"center"});
        }

    })

    
});

/** 라디오버튼 체크 했는지 확인하는 메소드
 * 모두 체크 해야지 true를 리턴하고 버튼을 활성화시킴
 * 체크가 안된 라디오그룹의 index 번호를 리턴
 */
function radioCheck(checked){
    
    var arr = [];
    for(var i=0; i<checked.length; i++){
        arr[i] = checked[i].getAttribute('checked')
    }

    for(var i=0; i<arr.length; i++){
        if(arr[i] == 'false'){
            
            return i;
        }
    }
    return true;
}



