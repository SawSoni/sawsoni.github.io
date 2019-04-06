<%@ Page Title=" Our Products | Tamaz Global Trading Co." Language="C#" MasterPageFile="~/main2.master" AutoEventWireup="true"
    CodeFile="Product.aspx.cs" Inherits="Product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder ID="MetaPlaceHolder" runat="server" />
    <style>
        #glp-auth-tab {
            display: none;
        }

        .col-item .info {
            height: 90px;
        }

        .pann {
            box-shadow: none;
            border: none;
            background: none;
            border-radius: 0px;
            padding: 0px;
        }

        .signin {
            float: none;
            margin: auto !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".button1").click(function () {
                var idVal = $(this).attr('id'); // debugger;
                callProduct('<%= ResolveUrl("~/Backend.asmx") %>', idVal, 2);

            });
            $(".button2").click(function () {
                var idVal = $(this).attr('id');
                callProduct('<%= ResolveUrl("~/Backend.asmx") %>', idVal, 1);

            });
            $("#writeReview").click(function () {
                var activeTab = $('[href=' + location.hash + ']');
                activeTab && activeTab.tab('show');
                activeTab && activeTab.tab('show');
                activeTab && activeTab.tab('show');
                window.location = location.hash;

            });
           <%-- $('#<%=btn_order.ClientID %>').click(function () {
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

            });--%>
            $("#glp-a-s1").click(function () {
                var pid = $(".button1").attr("id").split("-")[1];
                var name = $('#<%=txt_name1.ClientID %>').val();
                var apikey = getKey("apiKey");
                if (name == "" || name.length < 3) {
                    alert("Enter Valid Name ..");
                    return false;
                }
                var emailval = $('#<%=txt_email1.ClientID %>').val();
                var idx = emailval.indexOf("@");
                var lidx = emailval.lastIndexOf(".");

                if (idx < 1 || lidx < idx + 2 || lidx + 2 >= emailval.length) {
                    alert("Please, enter valid e-mail address ..");
                    return false;
                }
                var mobile = $('#<%=txt_mobile1.ClientID %>').val();

                if (mobile == "" || isNaN(mobile) || mobile.length < 10) {
                    alert("Enter Valid Mobile Number !");
                    return false;
                }

                var qty = $('#<%=txt_qty.ClientID %>').val();
                if (qty == "" || isNaN(qty)) {
                    alert("Quantity should be in numeric");
                    return false;
                }
                var message = $('#<%=txt_message1.ClientID %>').val();
                var url = '<%= ResolveUrl("~/Backend.asmx/GLPSignIn") %>';
                var apikey = getKey("apiKey");
                var parameter = { "productGuid": pid, "quantity": qty, "message": message, "name": name, "email": emailval, "mobile": mobile, "apiKey": apikey }
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    //dataType: 'text',
                    success: function (data) {
                        if (data.d == 0) {
                            $('#pop_box').modal('hide');
                            alert("request posted successfully !!");
                            $('#<%=txt_message1.ClientID %>').val("");
                            $('#<%=txt_qty.ClientID %>').val("");
                            $('#<%=txt_mobile1.ClientID %>').val("");
                            $('#<%=txt_name1.ClientID %>').val("");
                            $('#<%=txt_email1.ClientID %>').val("");
                        }
                        else if (data.d == 2) {
                            alert("wrong uname or password !!");
                        }
                        else if (data.d == 1) {
                            alert("something went wrong !!");
                        }

                    }
                });
            });
        });

    </script>
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
    <div id="fb-root">
    </div>
    <script>        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1225887667437997";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    <div class="breadcrumbs">
        <div>
            <div class="row">
                <div class="col-md-8">
                    <ul>
                        <li class="home"><a href="../Default.aspx" title="Go to Home Page">Home</a><span>&mdash;›</span></li>
                        <li class=""><a href="#" title="Go to Home Page">Product</a><span>&mdash;›</span></li>
                        <li class="category13">
                            <%=product_name %></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <%=StrProdCat %>
                </div>
            </div>
        </div>
    </div>
    <section class="main-container col1-layout">
    <div class="main">
      <div class="col-main">
        <div class="row">
          <div class="product-view">
            <div class="product-essential">
              <div id="product_addtocart_form">
                <input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
                <div class="row"><div class="col-md-12">
                <div class="col-md-5">
                <asp:DropDownList ID="ddl_products" AutoPostBack="true" OnSelectedIndexChanged="ddl_products_SelectedIndexChanged" style="height:35px;width:100%;padding:8px !important;" runat="server">
                
                </asp:DropDownList>
                </div>
                </div>
                <div class="col-md-12">
                <div class="col-md-12">
                <div class="product-name">
                <h1 class="mt0"><%=product_name %></h1>
                </div></div>
                
                
                </div></div>
                <div class="product-img-box col-sm-5 wow bounceInRight animated">
                  <%=ribbonTag %>
                  <div class="product-image">
                    <div class="largeImg_wrap">
                      <%=anchorTag %>
                    </div>
                  </div>
                  
                  
                  <!-- end: more-images -->
                  
                  <div class="clear"></div>
                </div>
                <div class="product-shop col-sm-7 wow bounceInLeft animated">
              
                  
                  <div class="short-description product-h2">
                    <h2>Product Details</h2>
                    <div class="product-det">
                   <%=strProductinfo %>
                    </div>
                  </div>
                  <div class="short-description product-h2">
                    <h2>Payment & Shipping Terms:</h2>
                   <div class="product-det">
                    <%=strProductShipping%>
                    <div class="row">
                    <div class="col-md-12">
                   <a data-toggle="modal" href="#pop_box1"><div class="btn-home" style="padding:5px 10px;margin-left:0px;width:100px;text-align:center;">Contact Now</div></a> 
                    </div></div>
                    </div>
                  </div>
                

                </div>


                <div class="col-sm-4"></div>
                
                <%--<button
  class="g-interactivepost"
  data-contenturl="http://zofet.com"
  data-contentdeeplinkid="/pages"
  data-clientid="254829945132-kotdq8vpsjqh9djug6ojd8gpn19ugqj5.apps.googleusercontent.com "
  data-cookiepolicy="single_host_origin"
  data-prefilltext="Engage your users today, create a Google+ page for your business."
  data-calltoactionlabel="CREATE"
  data-calltoactionurl="http://plus.google.com/pages/create"
  data-calltoactiondeeplinkid="/pages/create">
  Tell your friends
