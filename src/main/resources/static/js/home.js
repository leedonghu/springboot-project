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
        });
    }
});

