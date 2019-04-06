<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="UpdateSupplier.aspx.cs" Inherits="Admin_UpdateSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="breadcrumb">
        <li class="active">Update Supplier</li>
    </ul>
    <div class="well">
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
        <label>Select Supplier</label>
        <asp:DropDownList ID="ddl_supplier" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_supplier_SelectedIndexChanged">
        </asp:DropDownList><br />
        <label>Supplier Name</label>
        <asp:TextBox ID="txt_supplier" runat="server"></asp:TextBox><br />
        
        <br />
        <asp:Button ID="btn_pupdate" runat="server" CssClass="btn btn-primary" 
            Text="Update Supplier" onclick="btn_pupdate_Click" />
    </div>
</asp:Content>

