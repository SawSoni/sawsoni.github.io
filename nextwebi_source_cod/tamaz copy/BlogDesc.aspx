<%@ Page Title="" Language="C#" MasterPageFile="./main2.master" AutoEventWireup="true" CodeFile="BlogDesc.aspx.cs" Inherits="BlogDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
<style>

.h1,h1
{
    font-size:30px;
}
ul, ol
{
    list-style:outside disc !important;
    margin-left:40px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="breadcrumbs">
    <div>
      <div class="row">
        <ul>
          <li class="home"> <a href="../Default.aspx" title="Go to Home Page">Home</a><span>&mdash;›</span></li>
          <li class="home"> <a href="../Blogs.aspx" title="Blogs">Blogs</a><span>&mdash;›</span></li>
          <li class="category13"><strong><%=title %></strong></li>
        </ul>
      </div>
    </div>
  </div>
<div id="blogContent" runat="server" style="font-size:13px; line-height:22px"></div>
</asp:Content>

