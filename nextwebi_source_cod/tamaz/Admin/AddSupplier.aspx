<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AddSupplier.aspx.cs" Inherits="Admin_AddSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul class="breadcrumb">
        
            <li class="active">Add Suppliers</li>
        </ul>
        <div class="well">
    
    <div id="myTabContent" class="tab-content">
        <asp:Label ID="lbl_success" runat="server"></asp:Label><br />
    <label>Supplier Name</label>
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
        <label>Company</label>
        <asp:TextBox ID="txt_company" runat="server"></asp:TextBox>
        <label>Contact Number</label>
        <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
        <label>Email</label>
        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
        <label>Website</label>
        <asp:TextBox ID="txt_website" runat="server"></asp:TextBox>
        <label>Country</label>
        <asp:TextBox ID="txt_country" runat="server"></asp:TextBox>
        <label>Address</label>
        <asp:TextBox ID="txt_address" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
        <label>Trust Level   (1-5)</label>
        <asp:TextBox ID="txt_tl" runat="server"></asp:TextBox>
        <label>rating      (1-10)</label>
        <asp:TextBox ID="txt_rating" runat="server"></asp:TextBox><br />
        <br />
        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary" 
            Text="Add Supplier" onclick="btn_submit_Click" />
    </div>
    </div>
</asp:Content>

