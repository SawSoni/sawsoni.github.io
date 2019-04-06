<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="We are the wholesale distributor of beauty and personal care products like; Glutathione skin Whitening Injections, top 10 skin whitening pills, skin whitening cream, skin whitening lotion & Soap, Anti Ageing Pills & Injections, Weight Gain product and weight loss products. Call us: +91-9900746748 for wholesale enquiry.">
    <meta name="keywords" content="beauty care products wholesale, Buy skin care products wholesale in india , skin whitening injections & pills wholesale, dr james glutathione wholesale, weight gain capsules wholesale, weight loss pills wholesale, weight loss capsules wholesale">
<meta name="expires" content="never">
<meta name="robots" content="index, follow">
<link rel="canonical" href="https://www.tamazglobal.com/"/> 
<meta property="og:type" content="website" /><meta property="og:title" content=" Tamaz Global Trading Co | Beauty and Personal Care Products - Wholesale in India" /><meta property="og:description" content="We are the wholesale distributor of beauty and personal care products like; Glutathione skin Whitening Injections, top 10 skin whitening pills, skin whitening cream, skin whitening lotion & Soap, Anti Ageing Pills & Injections, Weight Gain product and weight loss products. Call us: +91-9900746748 for wholesale enquiry." /><meta property="og:url" content="https://www.tamazglobal.com/" /><meta property="og:site_name" content="Tamaz Global Trading Co" />
<meta name="rating" content="general"><meta name="classification" content="Beauty Products Wholesale, glutathione skin whitening injections and Pills">
<meta name="msvalidate.01" content="960DCC5439E733D83AA0B7B3CD389BB4" />
<meta name="p:domain_verify" content="6343726e4b70cf9bdb3f72744209cb0f"/>
    <meta name="author" content="Tamaz Global">
    <title>Tamaz Global Trading Co | Beauty and Personal Care Products - Wholesale in India</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS Style -->
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" href="css/revslider.css" type="text/css" />
    <link rel="stylesheet" href="css/index-2-css/revslider.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" />
    <link rel="Shortcut Icon" href="images/favicon.png" />

    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
   <script src="js/Ecom.js" type="text/javascript"></script>
    <link href="css/core.css" rel="stylesheet" type="text/css" />
    <meta name="google-site-verification" content="RB8XqRBChzhGy-E6czsd0Pq_9XdJVKmv1TdrJzUg9uY" />
	<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5SXDM5T');</script>
