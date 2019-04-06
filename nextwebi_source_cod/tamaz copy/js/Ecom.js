
function cartStatus(data1) {
    var spanid = $("#cart-total").text();
    var url = data1 + "/productget1";
    var apikey = getKey("apiKey");
    var parameter = { "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            var cart = "";
            var cart1 = "";
            var cart2 = "";
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!");
                if (sess[1] == "") {
                    $("#cart-total").html(item.toString() + " items(s)  ");
                }
                var count = 1;
                var prslt = sess[1].split("|");
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = data1 + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    var a = $.ajax({ type: 'POST', url: url1, data: JSON.stringify(parameter1), contentType: 'application/json; charset=utf-8', async: false });
                    cost = cost + a.responseJSON.d;
                    cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                    cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                    cart2 = cart2 + "<tr class='first odd'><td class='image'><a class='product-image' title='" + prslt1[2] + "' href='#/women-s-crepe-printed-black/'><img width='75' height='75' alt='" + prslt1[2] + "' src='" + prslt1[3] + "'></a></td><td><h2 class='product-name'> <a href='#/women-s-crepe-printed-black/'>" + prslt1[2] + "</a> </h2></td><td class='a-center'><a title='Edit item parameters' class='edit-bnt' href='#configure/id/15945/'></a></td><td class='a-right'><span class='cart-price'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </span></td><td class='a-center movewishlist'><input maxlength='12' class='input-text qty' title='Qty' size='4' value='" + prslt1[1] + "' name='cart[15945][qty]'></td><td class='a-right movewishlist'><span class='cart-price'> <span class='price'>" + prslt1[4] + "</span> </span></td><td class='a-center last'><a class='button remove-item' title='Remove item' href='#'><span><span>Remove item</span></span></a></td></tr>";
                    $("#cartdetail").html(cart);
                    $("#cart-details2").html(cart1);
                    $("#cart-details3").html(cart2);
                                
                }
                $("#cart-total").html(item.toString() + " items(s)  ");
                $("#total").text(cost.toString());
                $("#cart-total2").html(item.toString() + " items(s)  ");
                $("#total2").text(cost.toString());
                $("#total3").text(cost.toString());
            }
            else {
                $("#cart-total").text("0 items(s)");
            }

        },
        error: function (data, success, error) {
            alert("Error : " + error);
        }
    });
}
function ClearCart(urlVal) {
    var rslt = confirm("Are you sure to Clear the Cart ?");
    if (rslt == true) {
        var url = urlVal;
        var apikey = getKey("apiKey");
        var parameter = { "apiKey": apikey }
        $.ajax({
            type: 'POST',
            url: url,
            data: JSON.stringify(parameter),
            contentType: 'application/json; charset=utf-8',
            dataType: 'text',
            success: function (data) {
                $("#cartdetail").html("");
                $("#cart-details3").html("");
                $("#cart-total").html("0 items(s)  ");
                $("#total").text("0");
                $("#total3").text("0");
                alert("Cart is Cleared !");

            }
        });
    }

}
function IsLogin(urlVal) {
    var url = urlVal + "/LoginDetails";
    var apikey = getKey("apiKey");
    var parameter = { "apiKey": apikey }
    var id= $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',asyn:false
    });var id1 = "";
    $(document).ajaxComplete(function () {
        debugger;
        id1 = id.responseJSON.d;
        if (id1 == "a") {
            $("#modal-stage-1").fadeOut();
            $("#glp-auth-tab").fadeIn();
        }
        else {
            $("#modal-stage-1").fadeIn();
            $("#glp-auth-tab").fadeOut();
        }
    });
    return id1;
}
function LoginDetails(urlVal) {
    var url = urlVal + "/LoginDetails";
    var apikey = getKey("apiKey");
    var parameter = { "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        //dataType: 'text',
        success: function (data) {
            if (data.d != "a") {
                $("#dmsg").html("Welcome, " + data.d);
                $("#alogout").html("Logout");
            }

        }
    });


}
function LogOut(urlVal, index) {
    alert("hi");
    var url = urlVal + "/LogOut";
    var apikey = getKey("apiKey");
    var parameter = { "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        //dataType: 'text',
        success: function (data) {
            if (index == "1") {
                window.location = "Login.aspx";
            }
            else {
                window.location = "../Login.aspx";
            }
        }
    });


}
function cartStatus2(data1) {
    var spanid = $("#cart-total").text();
    var url = data1 + "/productget1"; ;
    var apikey = getKey("apiKey");
    var parameter = { "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            var cart = "";
            var cart1 = "";
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!");
                if (sess[1] == "") {
                    $("#cart-total").html(item.toString() + " items(s)  ");
                    //$("#totalrow").addClass("hide"); $("#viewcartlink").addClass("hide"); $("#checkoutlink").addClass("hide"); $("#default").addClass("show"); 
                }
                var count = 1;
                var prslt = sess[1].split("|");
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = data1 + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    $.ajax({
                        type: 'POST',
                        url: url1,
                        data: JSON.stringify(parameter1),
                        contentType: 'application/json; charset=utf-8',
                        //dataType: 'text',
                        success: function (data2) {
                            if (data2.d == 0) {
                                cost = "contact for price";
                            }
                            else {
                                cost = cost + data2.d;
                                cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='../" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + data2.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                                cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='../" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + data2.d / prslt1[1] + "</span> </div></li>";
                                //" <tr class='" + prslt1[0] + "'><td class='image'><a href='#'><img title='" + prslt1[2] + "' width='43' height='43' src='../" + prslt1[3] + "'></a></td><td class='name'><a href='#'>" + prslt1[2] + "</a></td><td class='quantity'><span id='quantity" + prslt1[0] + "' >x " + prslt1[1] + "</span></td><td class='total'><span id='total" + prslt1[0] + "' >" + prslt1[4] + "</span></td><td class='tdrem'><a id='remove-" + prslt1[0] + "' class='remove1'><img title='Remove'   src='../image/remove-small.png'></a></td></tr>";
                                $("#cartdetail").html(cart);
                                $("#cart-details2").html(cart1);
                                $("#cart-total").html(item.toString() + " items(s)  ");
                                $("#total").text(cost.toString());
                                $("#cart-total2").html(item.toString() + " items(s)  ");
                                $("#total2").text(cost.toString());
                            }
                            //
                        }
                    });

                }

            }
            else {
                $("#cart-total").text("0 items(s)");
            }

        },
        error: function (data, success, error) {
            alert("Error : " + error);
        }
    });
}
function removeItem(data1, data2,sourceVal) {
    var pid = data2.split("-");
    //alert(btnid);
    var url = data1 + "/productremove";          //'<%= ResolveUrl("../Default.aspx/productremove") %>';
    var apikey = getKey("apiKey");
    var parameter = { "pid": pid[1], "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            debugger;
            var cart = "";
            var cart1 = "";
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!"); if (sess[1] == "") {
                    $("#cart-total").html("0 items(s)  "); $("#cartdetail").html("");
                    $("#cart-details2").html(""); $("#total").text(0);
                    $("#cart-total2").html("0 items(s)  ");
                    $("#total2").text(0);
                    //$("#totalrow").addClass("hide"); $("#viewcartlink").addClass("hide"); $("#checkoutlink").addClass("hide"); $("#default").addClass("show"); 
                }
                else { $("#totalrow").removeClass("hide"); $("#viewcartlink").removeClass("hide"); $("#checkoutlink").removeClass("hide"); $("#default").removeClass("show"); }
                //alert(sess[1]);
                var count = 1;
                var prslt = sess[1].split("|");
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = data1 + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    var a = $.ajax({ type: 'POST', url: url1, data: JSON.stringify(parameter1), contentType: 'application/json; charset=utf-8', async: false });
                    cost = cost + a.responseJSON.d;
                    if (sourceVal == 1) {
                        cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                        cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                    }
                    else {
                        cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='../" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                        cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='../" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                    }
                    //" <tr class='" + prslt1[0] + "'><td class='image'><a href='#'><img title='" + prslt1[2] + "' width='43' height='43' src='../" + prslt1[3] + "'></a></td><td class='name'><a href='#'>" + prslt1[2] + "</a></td><td class='quantity'><span id='quantity" + prslt1[0] + "' >x " + prslt1[1] + "</span></td><td class='total'><span id='total" + prslt1[0] + "' >" + prslt1[4] + "</span></td><td class='tdrem'><a id='remove-" + prslt1[0] + "' class='remove1'><img title='Remove'   src='../image/remove-small.png'></a></td></tr>";
                    $("#cartdetail").html(cart);
                    $("#cart-details2").html(cart1);
                }
                $("#cart-total").html(item.toString() + " items(s)  ");
                $("#total").text(cost.toString());
                $("#cart-total2").html(item.toString() + " items(s)  ");
                $("#total2").text(cost.toString());
                //alert("Product has been removed from your shopping cart");
            }
            else {
                //$("#cartdetail").text(
                $("#cart-total").text("0 items(s) ");
            }
        } //,
                    ,
        error: function (data, success, error) {
            debugger;
            alert("Error : " + error);
        }
    });
}

