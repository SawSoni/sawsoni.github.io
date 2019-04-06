<%@ Page Title=" Distributor Registration | Tamaz Global Trading Co." Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="distributor-registration.aspx.cs" Inherits="distributor_registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
  h2 {
    border-bottom: 1px solid #e4e4e4;
    color: #444;
    font-size: 15px;
    font-weight: normal;
    margin-bottom: 5px;
    margin-top: 0;
    padding: 3px 8px;
    text-transform: uppercase;
}
.left {
    float: left;
    width: 48%;
    border-bottom:1px solid #ccc;
}
.content {
    padding: 20px 0;
}
.large-field
{
    min-width: 200px;
    width:80% !important;
    max-width: 80% !important;
    margin:10px 0px 0px 0px;
      border: 1px solid #e1e1e1;
    height: 37px;
    padding: 0 12px;
    
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background:#f5f5f5;padding:10px;">
<div id="content" style="background:#ddd;" >
      <!--Breadcrumb Part Start-->
  <div>  <div class="inner-header">
		<div class="">
			<div class="">
            <div class="about-company">
            <h1 style="width:20%;color:#333;border-bottom:none;padding-left:10px;padding-bottom:10px;margin-bottom:0px;">Distributor Registration</h1>
            </div>
				<h6 class="inner-title" style="margin-bottom:0px;"></h6>
			</div>
            </div></div>
      <!--Breadcrumb Part End-->
       <div class="login-content">
        
        <div class="left">
         <%-- <h2>Registered Customer</h2>--%>
          
            <div class="content" style="padding-top:0px;">
              
            
              
              <asp:TextBox ID="txt_artistname" CssClass="large-field" placeholder="Name"  runat="server"></asp:TextBox>
              <br>
              <br>
             
              <asp:TextBox ID="txt_artistemail" CssClass="large-field" placeholder="Email"  runat="server"></asp:TextBox>
              <br><br>
             
              <asp:TextBox ID="txt_artistmobile" CssClass="large-field" placeholder="Phone no" runat="server"></asp:TextBox>
              <br><br>
             
              <asp:TextBox ID="txt_artistcity" CssClass="large-field" placeholder="City"  runat="server"></asp:TextBox><br /><br />
             
               <asp:TextBox ID="txt_artistvideolink" CssClass="large-field"  placeholder="Video Link" runat="server"></asp:TextBox>
               <br /><br />
                <b>Upload Image:</b><br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
               <br />
             
              <asp:Button ID="btn_artistregistration" CssClass="button" 
                    style="background:#2957A4;color:#fff;" runat="server" Text="Submit" 
                    />
                    
                  
                
            </div>
          
        </div>
      </div></div> 
    </div>
    <div class="clearfix"></div>
    </div>
</asp:Content>

