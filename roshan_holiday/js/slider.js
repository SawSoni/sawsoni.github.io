function SliderCounter(ar){
    var x = 0;
    function forward(){
         x = (x+1) % ar.length;
        return ar[x];
    }
    function backward(){
         x = (x + ar.length - 1) % ar.length;
        return ar[x];
    }
    return {
        forward,
         backward
 };
}

var array = ["<img src='image/marina-bay-1435072_640.jpg' alt='img' >","<img src='image/singapore_Ferris_wheel_640.jpg' alt='img' >","<img src='image/familyHoliday_640.jpg'  alt='img'>","<img src='image/aircraft.jpg'  alt='img'>","<img src='image/artificial-trees.jpg' alt='img' >"];
    // var array = ["test1","test2","test3"];
    var slide = SliderCounter(array);
        
        function display_front(){
            var displayArea = document.getElementById('display');
                displayArea.innerHTML = slide.forward();
        }
        function display_back(){
            var displayArea = document.getElementById('display');
                displayArea.innerHTML = slide.backward();
        }

        document.getElementById('front').addEventListener('click',display_front);
        document.getElementById('back').addEventListener('click',display_back);