function callMeBackValidation(mobile, name, tim) {
    if (mobile == "" || isNaN(mobile) || mobile.length < 10) {
        alert("Please, enter valid Mobile Number."); return false;
    }
    if (name == "" || name == null) {
        alert("Please, enter your name."); return false;
    }
    if (tim == "" || tim == null) {
        alert("Please, enter the Time."); return false;
    }
}

function addItems(urlVal, idVal) {//alert("hello");
    var spanid = $("#cart-total").text();
    var btnid = idVal;
    var pid = btnid.split("-");
    //alert(btnid);
    var url = urlVal + "/productget"; 
    var apikey = getKey("apiKey");
    var parameter = { "pid": pid[1], "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            var cart = "";
            var cart1 = "";
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!");
                //alert(sess[1]);
                var count = 1;
                var prslt = sess[1].split("|");
                if (sess[1] == "") {
                    //   $("#totalrow").addClass("hide"); $("#viewcartlink").addClass("hide"); $("#checkoutlink").addClass("hide"); $("#default").addClass("show"); 
                    $("#cart-total").html(item.toString() + " items(s)  ");
                }
                else { $("#totalrow").removeClass("hide"); $("#viewcartlink").removeClass("hide"); $("#checkoutlink").removeClass("hide"); $("#default").removeClass("show"); }
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = urlVal + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    var a = $.ajax({ type: 'POST', url: url1, data: JSON.stringify(parameter1), contentType: 'application/json; charset=utf-8', async: false });
                    cost = cost + a.responseJSON.d;
                    cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                    cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                }

                alert("Product is added to your shopping cart.");
            }
            else {
                //$("#cartdetail").text(
                $("#cart-total").text("0 items(s) ");
            }
            $("#cartdetail").html(cart);
            $("#cart-details2").html(cart1);
            $("#cart-total").html(item.toString() + " items(s)  ");
            //$("#cart-total").text(item.toString() + " items(s) - " + cost.toString());
            $("#total").text(cost.toString());
            $("#cart-total2").html(item.toString() + " items(s)  ");
            $("#total2").text(cost.toString());
        }
                           ,
        error: function (data, success, error) {
            alert("Error : " + error);
        }
    });
}