</button>--%>


    <script>
        window.___gcfg = {
            lang: 'en-US',
            parsetags: 'onload'
        };
    </script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>

              </div>
            </div>
            
            <div class="product-collateral">
              <div class="col-sm-12 wow bounceInUp animated">
                <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                  <li class="active"> <a href="#product_tabs_description" data-toggle="tab"> Product Description </a> </li>
                  <%--<li><a href="#product_tabs_tags" data-toggle="tab">Tags</a></li>
                  <li> <a href="#reviews_tabs" data-toggle="tab">Reviews</a> </li>--%>
                  <li> <a href="#quickquery_tabs" data-toggle="tab">For Wholesale</a> </li>
                  <%--<li> <a href="#product_tabs_custom" data-toggle="tab">Custom Tab</a> </li>
                  <li> <a href="#product_tabs_custom1" data-toggle="tab">Custom Tab1</a> </li>--%>
                </ul>
                <div id="productTabContent" class="tab-content">
                  <div class="tab-pane fade in active" id="product_tabs_description">
                    <div class="std">
                    <div class="short-description product-h2 plist sdesc" style="border:none !important;">
                      <%=desc %>
                    </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="product_tabs_tags">
                    <div class="box-collateral box-tags">
                      <div class="tags">
                        <div id="addTagForm">
                          <div class="form-add-tags">
                            <label for="productTagName">Add Tags:</label>
                            <div class="input-box">
                              <input class="input-text required-entry" name="productTagName" id="productTagName" type="text" style="width:35%;">
                              <button type="button" title="Add Tags" class=" button btn-add" onClick="submitTagForm()"> <span>Add Tags</span> </button>
                            </div>
                            <!--input-box--> 
                          </div>
                        </div>
                      </div>
                      <!--tags-->
                      <p class="note">Use spaces to separate tags. Use single quotes (') for phrases.</p>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="reviews_tabs">
                   <div class="q-query">
                    <div class="box-collateral box-reviews" id="customer-reviews">
                      <div class="box-reviews1">
                        <div class="form-add">
                          <div id="review-form" >
                           <div class="panel pann" id="tab-reviews" style="padding:0px 20px 0px 20px;">
							
                             <%=reviewVal %>
       
        <h2 id="review-title">Write a review</h2>
        <br>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
          <b>Your Name:</b><br>
          <asp:TextBox ID="txt_name" CssClass="large-field" runat="server"></asp:TextBox>
        <br>
        <br>
        <b>Your Review:</b>
          <asp:TextBox ID="txt_review" TextMode="MultiLine" Width="98%" Height="180px" runat="server"></asp:TextBox>
        <span style="font-size: 11px;"><span style="color: #FF0000;"></span></span><br>
        <br>
        <b>Rating:</b>&nbsp;
          <asp:Rating   
            ID="rating_hotel"   
            CurrentRating="2"  
            MaxRating="5"  
            StarCssClass="rating_star"  
            FilledStarCssClass="rating_filled"  
            EmptyStarCssClass="rating_empty"  
            WaitingStarCssClass="rating_empty"  
            runat="server" >  
        </asp:Rating> 
        <br />
          <asp:Label ID="Label1" runat="server" style="float:left;" Text=""></asp:Label>
          </ContentTemplate>
          <Triggers>
          <asp:AsyncPostBackTrigger ControlID="btn_review" EventName="Click" />
          </Triggers>
          </asp:UpdatePanel>
        <br>
        
        <div class="buttons">
        <br />
          <div class="Left">
              <asp:Button ID="btn_review" class="button q-submit" runat="server" Text="Submit Review" 
                  onclick="btn_review_Click" /></div>
                  <br />
        </div>
						</div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="clear"></div>
                    </div>
                  </div>
                  </div>
                  <div class="tab-pane fade" id="quickquery_tabs">
                  <div class="q-query">
                   <%=product_name %>
                  <h2>QUICK QUERY</h2>
                     <asp:DropDownList ID="ddl_qty" style="max-width:30% !important;margin:5px 0px 10px 0px;" CssClass="large-field" runat="server">
                   <asp:ListItem>Qty</asp:ListItem>
                   <asp:ListItem>10</asp:ListItem>
                   <asp:ListItem>25</asp:ListItem>
                     <asp:ListItem>50</asp:ListItem>
                   <asp:ListItem>100</asp:ListItem>
                   <asp:ListItem>200</asp:ListItem>
                   <asp:ListItem>500</asp:ListItem>
                   </asp:DropDownList>
                       <asp:TextBox ID="txt_neme" CssClass="large-field" PlaceHolder="Name " style="width:80%" runat="server"></asp:TextBox><br /><br />
                  <asp:RequiredFieldValidator ControlToValidate="txt_neme" ValidationGroup="ABCD" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>

         <asp:TextBox ID="txt_email" CssClass="large-field" PlaceHolder="Email" style="width:80%" runat="server"></asp:TextBox><br /><br />
                        <asp:RequiredFieldValidator ControlToValidate="txt_email" ValidationGroup="ABCD" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email-ID"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="ABCD" runat="server" Display="Dynamic" ControlToValidate="txt_email" ErrorMessage="Invalid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
         
        <asp:TextBox ID="txt_mobile" CssClass="large-field" PlaceHolder="Mobile" style="width:80%" runat="server"></asp:TextBox><br /><br />
                       <asp:RequiredFieldValidator ControlToValidate="txt_mobile" ValidationGroup="ABCD" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                ControlToValidate="txt_mobile" ErrorMessage="10 Digit mobile no." ValidationGroup="ABCD"
                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="txt_mobile"></asp:FilteredTextBoxExtender>
         
         <asp:TextBox ID="txt_message" CssClass="large-field" PlaceHolder="Message" style="width:80%;color:#333;padding-top:10px;background:#fff;" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox><br /><br />
        
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-2 col-xs-4">
                            <asp:Image ID="imgCaptcha" Style="position: relative; right: 0px; top: 0px;" runat="server" />
                            
                        </div>
                        <div class="col-md-2 col-xs-4">
                            <asp:ImageButton ID="btnRefresh" Style="width: 80%;" CausesValidation="false" OnClick="btnRefresh_Click" ImageUrl="images/reset-icon.png" runat="server" />

                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <%--  <asp:PostBackTrigger  ControlID="btnRefresh"/>--%>
                </Triggers>
            </asp:UpdatePanel><br />
            <asp:TextBox ID="txtCaptcha" placeholder="Please enter above code" Style="margin-top: 6px;" runat="server"
                CssClass="large-field">
            </asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtCaptcha" ValidationGroup="ABCD" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Captcha"></asp:RequiredFieldValidator>
                      <br />
 <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label><br />
<br />
          <asp:Button ID="btn_order" CssClass="button q-submit" ValidationGroup="ABCD" runat="server" Text="Submit" 
              onclick="btn_order_Click" />
              <br />
              <br /><asp:Label ID="lblsuccess" runat="server" ></asp:Label>
                  </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-12">
                <div class="box-additional">
                  <div class="related-pro wow bounceInUp animated">
                    <div class="slider-items-products">
                      <div class="new_title center">
                        <h2>Related Products</h2>
                      </div>
                      <div id="related-products-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col4"> 
                          <%=relatedProducts %>
                          
                          
                        </div>
                      </div>
                    </div>
                  </div>
                
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div id="pop_box1" class="modal fade">
        <div class="modal-dialog" style="width:350px;">
            <div class="modal-content">
                <div class="modal-body" style="padding:0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div id="Div3" >
                    <div class="row">
                      <div class="col-md-12" style="margin-bottom:10px;"><h2>Get Quick Quote</h2>  </div>
                     <div class="p20"> <div class="col-md-12">
                      <h4 style="margin-top:0px;"><%=product_name %></h4>
                      <asp:DropDownList ID="ddl_quanty" CssClass="large-field" runat="server">
                      <asp:ListItem>Qty</asp:ListItem>
                      <asp:ListItem>10</asp:ListItem>
                      <asp:ListItem>25</asp:ListItem>
                       <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                        <asp:ListItem>500</asp:ListItem>
                      </asp:DropDownList>
                    <asp:TextBox ID="txtname" placeholder="Name" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtname" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtemail" placeholder="Email" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtemail" ValidationGroup="abc" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email-ID"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ControlToValidate="txtemail" ErrorMessage="Invalid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    <asp:TextBox ID="txtmobile" placeholder="Mobile" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtmobile" ValidationGroup="abc" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic"
                                        ControlToValidate="txtmobile" ErrorMessage="10 Digit mobile no."
                                        ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="txtmobile"></asp:FilteredTextBoxExtender>

                                    <asp:TextBox ID="txtcountry" placeholder="Country" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtcountry" ValidationGroup="abc" Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Country"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtcity" placeholder="City" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtcity" ValidationGroup="abc" Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter City"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtmessge" CssClass="large-field" placeholder="Message" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                  <div class="clearfix"></div>

                    <br /><asp:Button ID="btn_contact" style="margin-top:10px;" ValidationGroup="abc" class="btn btn-default cp-button" runat="server" OnClick="btn_contact_Click" Text="Submit"></asp:Button>

                    </div>
            <div class="clearfix"></div>
                   
                    </div> 
                    

                    
                    </div>
                   
                    </div>
                    </div>
                    </div>
                    </div>



    <div id="pop_box" class="modal fade">
        <div class="modal-dialog" style="width:350px;">
            <div class="modal-content">
                <div class="modal-body" style="padding:20px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div id="modal-stage-1" >
                    <div class="row">
                      <div class="col-md-12" style="margin-bottom:10px;"><h2>Get Quick Quote</h2>  </div>
                      <div class="col-md-12">
                      <asp:TextBox ID="txt_name1" placeholder="Name" CssClass="large-field" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_email1" placeholder="Email" CssClass="large-field" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_mobile1" placeholder="Mobile" CssClass="large-field" runat="server"></asp:TextBox>
                    <div class="row">
                    <div class="col-md-6"><asp:TextBox ID="txt_from" placeholder="From" style="min-width:100px;" CssClass="large-field" runat="server"></asp:TextBox></div>
                    <div class="col-md-6"><asp:TextBox ID="txt_to" placeholder="To" style="min-width:100px;" CssClass="large-field" runat="server"></asp:TextBox></div>
                    </div>
                    <asp:TextBox ID="txt_qty" placeholder="Qty" CssClass="large-field" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_message1" CssClass="large-field" placeholder="Message" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                    <br />
                    <div class="clearfix"></div>
                    <input type="button" id="glp-a-s1" style="margin-top:10px;" class="btn btn-default cp-button" value="Submit" />
                    </div>
            
                   
                    </div> 
                    

                    
                    </div>
                    <div  id="glp-auth-tab" >
  <%--<h2>Dynamic Pills</h2>--%>
  
  
  <ul class="nav nav-pills" style="margin-bottom:8px;font-weight:bold;">
  
    <li ><a data-toggle="pill" href="#signin" style="background:none;padding:8px 10px;margin-right:10px;text-align:center;border:1px solid #dcdcdc;color:#333;">Sign In</a></li>
    <li><a data-toggle="pill" style="background:none;padding:8px 10px;border:1px solid #dcdcdc;text-align:center;color:#333;" href="#signup">Sign Up</a></li>
    </ul>
  
  <div class="tab-content">
    <div id="signin" class="tab-pane fade in active" style="background:#fbfbfb;border:1px solid #dcdcdc;padding:10px 10px;">
     
      <asp:TextBox ID="txt_glp_email_si" CssClass="large-field" runat="server"></asp:TextBox><br />
      <asp:TextBox ID="txt_glp_pwd_si" CssClass="large-field" runat="server"></asp:TextBox><br />
      <input type="button" class="button q-submit" id="btn_glp_si" style="margin-top:15px;"  value="Sign In"/>
    </div>
    <div id="signup" class="tab-pane fade" style="background:#f5f5f5;border:1px solid #dcdcdc;padding:10px 10px;">
  
      <asp:TextBox ID="txt_glp_name_su" CssClass="large-field" runat="server"></asp:TextBox><br />
      <asp:TextBox ID="txt_glp_email_su" CssClass="large-field" runat="server"></asp:TextBox><br />
      <asp:TextBox ID="txt_glp_pwd_su" CssClass="large-field" runat="server"></asp:TextBox><br />
      <asp:TextBox ID="txt_glp_mobile_su" CssClass="large-field" runat="server"></asp:TextBox><br />
      <input type="button" class="button q-submit" style="margin-top:15px;" id="btn_glp_su"  value="Sign Up"/>
    </div>
    
  </div>
</div>
                    </div>
                    </div>
                    </div>
                    </div>


                    <div id="image_popup" class="modal fade">
        <div class="modal-dialog" style="width:500px;">
            <div class="modal-content">
                <div class="modal-body" style="padding:2px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div id="Div2" >
                     
                    <img style="width:100%;" src="<%=image_popup %>" />

                    
                    </div>
                    
                    </div>
                    </div>
                    </div>
                    </div>
  </section>
</asp:Content>
