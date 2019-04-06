<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="career.aspx.cs" Inherits="career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .main{margin-bottom:0;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="careerbanner">
    <div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Join Us and Shape Your Career Success Story!</h1>
        <p>BlueCold  combines 9+ years of creating secure enterprises with futuristic products designed to prevent cybercrimes even before it happens.</p>
			</div>     
		</div>
	</div>
</section>
    <section class="carrerflod2">
        <div class="env">
           <h1 class="heading1">Environment</h1>
           <p>Data Resolve Technologies is a place of thinkers, believers and doers. Get ready to join some of the most creative minds in the industry who are pioneers in the technology & innovation sector. Our quest for keeping up with the latest product innovations ensures our sustained market leadership & your professional growth as well.</p>
        </div>
        <div class="cul">
          <h1 class="heading1">Culture</h1>
          <p>Get ready to be a part of a working culture that is grounded on team work and mutual respect. We encourage excellence and root for everyone to give their best, aim high and attain the best outputs. </p>
        </div>
        <div class="ben">
          <h1 class="heading1">Benefits & Perks</h1>
          <p>We provide medical insurance, mobile & data reimbursement, business travel expenses and provide you with a platform to learn and grow in a high-tech product company and enable you with an opportunity work on varied platforms.</p>
        </div>
    </section>
    <section class="section uploadformdiv">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-push-3">
                    <h3>Upload Your Profile</h3>
                    <div class="forminpaddiv">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>E-Mail</label>
                        <input type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Contact No.</label>
                        <input type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Current City</label>
                        <input type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>No of Years Experince</label>
                        <input type="text" class="form-control" />
                    </div>                    
                    <div class="form-group">
                        <label>Upload</label>
                        <input type="file" class="form-control" style="height:auto;"/>
                    </div>
                    <input type="submit" value="Submit" class="btn btn-primary" />
                        </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