function addItemsFromCategory(urlVal, idVal) {
    var spanid = $("#cart-total").text();
    var btnid = idVal;
    var pid = btnid.split("-");
    //alert(btnid);
    var url = urlVal + "/productget";
    var apikey = getKey("apiKey");
    var parameter = { "pid": pid[1], "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            var cart = "";
            var cart1 = ""; debugger;
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!"); if (sess[1] == "") {
                    $("#cart-total").html(item.toString() + " items(s)  ");
                    //$("#totalrow").addClass("hide"); $("#viewcartlink").addClass("hide"); $("#checkoutlink").addClass("hide"); $("#default").addClass("show"); 
                }
                else { $("#totalrow").removeClass("hide"); $("#viewcartlink").removeClass("hide"); $("#checkoutlink").removeClass("hide"); $("#default").removeClass("show"); }
                //alert(sess[1]);
                var count = 1;
                var prslt = sess[1].split("|");
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = urlVal + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    var a = $.ajax({ type: 'POST', url: url1, data: JSON.stringify(parameter1), contentType: 'application/json; charset=utf-8', async: false });
                    cost = cost + a.responseJSON.d;
                    cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='../" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                    cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='../" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                    // " <tr class='" + prslt1[0] + "'><td class='image'><a href='#'><img title='" + prslt1[2] + "' width='43' height='43' src='../" + prslt1[3] + "'></a></td><td class='name'><a href='#'>" + prslt1[2] + "</a></td><td class='quantity'><span id='quantity" + prslt1[0] + "' >x " + prslt1[1] + "</span></td><td class='total'><span id='total" + prslt1[0] + "' >" + prslt1[4] + "</span></td><td class='tdrem'><a id='remove-" + prslt1[0] + "' class='remove1'><img title='Remove'   src='../image/remove-small.png'></a></td></tr>"
                    $("#cartdetail").html(cart);
                    $("#cart-details2").html(cart1);
                }
                $("#cart-total").html(item.toString() + " items(s)  ");
                //$("#cart-total").text(item.toString() + " items(s) - " + cost.toString());
                $("#total").text(cost.toString());
                $("#cart-total2").html(item.toString() + " items(s)  ");
                $("#total2").text(cost.toString());
                alert("Product is added to your shopping cart.");
            }
            else {
                //$("#cartdetail").text(
                $("#cart-total").text("0 items(s) ");
            }
        } //,
        //error: function (data, success, error) {
        // alert("Error : " + error);
        //}
    });
}

