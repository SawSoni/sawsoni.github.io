/*
    * go to top button function
*/

    window.onscroll = function() {scrollFunction()};
    // The onscroll event occurs when an element's scrollbar is being scrolled.
    function scrollFunction() {
        if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20){
            document.getElementById('myBtn').style.display = 'block';
        }else {
            document.getElementById('myBtn').style.display = 'none';
        }
    }
/* this function will execute after clicking button*/
    function topFunction(){
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
    /* adding event listener to the button*/
        myBtn.addEventListener('click', topFunction);