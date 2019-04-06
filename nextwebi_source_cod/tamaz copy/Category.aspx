<%@ Page Title="" Language="C#" MasterPageFile="~/main2.master" AutoEventWireup="true"
    CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/Ecom.js" type="text/javascript"></script>
    
    <style>
        .large-field {
            width: 100%;
            margin: 10px 0px 0px 0px;
            border: 1px solid #c1c1c1;
            height: 37px;
            padding: 0 12px;
        }

        .col-item .info {
            height: 150px;
        }
    </style>
    <script type="text/javascript">
        function PopulateProduct() { popc(1, '<%= ResolveUrl("~/Backend.asmx") %>', "#pro1", $("#a123").text()); }
        var lastId = 0;
        var scrollTop = 0;

        $(document).ready(function () {
            PopulateProduct();
        });
        $(window).on("scroll", function () {
            var $document = $(document);
            var $window = $(this);
            if (scrollTop < $document.scrollTop()) {
                scrollTop = scrollTop + 400;
                PopulateProduct();
            }
            $(".button").unbind().click(function () {
                var btnid = $(this).attr('id');
                addItemsFromCategory('<%= ResolveUrl("~/Backend.asmx") %>', btnid);

            });


        });

    </script>
    <%-- <script type="text/javascript">
        $(window).load(function () {
            //alert("hello");

        });
        var pageIndex = 0;
        var indexValue = 1;
        var lastId = 0;
        var scrollTop = 0;
        $(document).ready(function () {
              pageIndex = pageIndex + 1;
                indexValue = indexValue + 600; //alert("hello");
                var cat = $("#a123").text();
                $(location).attr('href');
                var apikey = getKey("apiKey");
                var parameter = { "val": pageIndex, "cat": cat, "lastIdVal": lastId, "apiKey": apikey };
                var url = '<%= ResolveUrl("~/Backend.asmx/PCP") %>';
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    //dataType: 'text',
                    success: function (data) {
                        var isFeatured = "";
                        if (lastId < data.d.id) {
                            lastId = data.d.id;
                            for (var i = 0; i < data.d.fp.length; i++) {
                                var ribbon = "";
                                if (data.d.fp[0].hotSelling == "Yes") {
                                    ribbon = "<div class='sale-label sale-top-right'><div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div></div>";
                                }
                                if (i % 3 == 0 || i == 0) {
                                    isFeatured = isFeatured + " <ul class='products-grid'>";
                                }
                                isFeatured = isFeatured + "<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-6'><div class='col-item'>" + ribbon + "<div  class='product-image-area' style='border:1px solid #ccc;padding:10px;'> <a class='product-image' title='" + data.d.fp[i].name + "' href='../" + data.d.fp[i].url + "'> <img src='../" + data.d.fp[i].image + "' class='img-responsive' alt='a' /> </a></div><div class='info'><div class='info-inner'><div class='item-title'><a title=' " + data.d.fp[i].name + "' href='../" + data.d.fp[i].url + "'> " + data.d.fp[i].name + " </a> </div><div class='item-content'><div class='ratings'><div class='rating-box'><div style='width:" + ((data.d.fp[i].rating) * 20) + "%' class='rating'></div> </div> </div><div class='price-box'><p class='special-price'> <span class='price'> " + data.d.fp[i].finalPrice + "</span> </p></div></div></div><div class='actions'><input type='button'class='button  btn-cart' id='btn-" + data.d.fp[i].guid + " '  onclick='return false;' value='Add to Cart'/></div><div class='clearfix'> </div></div></div></li>";
                                if (i % 3 == 2 || (i + 1) == data.d.fp.length) {
                                    isFeatured = isFeatured + "</ul>";
                                }
                            }
                        }

                        $("#pro1").append(isFeatured);
                    }
                });
            
        });
        $(window).on("scroll", function () {           //on("scroll"
            var $document = $(document);
            var $window = $(this);
            var value = $document.scrollTop() / indexValue;
            if (scrollTop < $document.scrollTop()) {
                scrollTop = scrollTop + 300;
                pageIndex = pageIndex + 1;
                indexValue = indexValue + 600; //alert("hello");
                var cat = $("#a123").text();
                $(location).attr('href');
                var apikey = getKey("apiKey");
                var parameter = { "val": pageIndex, "cat": cat, "lastIdVal": lastId,"apiKey":apikey };
                var url = '<%= ResolveUrl("~/Backend.asmx/PCP") %>';
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    //dataType: 'text',
                    success: function (data) {
                        var isFeatured = "";
                        if (lastId < data.d.id) {
                            lastId = data.d.id;
                            for (var i = 0; i < data.d.fp.length; i++) {
                                var ribbon = "";
                                if (data.d.fp[0].hotSelling == "Yes") {
                                    ribbon = "<div class='sale-label sale-top-right'><div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div></div>";
                                }
                                if (i % 3 == 0 || i == 0) {
                                    isFeatured = isFeatured + " <ul class='products-grid'>";
                                }
                                isFeatured = isFeatured + "<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-6'><div class='col-item'>" + ribbon + "<div  class='product-image-area' style='border:1px solid #ccc;padding:10px;'> <a class='product-image' title='" + data.d.fp[i].name + "' href='../" + data.d.fp[i].url + "'> <img src='../" + data.d.fp[i].image + "' class='img-responsive' alt='a' /> </a></div><div class='info'><div class='info-inner'><div class='item-title'><a title=' " + data.d.fp[i].name + "' href='../" + data.d.fp[i].url + "'> " + data.d.fp[i].name + " </a> </div><div class='item-content'><div class='ratings'><div class='rating-box'><div style='width:" + ((data.d.fp[i].rating) * 20) + "%' class='rating'></div> </div> </div><div class='price-box'><p class='special-price'> <span class='price'> " + data.d.fp[i].finalPrice + "</span> </p></div></div></div><div class='actions'><input type='button'class='button  btn-cart' id='btn-" + data.d.fp[i].guid + " '  onclick='return false;' value='Add to Cart'/></div><div class='clearfix'> </div></div></div></li>";
                                if (i % 3 == 2 || (i + 1) == data.d.fp.length) {
                                    isFeatured = isFeatured + "</ul>";
                                }
                            }
                        }
                        
                        $("#pro1").append(isFeatured);
                    }
                });
            }
            // }
            $(".button").unbind().click(function () {
                var btnid = $(this).attr('id');
                addItemsFromCategory('<%= ResolveUrl("~/Backend.asmx/productget") %>', btnid);
                //return false;
            });
            $('#<%=btn_order.ClientID %>').click(function () {
                var mobile = $('#<%=txt_mobile.ClientID %>').val();
                if ($('#<%=txt_neme.ClientID %>').val() == "") {
                    alert("Please, Enter your name");
                    return false;
                }
                if (mobile == "" || isNaN(mobile) || mobile.length < 10) {
                    alert("Enter Valid Mobile Number !");
                    return false;
                }

                if ($('#<%=txt_message.ClientID %>').val() == "") {
                    alert("Please, Enter your Address");
                    return false;
                }
            });

        });
    </script>--%>
    <asp:PlaceHolder ID="MetaPlaceHolder" runat="server" />
    <script type="text/javascript">
        //////////F12 disable code////////////////////////
        document.onkeypress = function (event) {
            event = (event || window.event);
            if (event.keyCode == 123) {
                //alert('No F-12');
                return false;
            }
        }
        document.onmousedown = function (event) {
            event = (event || window.event);
            if (event.keyCode == 123) {
                //alert('No F-keys');
                return false;
            }
        }
        document.onkeydown = function (event) {
            event = (event || window.event);
            if (event.keyCode == 123) {
                //alert('No F-keys');
                return false;
            }
        }
        /////////////////////end///////////////////////


        //Disable right click script 
        //visit http://www.rainbow.arch.scriptmania.com/scripts/ 
        var message = "Sorry, right-click has been disabled";
        /////////////////////////////////// 
        function clickIE() { if (document.all) { (message); return false; } }
        function clickNS(e) {
            if 
(document.layers || (document.getElementById && !document.all)) {
                if (e.which == 2 || e.which == 3) { (message); return false; }
            }
        }
        if (document.layers)
        { document.captureEvents(Event.MOUSEDOWN); document.onmousedown = clickNS; }
        else { document.onmouseup = clickNS; document.oncontextmenu = clickIE; }
        document.oncontextmenu = new Function("return false")
        // 
        function disableCtrlKeyCombination(e) {
            //list all CTRL + key combinations you want to disable
            var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j', 'U', 'u', 'w', 'S', 's', 'A');
            var key;
            var isCtrl;
            if (window.event) {
                key = window.event.keyCode;     //IE
                if (window.event.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }
            else {
                key = e.which;     //firefox
                if (e.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }
            //if ctrl is pressed check if other key is in forbidenKeys array
            if (isCtrl) {
                for (i = 0; i < forbiddenKeys.length; i++) {
                    //case-insensitive comparation
                    if (forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase()) {
                        //   alert('Key combination CTRL + ' + String.fromCharCode(key) + ' has been disabled.');
                        return false;
                    }
                }
            }
            return true;
        }



        function clickIE4() {
            if (event.button == 2) {
                alert(message);
                return false;
            }
        }

        function clickNS4(e) {
            if (document.layers || document.getElementById && !document.all) {
                if (e.which == 2 || e.which == 3) {
                    alert(message);
                    return false;
                }
            }
        }

        if (document.layers) {
            document.captureEvents(Event.MOUSEDOWN);
            document.onmousedown = clickNS4;
        }
        else if (document.all && !document.getElementById) {
            document.onmousedown = clickIE4;
        }

        document.oncontextmenu = new Function("return false")
        document.ondragstart = function () { return false };
        document.onselectstart = function () { return false };

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumbs">
        <div>
            <div class="row">
                <ul>
                    <li class="home"><a href="../Default.aspx" title="Go to Home Page">Home</a><span>&mdash;›</span></li>
                    <li class=""><a href="#">Category</a><span>&mdash;›</span></li>
                    <li class="category13"><strong>
                        <%=category %></strong></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="category-title">
        <h1 id="a123" class="inner-title">
            <%--<%=category %>--%></h1>
    </div>
    <div class="category-products">
        <ul id="pro1" class="products-grid">
        </ul>
        <div style="clear: both;">
        </div>
        <div id="categoryDesc" class="std2" runat="server">
        </div>
        <div style="clear: both">
        </div>
        <br />
        <br />
        <div style="width: 100%; text-align: center; background-color: #007FB8; color: #fff; padding: 1px;">
            <h5>Quick Enquiry Form</h5>
        </div>
        <div class="tab-content" id="tab-order">
            <asp:TextBox ID="txt_neme" CssClass="large-field" PlaceHolder="Name " runat="server"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="txt_mobile" CssClass="large-field" PlaceHolder="Mobile No" runat="server"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="txt_city" CssClass="large-field" PlaceHolder="City" runat="server"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="txt_message" CssClass="large-field" PlaceHolder="Message" TextMode="MultiLine"
                Height="100px" runat="server"></asp:TextBox><br />
            <br />
            <asp:Button ID="btn_order" CssClass="button" runat="server" Text="Submit" OnClick="btn_order_Click" />
            <br />
            <br />
            <asp:Label ID="lblsuccess" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