function callProduct(urlVal, idVal,type) {
    var spanid = $("#cart-total").text();
    var btnid = idVal;
    var pid = btnid.split("-");
    //alert(pid[1]);
    var val2 = $("#qty").val();
    //alert(btnid);
    var url = "";
    if (type == 1) {
        url = urlVal+"/productget";
    }
    else {
        url = urlVal + "/productget2";
    }
    var apikey = getKey("apiKey");
    var parameter = { "pid": pid[1], "count": val2, "apiKey": apikey }
    debugger;
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'text',
        success: function (data) {
            // alert("url");
            var cart = "";
            var cart1 = "";
            var scrapStr = data.split("\"");
            if (scrapStr[3] != "") {
                var sess = scrapStr[3].split("!");
                //alert(sess[1]);
                var count = 1;
                var prslt = sess[1].split("|");
                if (sess[1] == "") {
                    $("#cart-total").html(item.toString() + " items(s)  ");
                    //$("#totalrow").addClass("hide"); $("#viewcartlink").addClass("hide"); $("#checkoutlink").addClass("hide"); $("#default").addClass("show"); 
                }
                else { $("#totalrow").removeClass("hide"); $("#viewcartlink").removeClass("hide"); $("#checkoutlink").removeClass("hide"); $("#default").removeClass("show"); }
                var item = 0;
                var cost = 0;
                for (var i = 1; i < prslt.length; i++) {
                    var prslt1 = prslt[i].split(",");
                    item = item + parseInt(prslt1[1]);
                    var url1 = urlVal + "/UnitPrice";
                    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
                    var a = $.ajax({ type: 'POST', url: url1, data: JSON.stringify(parameter1), contentType: 'application/json; charset=utf-8', async: false });
                    cost = cost + a.responseJSON.d;
                    cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='../" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                    cart1 = cart1 + "<li class='item'> <a class='product-image' title='" + prslt1[2] + "' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='" + prslt1[2] + "' src='../" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + a.responseJSON.d / prslt1[1] + "</span> </div></li>";
                    //" <tr class='" + prslt1[0] + "'><td class='image'><a href='#'><img title='" + prslt1[2] + "' width='43' height='43' src='../" + prslt1[3] + "'></a></td><td class='name'><a href='#'>" + prslt1[2] + "</a></td><td class='quantity'><span id='quantity" + prslt1[0] + "' >x " + prslt1[1] + "</span></td><td class='total'><span id='total" + prslt1[0] + "' >" + prslt1[4] + "</span></td><td class='tdrem'><a id='remove-" + prslt1[0] + "' class='remove1'><img title='Remove'   src='../image/remove-small.png'></a></td></tr>"
                    $("#cartdetail").html(cart);
                    $("#cart-details2").html(cart1);
                }
                $("#cart-total").html(item.toString() + " items(s)  ");
                //$("#cart-total").text(item.toString() + " items(s) - " + cost.toString());
                $("#total").text(cost.toString());
                $("#cart-total2").html(item.toString() + " items(s)  ");
                $("#total2").text(cost.toString());
                alert("Product is added to your shopping cart.");
            }
            else {
                //$("#cartdetail").text(
                $("#cart-total").text("0 items(s) ");
            }
        },
        error: function (data, success, error) {
            alert("Error : " + error);
        }
    });

}

