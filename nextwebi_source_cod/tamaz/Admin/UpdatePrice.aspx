<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="UpdatePrice.aspx.cs" Inherits="Admin_UpdatePrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="breadcrumb">
        <li class="active">Update Price</li>
    </ul>
    <div class="well">
      <div style="float:left; width:45%">
        <asp:Label ID="lbl_success" runat="server"></asp:Label><br />
    <label>Select Category</label>
        <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_category_SelectedIndexChanged">
        </asp:DropDownList><br />
         <label>Select Sub Category</label>
        <asp:DropDownList ID="ddl_subcategory" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_subcategory_SelectedIndexChanged">
        </asp:DropDownList><br />
         <label>Select Product</label>
        <asp:DropDownList ID="ddl_product" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_product_SelectedIndexChanged">
        </asp:DropDownList><br />
        <label>Original Price</label>
        <asp:TextBox ID="txt_oprice" runat="server"></asp:TextBox><br />
        <label>Discount Price</label>
        <asp:TextBox ID="txt_dprice" runat="server"></asp:TextBox><br />
        <label>Final Price</label>
        <asp:TextBox ID="txt_fprice" runat="server"></asp:TextBox><br />
        <br />
        <asp:Button ID="btn_pupdate" runat="server" CssClass="btn btn-primary" 
            Text="Update Price" onclick="btn_pupdate_Click" />
      </div>
      <div style="width:45%; float:right; padding:20px; font-weight:bold; font-size:16px; background-color:#ccc; margin-top:45px">
      Model No : <span id="model" runat="server"></span><br /><br />
      Company : <span id="company" runat="server"></span>
      </div>
      <div style="clear:both"></div>
    </div>
</asp:Content>