<!-- End Google Tag Manager -->

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-92512020-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-92512020-1');
</script>
	
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,300,700,800,400,600'
        rel='stylesheet' type='text/css' />
    <script type="text/javascript">

        $(document).ready(function () {
           cartStatus('<%= ResolveUrl("~/Backend.asmx") %>');
            $("#chk1").click(function () {
                window.location = "Checkout";
            });
            $(".category").click(function () {
                var btnid = $(this).attr('id');
                $("#" + btnid + "-div").toggle();
            });
            LoginDetails('<%= ResolveUrl("~/Backend.asmx") %>');
            $("#alogout").click(function () {
                alert($("#logout").html());
                if ($("#logout").html() == "Logout") {
                    LogOut('<%= ResolveUrl("~/Backend.asmx") %>', "1");
                }
                else {
                    window.location = "Login";
                }
            });
            $('#<%=btn_CBsubmit.ClientID %>').click(function () {
                var mobile = $('#<%=txt_CBmobileno.ClientID %>').val();
                var name = $('#<%=txt_CBname.ClientID %>').val();
                var tim = $('#<%=txt_CBTime.ClientID %>').val();
                return callMeBackValidation(mobile, name, tim);

            });
            function blinker() {
                $('.blink_me').fadeOut(1000);
                $('.blink_me').fadeIn(1000);
            }

            setInterval(blinker, 1000);
        });
        $(".tdrem a").live('click', function () {
            var btnid = $(this).attr('id');
            removeItem('<%= ResolveUrl("~/Backend.asmx") %>', btnid, 1);
        });

    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <style>
        .rfid-sol {
            padding: 20px;
            text-align: center;
            font-family: open sans;
            letter-spacing: 1px;
            font-size: 16px;
            margin-bottom: 30px;
            border-radius: 1px;
        }

        .rfid-sol-f {
            padding: 20px 14px;
            text-align: center;
            font-family: sans-serif;
            letter-spacing: 1px;
            font-size: 17px;
            float: left;
            width: 260px;
            margin-bottom: 30px;
            margin-left: 33px;
        }

        .product-image-area img {
            width: 200px;
            height:164px;
            margin: Auto;
            margin-bottom: 4px;
        }

        a:focus {
            outline: none !important;
        }

        .ui-autocomplete {
            max-height: 300px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #project-label {
            display: block;
            font-weight: bold;
            margin-bottom: 1em;
        }

        #project-icon {
            float: left;
            height: 32px;
            width: 32px;
        }

        #project-description {
            margin: 0;
            padding: 0;
        }

        a:hover, a:focus {
            color: #fff;
            text-decoration: none;
        }

        .cat-img-title.cat-box {
            width: 95.7%;
        }

        .cat-img-title.cat-box {
            background: hsla(0, 0%, 0%, 0.5) none repeat scroll 0 0;
            margin: 0;
            text-align: center;
            top: 70%;
            width: 100%;
            left: 0px;
        }

        .cat-img-title {
            bottom: 0;
            display: block;
            height: 30%;
            margin: 6%;
            padding: 0;
            position: absolute;
            top: 66%;
            width: 80%;
        }

        .item-content h4 {
            font-size: 16px;
        }

        .pl0 {
            padding-left: 0px;
            padding-right: 0px;
        }
        .col-item{
            padding:3px;
            border:1px solid #ddd;
            height:172px;
        }
        .owl-item{
    width:232px !important;
}
        .subhdhome{
            padding:2px;
            background:#00405d;
        }
        .subhdhome p{
            text-align:center;
            color:#fff;
           font-size:16px;
           margin-top:4px;
        }
        
    </style>
    <script>
        $(function () {

            var projects = function (request, response) {
                var url = '<%= ResolveUrl("~/Backend.asmx/Acomp") %>';
                var projects = [];
                var type = "category";
                var apikey = getKey("apiKey");
                var parameter = { "type": type, "para": $("#project").val(), "apiKey": apikey }
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    dataType: "json",
                    success: function (data) {
                        response(data.d);

                    },
                    error: function (error) {
                        alert('error; ' + eval(error));
                    }

                });
            };
            $("#project").autocomplete({
                minLength: 0,
                source: projects,
                focus: function (event, ui) {
                    $("#project").val(ui.item.label);
                    return false;
                },
                select: function (event, ui) {
                    var productName = ui.item.label.split(" ");
                    var product = "";
                    for (var i = 0; i < productName.length; i++) {
                        if (i == 0) {
                            product = productName[i];
                        }
                        else {
                            product = product + "-" + productName[i];
                        }
                    }
                    window.location = "Product/" + product;
                    //                    $("#project").val(ui.item.label);
                    //                    $("#project-id").val(ui.item.value);
                    //                    $("#project-description").html(ui.item.desc);
                    //                    $("#project-icon").attr("src", "images/" + ui.item.icon);

                    return false;
                }
            })
    .autocomplete("instance")._renderItem = function (ul, item) {
        return $("<li>")
        .append("<a><div class='row'><div class='col-md-12' style='border-bottom:1px solid #ccc;'><div class='col-sm-1'><img style='width:30px;border:1px solid#999;' alt='tamaz' src='../" + item.icon + "'/></div><div class='col-sm-11'> " + item.label + "<br>" + item.desc + "</div></div></div></a>")
        .appendTo(ul);
    };
        });

    </script>
    <%--<script src="js/jquery2.2.js" type="text/javascript"></script>--%>

    <script>
        $(document).ready(function () {
            $("#contact-plugin").click(function () {
                if ($(this).attr("class") == "cp-btn-close") {
                    $(this).addClass("cp-btn-open");
                    $(this).removeClass("cp-btn-close");
                    $(this).animate({ right: "245" }, 500);
                    $("#contact-plugin-body").animate({ width: "250", border: "1" }, 500);
                    $("#cp-inner").addClass("cp-block");
                    $("#cp-inner").removeClass("cp-none");
                }
                else {
                    $(this).removeClass("cp-btn-open");
                    $(this).addClass("cp-btn-close");
                    $("#contact-plugin-body").animate({ width: "0", border: "0" }, 500);
                    $(this).animate({ right: "0" }, 500);
                    $("#cp-inner").removeClass("cp-block");
                    $("#cp-inner").addClass("cp-none");
                }
            });
        });
    </script>
		<!-- JSON-LD markup generated by Google Structured Data Markup Helper. -->
<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "Product",
  "name" : "Tamaz Global Trading Co",
  "description" : "Tamaz Global is a global distributor of Skin Whitening Pills, Injections, Cream, Soap and Skin fairness natural products. We are largest wholesale supplier for skin whitening injections &amp; pills.",
  "brand" : {
    "@type" : "Brand",
    "name" : "Tamaz Global",
    "logo" : "https://www.tamazglobal.com/images/tamaz_logo.png"
  }
}
</script>

</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5SXDM5T"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
    <form id="form1" runat="server">
         <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <div>
            
                <!-- Header -->
                <header class="header-container">
    <div class="header container">
      <div class="">
        <div class="col-lg-3 col-xs-12">
          <center><a class="logo" title="" href="https://www.tamazglobal.com"><img itemprop="image" alt="Tamaz Global" class="logo-main img-responsive"  style="height:130px;" src="images/tamaz_logo.png"></a>     </center>  
        </div>
        <div class="col-lg-6 col-xs-12"> 
        
          <div class="search-box">
      
            <div id="search_mini_form">
             
