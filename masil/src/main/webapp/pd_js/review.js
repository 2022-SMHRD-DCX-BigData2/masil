const allStars = document.querySelectorAll('.star');
let current_rating = document.querySelector('.current_rating');

allStars.forEach( (star, i) => {
    star.onclick = function() {
        let current_star_level = i + 1;
        current_rating.innerText = `${current_star_level} of 5`

        allStars.forEach( (star, j) => {
            if( current_star_level >= j + 1 ) {
                star.innerHTML = '&#9733';
                
            } else {
                star.innerHTML = '&#9734';
            }

        })
      
    }

})

function clearInput(){



    /* 텍스트박스 지우는 부분 */
    
    
    
    var el = document.getElementsByClassName('input-text');
    
    
    
    for(var i=0; i<el.length; i++){
    
        el[i].value = '';
    
    }
}