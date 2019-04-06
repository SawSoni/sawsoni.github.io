<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="editblog.aspx.cs" Inherits="Admin_editblog" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Edit Blog</li>
    </ul>
    <div class="well">
    <br />
    <label>Select Blog</label>
        <asp:DropDownList ID="ddl_blogtitle" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="title" 
            onselectedindexchanged="ddl_blogtitle_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:con2 %>" 
            SelectCommand="SELECT [title] FROM [blogs]"></asp:SqlDataSource>
<label>Blog Title</label><br />
        <asp:TextBox ID="txt_title" PlaceHolder="Title" runat="server"></asp:TextBox><br />
        <label>Posted By</label><br />
        <asp:TextBox ID="txt_postedby" PlaceHolder="Posted By" runat="server"></asp:TextBox><br />
        <label>Title</label><br />
        <asp:TextBox ID="txt_pagetitle" PlaceHolder="Posted By" runat="server"></asp:TextBox><br />
        <label>Meta Keywords</label><br />
        <asp:TextBox ID="txt_keywords" PlaceHolder="Posted By" runat="server"></asp:TextBox><br />
        <label>Posted on</label><br />
        <asp:TextBox ID="txt_postedon" PlaceHolder="Posted By" runat="server"></asp:TextBox>
        <asp:CalendarExtender ID="txt_postedon_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="txt_postedon">
        </asp:CalendarExtender>
        <br />
        <label>Full Description</label>
        <cc1:Editor ID="txt_content" runat="server" Height="400" Width="600" />
               <br /><br />
                <asp:Label ID="lbl_success" runat="server" Text="Label"></asp:Label><br />
        <asp:Button ID="btn_submit" CssClass="btn-primary btn" runat="server" 
            Text="Update" onclick="btn_submit_Click" />
            <div style="margin-top:30px;">
    <label><b>Upload New image</b></label>
      <br />
       <label>Image - </label>
        <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="btn_upload" runat="server" class="btn btn-primary" 
            Text="Upload" onclick="btn_upload_Click"  />
            <br />
            <asp:Label ID="lbl_added" runat="server" ></asp:Label>
        <br />
        <asp:Image ID="img_product_small" runat="server" Width="200" Height="200" />

    </div>
    </div>
    
</asp:Content>

