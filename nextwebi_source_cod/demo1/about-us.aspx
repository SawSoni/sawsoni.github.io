<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="bannersection">
        <img src="images/aboutbanner.jpg" />
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="heading1">About Us</h2>
                </div>
                <div class="col-md-12">
                    <p>Blue Cold Refrigeration Pvt. Ltd. was established in 2012 as manufacturer and supplier of freon evaporators and condensing units for cold rooms and cold storages. In a short stint of this timeline, we have grown to tremendous heights. As a result, today we have reached to a position of leader in manufacturing and designing of refrigeration equipment for various applications.Quality has always been a premium at Blue Cold Refrigeration and the strict standards followed to supply best of its products. With continuous efforts and adoption of latest technologies Blue Cold Refrigeration gained enamours experience in developing world class machineries for delivering medium, low & ultra-low temperature.</p>
                    <p>To facilitate the ever increasing demand of the Indian market Blue Cold has set up its State-of-art manufacturing units in Bangalore. This strategically established manufacturing unit help to leverage the productions of world-class products using highly advanced technologies and our commitment to quality with intellectually driven workforce.</p>
                    <p>With the team of approx. 80 working professionals we are operating from 8 major parts of the country having its head office in Bangalore and presence of Blue Cold representatives in Mumbai, Ahmedabad, Delhi, Chandigarh, Kolkata, Hyderabad & Chennai efforts are being constantly taken to increase this penetration level and make the quality equipment available even in the remotest corners of the country.</p>
                </div>
                <%--<div class="col-md-4">
                    <img src="images/aboutimg.jpg" />
                </div>--%>
            </div>
        </div>
    </section>
    <div class="featured-boxes-full featured-boxes-full-scale">
	    <div class="col-md-6">
		    <div class="featured-box-full featured-box-full-primary" style="background:rgba(0, 0, 0, 0) url('images/vissionbg.jpg') no-repeat scroll 0 0 / 100% auto;">
			    <i class="icon-bulb icons"></i>
			    <h2>Our Vision</h2>
			    <p class="lead">To be the best & preferred brand of refrigeration equipment manufacturer in the Indian market.</p>
		    </div>
	    </div>
	    <div class="col-md-6">
		    <div class="featured-box-full featured-box-full-primary" style="background:rgba(0, 0, 0, 0) url('images/missionbg.jpg') no-repeat scroll 0 0 / 100% auto">
			    <i class="icon-target icons"></i>
			    <h2>Our Mission</h2>
			    <p class="lead">To provide world class and latest refrigeration equipment at Indian prices to Indian refrigeration & cold chain industry.</p>
		    </div>
	    </div>
    </div>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="heading1">Our Quality Guidelines</h2>
                    <p>All incoming materials should be 100% inspected.</p>
                    <p>Quality of product should be continuously improved with the following 4 tools:</p>
                    <ul class="list1">
                        <li>Training & skilling of team</li>
                        <li>Adoption of latest tools for consistent quality</li>
                        <li>Solving the root cause of failures</li>
                        <li>Implementing process that gives CONSISTANT HOGH QUALITY of products</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <img src="images/quality.jpg" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>

