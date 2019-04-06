$(document).ready(function () {
    //product model toggle
    $("#singlestagetxt").click(function () {
        $("#singlestagediv").show();
        $("#twostagediv").hide();
    });
    $("#twostagetxt").click(function () {
        $("#twostagediv").show();
        $("#singlestagediv").hide();
    });

    //contact Branch toggle
    $("#Mumbai").click(function () {
        $(".textpad ul").hide();
        $("#Mumbaidiv").toggle();
    });
    $("#Delhi").click(function () {
        $(".textpad ul").hide();
        $("#Delhidiv").toggle();
    });
    $("#Ahmedabad").click(function () {
        $(".textpad ul").hide();
        $("#Ahmedabaddiv").toggle();
    });
    $("#kolkata").click(function () {
        $(".textpad ul").hide();
        $("#kolkatadiv").toggle();
    });
    $("#Chennai").click(function () {
        $(".textpad ul").hide();
        $("#Chennaidiv").toggle();
    });
    $("#Hyderabad").click(function () {
        $(".textpad ul").hide();
        $("#Hyderabaddiv").toggle();
    });
});