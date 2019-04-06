<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .main{margin-bottom:0;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="contactpage">
        <div class="container">
			<div class="row">
                <div class="col-md-6">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d124495.1738871025!2d77.68666!3d12.812606!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x70904b4fd7daec0c!2sBlue+Cold+Refrigeration+Pvt.+Ltd.!5e0!3m2!1sen!2sin!4v1531572278635" width="100%" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
				<div class="col-md-6">
					<ul class="list list-icons list-icons-style-3">
						<li><i class="fa fa-map-marker"></i> <strong>Blue Cold Refrigeration Pvt Ltd</strong><br> C-37, 1st Main, 3rd Cross,<br> Bommasandra Industrial Area, <br>Bengaluru, Karnataka-560099.</li>
						<li><i class="fa fa-phone"></i> <a href="tel:+08027834996">+080 27834996</a></li>
                        <li><i class="fa fa-mobile"></i> <a href="tel:+919341980404"> +91 93419 80404</a></li>
						<li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					</ul>
				</div>
                <div class="col-md-12 mt-xlg mb-xlg">
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="Mumbai">Mumbai</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="Delhi">Delhi</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="Ahmedabad">Ahmedabad</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="kolkata">kolkata</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="Chennai">Chennai</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn1" id="Hyderabad">Hyderabad</a>

                    <div class="clearfix"></div>
                    <div class="textpad">
                        <ul id="Mumbaidiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-map-marker"></i> Building No 202 & 213, Unit no 6 to 9, Indian corporation Complex Dapode-Bhiwandi Road, Mankoli Naka, Bhiwandi, Mumbai-421302</li>
						    <li><i class="fa fa-phone"></i> <a href="tel:+919820378206"> +91 98203 78206</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					    </ul>
                        <ul id="Delhidiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-map-marker"></i> KH. No. 46/9, Ground Floor, Village-Khera Kalan, Delhi-110082</li>
						    <li><i class="fa fa-phone"></i> <a href="tel:+919099388956"> +91 90993 88956</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales.del@bluecoldref.com">sales.del@bluecoldref.com</a>, <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a></li>
					    </ul>
                        <ul id="Ahmedabaddiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-map-marker"></i> 39, Shivashakti Estate, Opp Kashiram Brts Bus Stand, Narol, Ahmedabad.</li>
						    <li><i class="fa fa-phone"></i> <a href="tel:+919099964894"> +91 90999 64894</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					    </ul>
                        <ul id="kolkatadiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-phone"></i> <a href="tel:+919836514700"> +91 98365 14700</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					    </ul>
                        <ul id="Chennaidiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-map-marker"></i> No. 79/11, Mahalakshmi Noombal Village, Nagar Ext Vellapanchavadi, Chennai-77</li>
						    <li><i class="fa fa-phone"></i> <a href="tel:+918056036516"> +91 80560 36516</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					    </ul>
                        <ul id="Hyderabaddiv" class="list list-icons list-icons-style-3">
						    <li><i class="fa fa-map-marker"></i> Shaseen Nagar, Near OS International School, Hyderabad.</li>
						    <li><i class="fa fa-phone"></i> <a href="tel:+918884953829"> +91 88849 53829</a></li>
                            <li><i class="fa fa-envelope"></i> <a href="mailto:sales@bluecoldref.com">sales@bluecoldref.com</a>, <a href="mailto:sales.blr@bluecoldref.com">sales.blr@bluecoldref.com</a></li>
					    </ul>
                    </div>
                </div>     
            </div>
		</div>
    </section>
    <section class="contactsec1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <h2><b>Enquiry Form</b></h2>
                    </div>
                    <div class="forminpaddiv">
                    <div class="col-md-6">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" />
                    </div>
                    </div><div class="col-md-6">
                    <div class="form-group">
                        <label>E-Mail</label>
                        <input type="text" class="form-control" />
                    </div>
                    </div><div class="col-md-6">
                    <div class="form-group">
                        <label>Contact No.</label>
                        <input type="text" class="form-control"/>
                    </div>
                    </div><div class="col-md-6">
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" class="form-control" />
                    </div>
                    </div><div class="col-md-12">
                    <div class="form-group">
                        <label>Company Name</label>
                        <input type="text" class="form-control" />
                    </div>                    
                    <div class="form-group">
                        <label>Message</label>
                        <textarea class="form-control" rows="4"></textarea>
                    </div>
                    <input type="submit" value="Submit" class="btn btn-primary" />
                        </div>
                </div>
			    </div>
            </div>
        </div>
    </section>
</asp:Content>

