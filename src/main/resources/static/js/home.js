window.onload = function(){
    var radios = document.getElementsByClassName("form-check-input");
    console.log(radios);
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