<input placeholder="Search here..." style="padding:8px;border:1px solid #ccc;float:left;margin-bottom:5px;" class="w69" id="project"/>
<input type="hidden" id="project-id"/>
<p id="project-description"></p>
              <%--<input type="text" placeholder="Search here..." value="" maxlength="70" class="" name="search" id="search">--%>
              <button id="submit-button" class="search-btn-bg"><span><i class="fa fa-truck" aria-hidden="true"></i>Search</span></button>
            </div>
            <div class="clearfix"></div>
            <p style="font-size:11px;color:#777;">(Related Search: Skin Whitening Pills, Skin Whitening Injections, Skin Whitening Creams etc...)</p>
               <img src="images/wholesale.png" class="img-responsive" alt="Wholesale Only" title="Wholesale Only"/>
          </div>
          <!-- End Search-col --> 
        </div>
     
        <div class="col-lg-3 col-xs-12" >
            <%--<p style="margin-bottom:0px;"><img src="images/wholesale-noretail.png" style="margin-top:7px;" class='img-responsive w87' /></p>--%>
            <div class="callpad">
                <p class="callimg" style="margin-bottom:8px;text-align:left;margin-left:35px;"> &nbsp; &nbsp;<img src="images/phn.png"/></p>
                <ul>
                   <li>&nbsp; &nbsp; &nbsp; &nbsp;<b>India:</b>&nbsp; <img src="images/india.png" &nbsp; <b><a href="tel:+919900746748">+919900746748</a></b></li>
                    <li>&nbsp; &nbsp; &nbsp;<b>Dubai:</b>&nbsp; <img src="images/uae.png" &nbsp; <b><a href="tel:+971567805678">+971567805678</a></b></li>

                    <li><b>Email:</b> &nbsp;<img src="images/mail3.png" style="margin-left:-1px;" class="img-responsive" /> <a href="mailto:sales@tamazglobal.com">
					sales@tamazglobal.com</a></li>
                </ul>
            </div>
        </div>
        <!-- Top Cart -->
        
        <!-- End Top Cart --> 
      </div>
    </div>
  </header>

                <nav>     
    <div class="container">
      <div class="nav-inner"> 
         <!-- mobile-menu -->
        <div class="hidden-desktop" id="mobile-menu">
          <ul class="navmenu">
            <li>
              <div class="menutop">
                <div class="toggle"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></div>
                <h2>Menu</h2>
              </div>
              <ul style="display:none;" class="submenu">
                <li>
                  <ul class="topnav">
                    


                    <li class="level0 nav-6   level-top first parent"> <a class="level-top" href="https://www.tamazglobal.com"> <span>Home</span> </a></li>
                      
                    


                    <li class="level0 nav-8 level-top parent"> <a class="level-top" href="about"> <span>About Us</span> </a> </li>
                    <li class="level0 nav-8 level-top parent"> <a class="level-top" href="#"> <span>Retail Partners</span> </a> </li>
                    <li class="level0 nav-8 level-top parent"> <a class="level-top" href="#"> <span>Our Distributor</span> </a> </li>
                   <li class="level0 nav-8 level-top parent"> <a class="level-top" href="https://www.tamazglobal.com/blogs/"> <span>Blog</span> </a> </li>
                    <li class="level0 nav-9 level-top last parent "> <a class="level-top" href="Contactus"> <span>Contact Us</span> </a> </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
          <!--navmenu--> 
        </div>
       
        
        <!--End mobile-menu -->
        <div class=""> 
        <ul id="nav" class="hidden-xs">
       
 <li class="level0 nav-5 level-top first"> <a class="level-top" href="http://www.tamazglobal.com"> <span>Home</span> </a> </li>
 <li class="level0 nav-5 level-top first"> <a class="level-top" href="about"> <span>About Us</span> </a> </li>
 <li class="level0 nav-5 level-top first"> <a class="level-top" href="#"> <span>Retail Partners</span> </a> </li>
 <li class="level0 nav-8 level-top parent"> <a class="level-top" href="#"> <span>Our Distributor</span> </a> </li>
                   <li class="level0 nav-8 level-top parent"> <a class="level-top" href="https://www.tamazglobal.com/blogs/"> <span>Blog</span> </a> </li>
 <li class="level0 nav-5 level-top first"> <a class="level-top" href="Contactus"> <span>Contact Us</span> </a> </li>
          
        </ul>
        </div>
       

      </div>
    </div>
  </nav>
                <section class="main-container col2-left-layout">
    <div class="main container">
      <div class="row">
      <section class="col-main col-sm-9 col-sm-push-3 wow bounceInUp animated">
      <div style="background:#0061AB;color:#fff;padding:5px 10px;margin-bottom:10px;text-align:center;font-weight:bold;font-size:18px;">ONLY WHOLESALE - NO RETAIL</div>
          <div id="maanja" style="display:none">0</div>
    

    <div id='rev_slider_4_wrapper' class='rev_slider_wrapper fullwidthbanner-container' >
            <div id='rev_slider_4' class='rev_slider fullwidthabanner'>
              <ul>
                <li data-transition='random' style="border:1px solid #dcdcdc;" data-slotamount='7' data-masterspeed='1000' data-thumb='image/Banner-01.png' class="black-text">
                <img src='image/Banner-01.png'  data-bgposition='left top'  data-bgfit='cover'  data-bgrepeat='no-repeat' alt="banner" title="Banner" /></li>
                
               
                <li data-transition='random' style="border:1px solid #dcdcdc;" data-slotamount='7' data-masterspeed='1000' data-thumb='image/Banner-02.png' class="black-text">
                <img src='image/Banner-02.png'  data-bgposition='left top'  data-bgfit='cover'  data-bgrepeat='no-repeat' alt="banner" title="Banner" /></li>
               
				<li data-transition='random' style="border:1px solid #dcdcdc;" data-slotamount='7' data-masterspeed='1000' data-thumb='images/banner1.jpg' class="black-text">
                <img src='images/banner1.jpg'  data-bgposition='left top'  data-bgfit='cover'  data-bgrepeat='no-repeat' alt="banner" title="Banner" /></li>

              </ul>
              <div class="tp-bannertimer"></div>
            </div>
          </div>
   
            </section>
           <aside class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9 wow bounceInUp animated">
          <div class="side-nav-categories">
            <div class="block-title"> Categories </div>
            <div class="box-content box-category">
              <ul id="magicat">
                  <%=category_list %>
            

              </ul>
            </div>
          </div>
          
          
          <%--<div class="col-lg-12 col-xs-12 col-sm-4 wow bounceInRight animated pl0 animated" style="visibility: visible;">
      <a href="Contactus"><img src="images/tile-icon/c1.jpg" class="img-responsive" alt="click here" title="click here" /></a>
        </div>--%>
          
 
          
        </aside>
        <div class="clearfix"></div>

   
      </div>
        <div class="row mb-lg categories">
            <div class="col-md-12">
                <div class="new_title center">
              <h2>Tamaz Global Top Categories</h2>
            </div>
               </div> 
                
               
            <div class="col-md-3">
                <a href="https://www.tamazglobal.com/SubCategory/Skin-Whitening-Injections">
                <div class="prolistdiv">
                    <img src="images/skinimg/1.jpg" class="img-responsive" alt="Skin Whitening Injections" title="Skin Whitening Injections"/>
                    <p>Skin Whitening Injections</p>
                </div>
                </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Skin-Whitening-Pills">
                <div class="prolistdiv">
                    
                    <img src="images/skinimg/2.jpg" class="img-responsive" alt="Skin Whitening Pills" title="Skin Whitening Pills"/>
                    <p>Skin Whteining Pills</p>
                </div>
                    </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Skin-Whitening-Creams">
                <div class="prolistdiv">
                    <img src="images/skinimg/3.jpg" class="img-responsive" alt="Skin Whitening Creams" title="Skin Whitening Creams"/>
                    <p>Skin Whitening Cream</p>
                </div>
                </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Skin-Whitening-Soaps">
                <div class="prolistdiv">
                    <img src="images/skinimg/likas.jpg" class="img-responsive" alt="Skin Whitening Soap" title="Skin Whitening Soap"/>
                    <p>Skin Whitening Soap</p>
                </div>
                 </a>
			</div>
        </div>
        
        <div class="row mb-lg mobcategories categories">
            <div class="col-md-3">
                <a href="https://www.tamazglobal.com/SubCategory/Skin-Whitening-Lotions">
                <div class="prolistdiv">
                    <img src="images/skinimg/5.jpg" class="img-responsive" alt="Skin Whitening Lotions" title="Skin Whitening Lotions"/>
                    <p>Skin Whitening Lotions</p>
                </div>
                </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Anti-Ageing-Injections">
                <div class="prolistdiv">
                    <img src="images/skinimg/anti-ageing.jpg" class="img-responsive" alt="Anti Ageing Injections" title="Anti Ageing Injections"/>
                    <p>Anti Ageing Injections</p>
                </div>
                </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Weight-Gain-Capsules">
                <div class="prolistdiv">
                    <img src="images/skinimg/weight_gain.jpg" class="img-responsive" alt="Weight Gain Capsules" title="Weight Gain Capsules"/>
                    <p>Weight Gain Capsules</p>
                </div>
                </a>
			</div>
             <div class="col-md-3">
                 <a href="https://www.tamazglobal.com/SubCategory/Weight-Loss-Pills">
                <div class="prolistdiv">
                    <img src="images/skinimg/weightloss.jpg" class="img-responsive" alt="Weight Loss Pills" title="Weight Loss Pills"/>
                    <p>Weight Loss Pills</p>
                </div>
                </a>
			</div>
        </div>

       

        <div class="row mb-lg cusprolist brands">
            <div class="col-md-12">
                 <div class="new_title center">
              <h2>Tamaz Global Top Brands</h2>
            </div>
            </div>
               <%=strTopBrands %>
            <%--<div class="col-md-3">
                <div class="prolistdiv">
                   
                    <img src="images/skinimg/logo/glutax.png" class="img-responsive" alt="Glutax Logo" title="Glutax Logo"/>
                    <p></p>
                </div>
                <div class="subhdhome">
                 <p>Glutax Series</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/relumins.png" class="img-responsive" alt="Relumins Logo" title="Relumins Logo"/>
                   
                </div>
                 <div class="subhdhome">
                 <p>Relumins Products</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/1a.png" class="img-responsive" alt="Veniscy Logo" title="Veniscy Logo"/>
                   
                </div>
                  <div class="subhdhome">
                 <p>Veniscy Injections</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/2.png" class="img-responsive" alt="Tatiomax Logo" title="Tatiomax Logo"/>
                   
                </div>
                  <div class="subhdhome">
                 <p>Tatiomax Products</p>
                </div>
			</div>--%>
            
       <%-- </div>--%>
        
        <%--<div class="row mb-lg cusprolist mobbrands">
            <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/3a.png" class="img-responsive mob-bio-rae" alt="Bio Rae Logo" title="Bio Rae Logo"/>
                    
                </div>
                <div class="subhdhome">
                 <p>Bio Rae Injections</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/gluta-c.png" class="img-responsive" alt="Gluta-C Logo" title="Gluta-C Logo"/>
                    
                </div>
                  <div class="subhdhome">
                 <p>Gluta - C Products</p>
                </div>
			</div>


             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/royale-beauty.png" class="img-responsive" alt="Royale Beauty Logo" title="Royale Beauty Logo"/>
                   
                </div>
                 <div class="subhdhome">
                 <p>Royale Beauty Products</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/4a.png" class="img-responsive mob-bio-rae" alt="Vita glow Logo" title="Vita glow Logo"/>
                    
                </div>
                  <div class="subhdhome">
                 <p>Vita glow Products</p>
                </div>
			</div>

          
        </div>--%>
          <%--<div class="row mb-lg cusprolist mobbrands">
                <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/5a.png" class="img-responsive mob-bio-rae" alt="Renew Logo" title="Renew Logo"/>
                   
                </div>
                     <div class="subhdhome">
                 <p>Renew Products</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    
                    <img src="images/skinimg/logo/active-white.png" class="img-responsive" alt="Active White Logo" title="Active White Logo"/>
                   
                </div>
                 <div class="subhdhome">
                 <p> Active White Products</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/6a.png" class="img-responsive" alt="Dr.James Products Logo" title="Dr.James Productsss Logo"/>
                   
                </div>
                  <div class="subhdhome">
                 <p>Dr.James Products</p>
                </div>
			</div>
             <div class="col-md-3">
                <div class="prolistdiv">
                    <img src="images/skinimg/logo/7.png" class="img-responsive" alt="Health Tone Products Logo" title="Health Tone Productsss Logo"/>
                   
                </div>
                 <div class="subhdhome">
                 <p>Health Tone Proudtcs</p>
                </div>
			</div>
        </div>--%>
      <div class="clearfix"></div>
   
    </div>
  </section>
                
              <%--<section class="main-container col1-layout home-content-container" style="min-height:300px !important;">
    <div class="container">
      <div class="">
        <div class="best-seller-pro wow bounceInUp animated">
          <div class="slider-items-products">
            <div class="new_title center">
              <h2>Tamaz Global Top Brands</h2>
            </div>
            <div id="best-seller-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col4"> 
                
                <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area">  <img src="images/relumins-logo/relumins.png" class="img-responsive" alt="Relumins Logo" title="Relumins Logo"/> </div>
                  
                    
                  </div>
                </div>
                <!-- End Item --> 
                
                <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/relumins.png" class="img-responsive" alt="Relumins Logo" title="Relumins Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/venisyslogo.jpg" class="img-responsive" alt=Venisys Logo" title="Venisys Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                  <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/tatiomax-logo.jpg" class="img-responsive" alt=Tatiomax Logo" title="Tatiomax Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                  <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/gluta-c-logo.png" class="img-responsive" alt=Gluta-c Logo" title="Gluta-c Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                  <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/royal_beauty_logo.png" class="img-responsive" alt=Royal Beauty Logo" title="Royal Beauty Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                  <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/relumins.png" class="img-responsive" alt="Relumins Logo" title="Relumins Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
                  <!-- Item -->
                <div class="item">
                  <div class="col-item">
                   
                    <div class="product-image-area"><img src="images/relumins-logo/relumins.png" class="img-responsive" alt="Relumins Logo" title="Relumins Logo"/> </div>
                    
                    
                  </div>
                </div>
                <!-- End Item --> 
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>--%>
                 <section class="">
    <div class="container">
                <div class="category-products" style="margin-top: 20px;">
        <div class="row tile" >
        <div class="col-md-6" style="padding:0px;">
        <div class="col-sm-6">
         <div class="rfid-sol"  style=" background:#85B756;">
         <center><img src="images/tile-icon/wholesale.png" style="margin-top:22px;" /></center>
         <a href="#" style="color:White;">Only Wholesale no Retail</a>
          <div class="clearfix"></div>
         </div>
           <div class="clearfix"></div>
         </div>
        <div class="col-sm-6">
         <div class="rfid-sol"  style=" background:#E1B111;">
         <center><img src="images/tile-icon/genuine.png" style="margin:12px 0px 10px 0px;" /></center>
        
         <a href="#" style="color:White;">100% Genuine Product</a>
      
          <div class="clearfix"></div>
         </div>
           <div class="clearfix"></div>
         </div>
        
      
         </div>
         
         <div class="col-md-6">
         
         <div class="about-company">
              <div class="new_title center" style="margin-bottom:12px;">
              <h1 style="margin-top:0px !important;">Welcome To Tamaz Global</h1>
            </div>
         
      <p style="text-align:justify;">
	  Tamaz Global Trading Co. is one of the most active wholesale distributors providing the thorough supply of various personal care products. We believe in distributing the utmost genuine and trusted range of skin fairness cosmetics and whitening pills throughout the nation. Hence, we supply only from the highly reliable and popular manufacturing brands till date. Our dealership covers almost every corner of the country including Bangalore, Chennai, Kerala, Delhi, NCR, Maharashtra, Hyderabad, Lucknow, Punjab, Rajasthan, Gujarat, West Bengal and many more.
