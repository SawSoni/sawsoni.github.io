<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="ApproveReview.aspx.cs" Inherits="Admin_ApproveReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Approve Reviews</li>
    </ul>
    <div class="well">
    <label><b>Product Name:</b></label>
    <p id="ProductName" runat="server"></p>
    <label><b>Customer Name:</b></label>
    <p id="UserName" runat="server"></p>
    <label><b>Date:</b></label>
    <p id="DateVal" runat="server"></p>
    <label><b>Rate:</b></label>
        <asp:DropDownList ID="ddl_rating" runat="server" Width="60px">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>
    <label><b>Status:</b></label>
    <p id="Status" runat="server"></p>
    <label><b>Review:</b></label>
        <asp:TextBox ID="txt_review" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
    <br />
        
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            
        <br />
        <asp:Button ID="btn_approve" class="btn btn-primary" runat="server" 
            Text="Approve" onclick="btn_approve_Click" />
        <asp:Button ID="btn_update" runat="server" Text="Update" 
            class="btn btn-primary" style="margin-left:20px" onclick="btn_update_Click" />
    </div>
</asp:Content>

