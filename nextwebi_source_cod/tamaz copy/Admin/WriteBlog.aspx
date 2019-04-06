<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="WriteBlog.aspx.cs" Inherits="Admin_WriteBlog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Write Blogs</li>
    </ul>
    <div class="well">
    <br />
<label>Blog Title</label><br />
        <asp:TextBox ID="txt_title" PlaceHolder="Title" runat="server"></asp:TextBox><br />
        <label>Posted By</label><br />
        <asp:TextBox ID="txt_postedby" PlaceHolder="Posted By" runat="server"></asp:TextBox><br />
        <label>Page Title</label><br />
        <asp:TextBox ID="txt_pagetitle" PlaceHolder="Page Title" runat="server"></asp:TextBox><br />
        <label>Meta Keywords</label><br />
        <asp:TextBox ID="txt_keywords" PlaceHolder="Meta Keyword" runat="server"></asp:TextBox><br />
        <label>Posted on</label><br />
        <asp:TextBox ID="txt_postedon" PlaceHolder="Posted On" runat="server"></asp:TextBox>
        <asp:CalendarExtender ID="txt_postedon_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="txt_postedon">
        </asp:CalendarExtender>
        <br />
        <label>Full Description</label>
        <cc1:Editor ID="txt_content" runat="server" Height="400" Width="600" />
               <br /><br />
                   <label>Small Image</label>
     <asp:FileUpload ID="fileupload_small" runat="server" />
            <br /><br /><br />
        <asp:Label ID="lbl_success" runat="server" Text="Label"></asp:Label><br />
        <asp:Button ID="btn_submit" CssClass="btn-primary btn" runat="server" 
            Text="Post Your Blog" onclick="btn_submit_Click" />
    </div>
</asp:Content>

