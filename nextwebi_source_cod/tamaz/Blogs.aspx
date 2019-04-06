<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="Blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.fa{display:inline-block;font-family:FontAwesome;font-style:normal;font-weight:normal;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}
.fa-picture-o:before{content:"\f03e"}
.beta-blog-type {
    background: none repeat scroll 0 0 #f90;
    color: #fff;
    display: block;
    font-size: 15px;
    height: 48px;
    line-height: 48px;
    padding-top: 16px;
    text-align: center;
    width: 48px;
}

.pull-left {
    float: left;
}
.beta-blog-date {
    background-color:#A7519F;
    color: #fff;
    display: block;
    height: 48px;
    text-align: center;
    width: 48px;
}
.beta-blog-month {
    display: block;
    line-height: 100%;
    padding-top: 7px;
    text-transform: uppercase;
}
.beta-blog-day {
    display: block;
    font-size: 22px;
    font-weight: 400;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="breadcrumbs">
    <div>
      <div class="row">
        <ul>
          <li class="home"> <a href="Default.aspx" title="Go to Home Page">Home</a><span>&mdash;›</span></li>
          <li class="category13"><strong>Blogs</strong></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-sm-12">
    <div id="blogContent" runat="server"></div>
					 

		
				</div>
</asp:Content>

