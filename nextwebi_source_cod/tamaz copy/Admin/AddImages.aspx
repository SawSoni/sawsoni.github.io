<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AddImages.aspx.cs" Inherits="Admin_AddImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        
            <li class="active">Add Images</li>
        </ul>
        <div class="well">
    
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <div id="tab">
        <label>Select Product</label>
        <asp:DropDownList ID="ddl_category" runat="server" 
            >
        </asp:DropDownList>
        <br />
        <br />
        
        <label>Product Image</label>
        <asp:FileUpload ID="FileUpload1"  runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server"
            Text="Upload" onclick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="lbl_added" runat="server" Text=""></asp:Label>
   
</asp:Content>