</p>
     

      
      
     
         </div>
         
         </div>
         
            <div class="col-md-12">
                <p>At TAMAZ Global, we are into supplying of specialized series of skin whitening products like; skin whitening pills and injections, anti-aging products, weight loss products, weight gain products, health care products, health supplements, hair care products, and cosmetics across India. Because of highly qualified and skilled professional team support, every product we supply has a quality assurance and meets the industrial standards.
</p>
                <p>Over the years, TAMAZ Global has been listed as the topmost wholesale distributor across the country on the basis of large customer base and customer reliance. Our specialized service and strong supply chain management have made us achieve our ultimate goal and stand erect in the domestic market.</p>

                <p>TAMAZ Global always promotes product quality; excellent service and best delivery span assurance. Also, it gives its special attention to the customer satisfaction regarding demand fulfillment, costing, and customer relationship. The supply of demand is our primary moto and we attend every order with equal enthusiasm. The guaranteed supply at the doorstep in the committed time span is something our existing clients admire about us.
</p>
                <p>Not only in demand supply chain, TAMAZ Global has always collaborated with the market change and new technologies in order to establish a strong connection with the clients. Eligible Individuals are availed with immediate online distributorship along with active customer help desk service. In addition to that, convenient contact details have been provided in case of any query or support in terms of dealership for the available products.