function getKey(name) {
    var nameEQ = name + "="; var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return null;
}
function pop(loc, urlVal, id) {
    if (loc == 1) {
        var apikey = getKey("apiKey");
        var parameter1 = { "apiKey": apikey };
        var url1 = urlVal + "/getIndex";
        $.ajax({
            type: 'POST',
            url: url1,
            data: JSON.stringify(parameter1),
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            success: function (data1) {
                var parameter = { "lastIdVal": data1.d, "apiKey": apikey };
                var url = urlVal + "/PopulateFeature";
                $.ajax({ type: 'POST',
                    url: url, data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    dataType: "json",
                    success: function (data) {
                        var isFeatured = "";
                        for (var i = 0; i < data.d.fp.length; i++) {
                            var ribbon = "";
                            if (data.d.fp[0].hotSelling == "Yes")
                            { ribbon = "<div class='sale-label sale-top-right'><div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div></div>"; } if (i % 3 == 0 || i == 0) { isFeatured = isFeatured + " <ul class='products-grid'>"; } isFeatured = isFeatured + "<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-6'><div class='col-item'>" + ribbon + "<div  class='product-image-area' style='border:1px solid #ccc;padding:10px;'> <a class='product-image' title='" + data.d.fp[i].name + "' href='" + data.d.fp[i].url + "'> <img src='" + data.d.fp[i].image + "' class='img-responsive' alt='a' /> </a></div><div class='info'><div class='info-inner'><div class='item-title'><a title=' " + data.d.fp[i].name + "' href='" + data.d.fp[i].url + "'> " + data.d.fp[i].name + " </a> </div><div class='item-content'><div class='ratings'><div class='rating-box'><div style='width:" + ((data.d.fp[i].rating) * 20) + "%' class='rating'></div> </div> </div><div class='price-box'><p class='special-price'> <span class='price'> " + data.d.fp[i].finalPrice + "</span> </p></div></div></div><div class='actions'><input type='button'class='button  btn-cart' id='btn-" + data.d.fp[i].guid + " '  onclick='return false;' value='Add to Cart'/></div><div class='clearfix'> </div></div></div></li>";
                            if (i % 3 == 2 || (i + 1) == data.d.fp.length) {
                                isFeatured = isFeatured + "</ul>";
                            }
                        }
                        $(id).append(isFeatured);
                    },
                    error: function (error) {
                        //alert('error; ' + error.responseJSON.Message);
                        //window.location=
                    }
                });
            }
        });
    }

}
function popc(loc, urlVal, id, category) {
    if (loc == 1) {
        var apikey = getKey("apiKey");
        var parameter1 = { "apiKey": apikey };
        var url1 = urlVal + "/getIndex";
        $.ajax({
            type: 'POST',
            url: url1,
            data: JSON.stringify(parameter1),
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            success: function (data1) {
                var parameter = { "lastIdVal": data1.d, "apiKey": apikey, "category": category };
                var url = urlVal + "/PopulateFeatureCat";
                $.ajax({ type: 'POST',
                    url: url, data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    dataType: "json",
                    success: function (data) {
                        var isFeatured = "";
                        for (var i = 0; i < data.d.fp.length; i++) {
                            var ribbon = "";
                            if (data.d.fp[0].hotSelling == "Yes")
                            { ribbon = "<div class='sale-label sale-top-right'><div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div></div>"; } if (i % 3 == 0 || i == 0) { isFeatured = isFeatured + " <ul class='products-grid'>"; } isFeatured = isFeatured + "<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-6'><div class='col-item'>" + ribbon + "<div  class='product-image-area' style='border:1px solid #ccc;padding:10px;'> <a class='product-image' title='" + data.d.fp[i].name + "' href='" + data.d.fp[i].url + "'> <img src='" + data.d.fp[i].image + "' class='img-responsive' alt='a' /> </a></div><div class='info'><div class='info-inner'><div class='item-title'><a title=' " + data.d.fp[i].name + "' href='" + data.d.fp[i].url + "'> " + data.d.fp[i].name + " </a> </div><div class='item-content'><div class='ratings'><div class='rating-box'><div style='width:" + ((data.d.fp[i].rating) * 20) + "%' class='rating'></div> </div> </div><div class='price-box'><p class='special-price'> <span class='price'> Rs. " + data.d.fp[i].finalPrice + "</span> </p></div></div></div><div class='actions'><input type='button'class='button  btn-cart' id='btn-" + data.d.fp[i].guid + " '  onclick='return false;' value='Add to Cart'/></div><div class='clearfix'> </div></div></div></li>";
                            if (i % 3 == 2 || (i + 1) == data.d.fp.length) {
                                isFeatured = isFeatured + "</ul>";
                            }
                        }
                        $(id).append(isFeatured);
                    },
                    error: function (error) {
                        //alert('error; ' + error.responseJSON.Message);
                       // window.location=
                    }
                });
            }
        });
    }

}

