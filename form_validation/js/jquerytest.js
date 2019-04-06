$(document).ready(function(){
    // alert('Hello World');
    $('.flexslider').flexslider({
    animation: "slide"
    });

    $('#parent').click(function(){
        $('#blackBox').toggle("blind");
    });



 

})

//   $(window).load(function() {
//   $('.flexslider').flexslider({
//     animation: "slide"
//   });
// });