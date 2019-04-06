<%@ Page Title="Our Distributers | Tamaz Global Trading Co." Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Distributers.aspx.cs" Inherits="Distributers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .tabs {
    width:100%;
    display:inline-block;
}
 
    /*----- Tab Links -----*/
    /* Clearfix */
    .tab-links:after {
        display:block;
        clear:both;
        content:'';
    }
 
    .tab-links li {
        margin:0px 5px 0 0;
        float:left;
        list-style:none;
    }
 
        /*.tab-links a {
            padding:9px 15px;
            display:inline-block;
            border-radius:3px 3px 0px 0px;
            background:#ebebeb;
            font-size:16px;
            font-weight:600;
            color:#4c4c4c;
            transition:all linear 0.15s;
        }
 
        .about-company .tab-links a:hover {
            background:#E61A4A;
            text-decoration:none;
            color:#fff;
        }
 
    .about-company li.active a, li.active a:hover {
        background:#E61A4A;
        color:#fff;
    }*/
 
    /*----- Content of Tabs -----*/
    .tab-content {
    background: #fff;
    border-radius: 3px;
    padding: 10px;
    box-shadow: none;
}
    .tab-links {
    border-bottom: 2px solid rgb(230,26,74);
}
    .dsipad{
        height:152px;
    }
    </style>
   <script>
       jQuery(document).ready(function () {
           jQuery(document).ready(function () {
               jQuery('.tabs .tab-links a').on('click', function (e) {
                   var currentAttrValue = jQuery(this).attr('href');

                   // Show/Hide Tabs
                   jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

                   // Change/remove current tab to active
                   jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

                   e.preventDefault();
               });
           });
       });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="category-products" style="margin-top: 20px;">
        <div class="row tile" >
        
         
         <div class="col-md-12">
               <div class="about-company">
                   <div class="new_title center">
              <h2 style="margin-top:0px;">Our Distributors</h2>
                </div>
                  
    <div class="tabs">
    <%--<ul class="tab-links">
        <li class="active"><a href="#tab1">All</a></li>
        <li><a href="#tab2">Bangalore</a></li>
        <li><a href="#tab3">Chennai</a></li>
        <li><a href="#tab4">Delhi</a></li>
    </ul>--%>
 
    <div class="tab-content">
        <div id="tab1" class="tab active">
            <div class="row">
                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Bangalore & All Over Karnataka</h2>
                    <h3>Mr. Danish</h3>
                    <p><b>Language Know:</b> English, Hindi, Kanada</p>
                    <p><b>Contact No:</b> <a href="tel:+919980273747">+91 9980273747</a></p>
                </div>
                    </div>
                    <div class="col-md-4">
                <div class="dsipad" >
                    <h2>Chennai & All Over Tamil Nadu</h2>
                    <h3>Mr. Dinesh</h3>
                    <p><b>Language Know:</b> English, Tamil, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919962255932">+91 9962255932</a></p>
                </div>
                        </div>
                        <div class="col-md-4">
                <div class="dsipad">
                    <h2>Delhi & NCR</h2>
                    <h3>Mr. Nikesh</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919873850202">+91 9873850202</a></p>
                </div>
                            </div>
                </div>
            <div class="row">
                            <div class="col-md-4">
                <div class="dsipad">
                    <h2>Mumbai & Nashik</h2>
                    <h3>Mr. Abhijeet</h3>
                    <p><b>Language Know:</b> English, Hindi, Marathi</p>
                    <p><b>Contact No:</b> <a href="tel:+919223268630">+91 9223268630</a></p>
                </div>
                                </div>
                                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Hyderabad & All Over Andhra</h2>
                    <h3>Mr. Raj</h3>
                    <p><b>Language Know:</b> English, Telugu, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919962255932">+91 9962255932</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Lucknow & All Over UP</h2>
                    <h3>Mr. Armaan</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919916130333">+91 9916130333</a></p>
                </div>
            </div>

            </div>
            
            <div class="row">
                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Chandigarh, Punjab, & Haryana</h2>
                    <h3>Mr. Danish</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919980273747">+91 9980273747</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Jaipur & All Over Rajasthan</h2>
                    <h3>Ms. Neha</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+917340699759">+91 7340699759</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Ahmedabad & All Over Gujarat</h2>
                    <h3>Ms. Samina</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+917567963932">+91 7567963932</a></p>
                </div>
            </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Panaji & All Over Goa</h2>
                    <h3>Mr. Mallick</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919769021333">+91 9769021333</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Kolkata & All West Bengal</h2>
                    <h3>Mr. Kabeer</h3>
                    <p><b>Language Know:</b> English, Hindi, Bengali</p>
                    <p><b>Contact No:</b> <a href="tel:+919741045673">+91 9741045673</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Shillong & All Over Northeast</h2>
                    <h3>Ms. Shanaya</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919148922247">+91 9148922247</a></p>
                </div>
            </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Kochi & All Over Kerala</h2>
                    <h3>Mr. Fazil</h3>
                    <p><b>Language Know:</b> English, Malayalam</p>
                    <p><b>Contact No:</b> <a href="tel:+919746005202">+91 9746005202</a></p>
                </div>
            </div>

                <div class="col-md-4">
                <div class="dsipad">
                    <h2>Pune & All Over Maharashtra</h2>
                    <h3>Ms. Zara</h3>
                    <p><b>Language Know:</b> English, Hindi</p>
                    <p><b>Contact No:</b> <a href="tel:+919321404737">+91 9321404737</a></p>
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
</asp:Content>