</p>
                <br />
            </div>

        </div>
      
   </div>
        </div>
    </section>

                <footer class="footer">
    
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="block-subscribe">
              <div class="newsletter">
                <div>
                  <h4 style="dispaly:block;">Connect us on Whatsapp</h4>
                  <input type="text" placeholder="Enter your Whatsapp Number" class="input-text required-entry validate-email" title="Sign up for our whatsapp" id="newsletter1"  runat="server" />
                  <asp:Button class="subscribe" style="background-color:#FDD922;padding:7px 20px;border:1px solid #fdd922;" ID="btn_connect" runat="server" Text="Lets Connect" 
                        onclick="btn_connect_Click"></asp:Button>
                     

                     <div id="whats_app_pop" class="modal fade">
        <div class="modal-dialog" style="width:350px;">
            <div class="modal-content">
                <div class="modal-body" style="padding:20px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background:#EA3994;color:#fff;">&times;</button>
                    <h4 style="font-weight:600;text-transform:none;color:#555;line-height:25px;">Your phone number is submitted successfully, soon you will start receiving the alert on your whatsapp number. </h4>
                    
                    </div>
                    </div>
                    </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="block-subscribe">
              <div class="newsletter">
                <div>
                  <h4 style="dispaly:block;">Our Whatsapp no for 24x7 Queries</h4>
                  <div class="col-sm-6 p0"> <h3 style="font-size:18px;margin-top:5px;">+91 9900746748</h3></div>
                 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-middle" style="display: inline;">
         <div class="container">
        <div class="row">
      <div class="col-md-4 col-sm-4">
        <h4>About Tamaz Global</h4>
        <p style="text-align:justify;">Tamaz Global is a global distributor of Skin Whitening Pills, Injections, Cream, Soap and Skin fairness natural products. We are largest wholesale supplier for skin whitening injections & pills.</p>

      </div>

      <div class="col-md-2 col-sm-4">
        <h4>Links</h4>
        <ul class="links">
          <li class="first"><a href="#" title="Privacy Policy">FAQ's</a></li>
          <li><a href="#" title="Terms & Conditions">Terms & Conditions</a></li>
          
          </ul>
      </div>
      <div class="col-md-2 col-sm-4">
        <h4> Links</h4>
        <div class="social">
              <ul class="links">
          <li class="first"><a href="#" title="Privacy Policy">Skin Whitening Products</a></li>
          <li><a href="#" title="Terms & Conditions">Skin Whitening Creams</a></li>
          
          </ul>
            </div>
      </div>
      <div class="col-md-4 col-sm-4">
        <h4>Contact us</h4>
        <div class="contacts-info">
          
           <div class="phone-footer"><i class="phone-icon">&nbsp;</i><a href="tel:+919988227622" style="color:#797979;"><span style="line-height:30px;float:left;padding-left:7px;">+91 9988227622</span></a></div>
          <div class="email-footer"><i class="email-icon">&nbsp;</i> <a href="mailto:sales@tamazglobal.com"><span style="padding-left:14px;float:left">sales@tamazglobal.com</span></a></div>
        </div>
      </div>
            </div>
    </div>
        </div>
    <div class="clearfix"></div>
    <div class="footer-bottom">
         <div class="container">
        <div class="row">
      <div class="col-sm-6 col-xs-12 coppyright" style="text-align:left;"> &copy; 2017 Tamaz Global . All Rights Reserved. </div>
      <div class="col-sm-6 col-xs-12 company-links" style="text-align:right;color:#ccc;">
     <a href="http://www.nextwebi.com">A Web Designing Company - Nextwebi</a>
        </div>
            </div>
      </div>
    </div>
  </footer>
                <script src="js/core.js" type="text/javascript"></script>
                <div class="feedback">
                    <a id="feedback_button">Request a Callback</a>
                    <div class="form" style="border: 2px solid rgb(253, 217, 34);">
                        <span style="font-size: 9px; font-weight: bold;">Please Send us your details to call
                        back</span> <span class="status"></span>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_CBmobileno" CssClass="CB_text_box" Width="200px" Style="margin-top: 10px;"
                                        placeholder="Mobile no" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_CBname" CssClass="CB_text_box" Width="200px" Style="margin-top: 10px;"
                                        placeholder="Name" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txt_CBTime" Width="200px" CssClass="CB_text_box" Style="margin-top: 10px;"
                                        placeholder="Time of Call" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_CBsubmit" runat="server" Style="margin-top: 10px;" CssClass="CB_btn"
                                        Text="Submit" OnClick="btn_CBsubmit_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <a id="contact" href="#">
                    <div class="cont">
                        <strong>Contact Us</strong>
                    </div>
                </a> <a id="callme" href="tel:+919900746748"</a>
                    <a <div class="callme" style="text-decoration: blink">
                        <span class="blink_me">
                            <img src="images/call_us.png" alt="Call Us" title="Call Us"/></span>
                    </div>
                </a>
            </div>
        </div>
        <div id="contact-plugin" class="cp-btn-close">
        </div>
        <div id="contact-plugin-body" class="cp-body-close">
            <div id="cp-inner" class="cp-none">
        <h2>Quick Contact</h2>
        <div class="cp-form">
        <asp:TextBox ID="txt_name" CssClass="form-control cp-text" PlaceHolder="Name" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txt_name" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_email" CssClass="form-control cp-text" PlaceHolder="Email" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txt_email" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Email"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txt_email" ErrorMessage="Invalid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:TextBox ID="txt_mobile" CssClass="form-control cp-text" PlaceHolder="Mobile" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txt_mobile" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Mobile NO."></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                ControlToValidate="txt_mobile" ErrorMessage="10 Digit mobile no."
                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="txt_mobile"/></asp:FilteredTextBoxExtender>
        <asp:TextBox ID="txt_message" CssClass="form-control cp-text" PlaceHolder="Message" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txt_message" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Message"></asp:RequiredFieldValidator>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6 col-xs-4">
                            <asp:Image ID="imgCaptcha" Style="position: relative; right: 0px; top: 0px;" runat="server" />

                        </div>
                        <div class="col-md-6 col-xs-4">
                            <asp:ImageButton ID="btnRefresh" Style="border-width: 0px; width: 80%;" CausesValidation="false" OnClick="btnRefresh_Click1" ImageUrl="images/reset-icon.png" runat="server" />

                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <%--  <asp:PostBackTrigger  ControlID="btnRefresh"/>--%>
                </Triggers>
            </asp:UpdatePanel>
    
            <asp:TextBox ID="txtCaptcha" placeholder="Please enter above code" Style="margin-top: 6px;" runat="server"
                CssClass="large-field">
            </asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtCaptcha" ValidationGroup="Reg" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Captcha"></asp:RequiredFieldValidator>
         
            <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="lblsuccess" runat="server" Text=""></asp:Label><br />
        <asp:Button ID="btn_submit" CssClass="btn btn-default cp-button"  runat="server" Text="Submit" 
                onclick="btn_submit_Click" />
        </div>
        </div>
        </div>
        <%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/parallax.js"></script>
        <script type="text/javascript" src="js/common.js"></script>
        <script type="text/javascript" src="js/revslider.js"></script>
        <script type="text/javascript" src="js/owl.carousel.min.js"></script>
        <%--<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>--%>



        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('#rev_slider_4').show().revolution({
                    dottedOverlay: 'none',
                    delay: 5000,
                    startwidth: 831,
                    startheight: 305,

                    hideThumbs: 200,
                    thumbWidth: 200,
                    thumbHeight: 50,
                    thumbAmount: 2,

                    navigationType: 'thumb',
                    navigationArrows: 'solo',
                    navigationStyle: 'round',

                    touchenabled: 'on',
                    onHoverStop: 'on',

                    swipe_velocity: 0.7,
                    swipe_min_touches: 1,
                    swipe_max_touches: 1,
                    drag_block_vertical: false,

                    spinner: 'spinner0',
                    keyboardNavigation: 'off',

                    navigationHAlign: 'center',
                    navigationVAlign: 'bottom',
                    navigationHOffset: 0,
                    navigationVOffset: 20,

                    soloArrowLeftHalign: 'left',
                    soloArrowLeftValign: 'center',
                    soloArrowLeftHOffset: 20,
                    soloArrowLeftVOffset: 0,

                    soloArrowRightHalign: 'right',
                    soloArrowRightValign: 'center',
                    soloArrowRightHOffset: 20,
                    soloArrowRightVOffset: 0,

                    shadow: 0,
                    fullWidth: 'on',
                    fullScreen: 'off',

                    stopLoop: 'off',
                    stopAfterLoops: -1,
                    stopAtSlide: -1,

                    shuffle: 'off',

                    autoHeight: 'off',
                    forceFullWidth: 'on',
                    fullScreenAlignForce: 'off',
                    minFullScreenHeight: 0,
                    hideNavDelayOnMobile: 1500,

                    hideThumbsOnMobile: 'off',
                    hideBulletsOnMobile: 'off',
                    hideArrowsOnMobile: 'off',
                    hideThumbsUnderResolution: 0,

                    hideSliderAtLimit: 0,
                    hideCaptionAtLimit: 0,
                    hideAllCaptionAtLilmit: 0,
                    startWithSlide: 0,
                    fullScreenOffsetContainer: ''
                });
            });
        </script>
    </form>
	
      <a href="https://api.whatsapp.com/send?phone=919988227622">
            <div style="background-color:#0061AB; padding: 3px; border-radius: 50px; color: #fff !important; cursor: pointer; position: fixed; text-align: center; width: 155px; z-index: 20000; font-size: 17px; font-weight: bold;" class="contact-us">
                <span class="blink_text">
                    <img style="width: 20px; height: 20px; margin-right: 5px; margin-top: 2px;" src="http://www.nextwebi.com/images/whatappimg.png">Whatsapp<br>
                    0919988227622
                </span>
            </div>
        </a>
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "Article",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.tamazglobal.com/blogs/"
  },
  "headline": "Top 5 Glutathione Skin Whitening Injections in India",
  "image": [
  
       "https://www.tamazglobal.com/image/Banner-02.png"
   ],
  "datePublished": "2015-02-05T08:00:00+08:00",
  "dateModified": "2015-02-05T09:20:00+08:00",
  "author": {
    "@type": "Person",
    "name": "TamazGlobal"
  },
   "publisher": {
    "@type": "Organization",
    "name": "TamazGlobal",
    "logo": {
      "@type": "ImageObject",
      "url": "https://tamazglobal.com/images/tamaz_logo.png"
    }
  },
  "description": "Glutathione Skin Whitening Injections is one of the popular skin whitening solutions available for both men and women. "
}
</script>
<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "Product",
  "name" : "Glutathione Skin Whitening Injections in India",
  "image" : "https://www.tamazglobal.com/product/07201621055529508_big.jpg",
  "description" : "these Injections helps to remove dark marks, scars, skin blemishes and dark complexion from your skin. On the other hand, you will find various other skin treatments that can be used forgetting fair and smooth skin, but Skin Whitening Injections are the safest and leave no side effects on the body. That’s the reason these Injections are very popular in the beauty market. The ingredients present in the injections provide the number of benefits to the skin as well as to the body. Moreover, brightening the skin complexion, it also acts as an anti-aging agent by eliminating fine lines and wrinkles. Beauty injections are mainly prepared with glutathione- Glutathione is the body&#39;s most powerful antioxidant, unknown by most. It is popular because it helps whiten skin though. Glutathione is very popular in the field of skin whitening and helping people to achieve the skin pigmentation they desire with no harmful side effects if taken in proper dosages",
  "url" : "https://www.tamazglobal.com/SubCategory/Skin-Whitening-Injections",
  "brand" : [ {
    "@type" : "Brand",
    "name" : "Glutax"
  }, {
    "@type" : "Brand",
    "name" : "Relumins"
  }, {
    "@type" : "Brand",
    "name" : "Cindella"
  }, {
    "@type" : "Brand",
    "name" : "Tatiomax"
  }, {
    "@type" : "Brand",
    "name" : "Veniscy"
  }, {
    "@type" : "Brand",
    "name" : "Tatio Active"
  }, {
    "@type" : "Brand",
    "name" : "Bio Rae"
  } ]
}
</script>
	
</body>
</html>
