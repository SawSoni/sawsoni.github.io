﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="BrandSeo.aspx.cs" Inherits="Admin_BrandSeo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add SEO Description For Brand</li>
    </ul>
    <div class="well">
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>

        <br />
        <label>Page Title</label>
        <asp:TextBox ID="txt_title" class="input-xlarge" PlaceHolder="Page Title" runat="server"></asp:TextBox>
        <label>Meta Keyword</label>
        <asp:TextBox ID="txt_keyword" class="input-xlarge" PlaceHolder="Meta Keywords" runat="server"></asp:TextBox>
        <label>Meta Description</label>
        <asp:TextBox ID="txt_desc" class="input-xlarge" PlaceHolder="Meta Description" runat="server"></asp:TextBox><br />
        <label>Brand Description</label>
        <cc1:Editor ID="txt_full_desc" runat="server" Height="400" Width="600" />
        <br />
        <br />
        <asp:Label ID="lbl_success" runat="server"></asp:Label><br />
        <asp:Button ID="btn_save" CssClass="btn btn-primary" runat="server" Text="Save"
            OnClick="btn_save_Click" />
        <br />
        <br />

    </div>
</asp:Content>