function GetPrice(urlVal, Currency, amount) {
    var url1 = urlVal + "/UnitPrice";
    var parameter1 = { "currency": "INR", "amount": prslt1[4], "apiKey": apikey }
    $.ajax({
        type: 'POST',
        url: url1,
        data: JSON.stringify(parameter1),
        contentType: 'application/json; charset=utf-8',
        //dataType: 'text',
        success: function (data2) {
            debugger;
            if (data2.d == 0) {
                cost = "contact for price";
            }
            else {
                cost = cost + data2.d;
                cart = cart + " <li class='item  even'> <a  class='product-image' href='#' title='" + prslt1[2] + "' ><img alt='" + prslt1[2] + "'  src='" + prslt1[3] + "' width='60' style='padding:1.5px;margin-left:2px'></a><div class='detail-item'><div class='product-details tdrem'> <a href='#' title='Remove This Item' id='remove-" + prslt1[0] + "' class='glyphicon glyphicon-remove'>&nbsp;</a> <a class='glyphicon glyphicon-pencil' title='Edit item' href='#'>&nbsp;</a><p class='product-name'> <a href='#' title='" + prslt1[2] + "'>" + prslt1[2] + " </a> </p></div><div class='product-details-bottom'> <span class='price'>" + data2.d / prslt1[1] + "</span> <span class='title-desc'>Qty:</span> <strong>" + prslt1[1] + "</strong> </div></div></li>";
                cart1 = cart1 + "<li class='item'> <a class='product-image' title='Fisher-Price Bubble Mower' href='#'><img width='60' style='padding:1.5px;margin-left:2px' alt='Fisher-Price Bubble Mower' src='" + prslt1[3] + "'></a><div class='product-details'><div class='access tdrem'> <a class='btn-remove1' id='remove-" + prslt1[0] + "' title='Remove This Item' href='#'> <span class='icon'></span> Remove </a> </div><p class='product-name'> <a href='#'>" + prslt1[2] + "</a> </p><strong>" + prslt1[1] + "</strong> x <span class='price'>" + data2.d / prslt1[1] + "</span> </div></li>";
                //" <tr class='" + prslt1[0] + "'><td class='image'><a href='#'><img title='" + prslt1[2] + "' width='43' height='43' src='" + prslt1[3] + "'></a></td><td class='name'><a href='#'>" + prslt1[2] + "</a></td><td class='quantity'><span id='quantity" + prslt1[0] + "' >x " + prslt1[1] + "</span></td><td class='total'><span id='total" + prslt1[0] + "' >" + prslt1[4] + "</span></td><td class='tdrem'><a id='remove-" + prslt1[0] + "' class='remove1'><img title='Remove'   src='image/remove-small.png'></a></td></tr>"
                $("#cartdetail").append(cart);
                $("#cart-details2").append(cart1);
                $("#cart-total").html(item.toString() + " items(s)  ");
                //$("#cart-total").text(item.toString() + " items(s) - " + cost.toString());
                $("#total").text(cost.toString());
                $("#cart-total2").html(item.toString() + " items(s)  ");
                $("#total2").text(cost.toString());
            }
            //
        }
    });
}