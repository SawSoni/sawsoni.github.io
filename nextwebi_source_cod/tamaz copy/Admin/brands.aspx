﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="brands.aspx.cs" Inherits="Admin_brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add New Brand</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active in" id="home">
                <div id="tab">
                    <label>
                        Brand Name</label>
                    <asp:TextBox ID="txt_category" runat="server" class="input-xlarge"></asp:TextBox>
                    <br />
                    <label>
                        Brand Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <%=img %>
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
            <div class="btn-toolbar">
                <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Save" OnClick="btn_submit_Click" />
                <br />
                <br />
            </div>
        </div>
        <ul class="breadcrumb">
            <li class="active">Brands</li>
        </ul>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateDeleteButton="true" DataKeyNames="id,brand_name" AutoGenerateEditButton="true" PageSize="50" AutoGenerateColumns="False" CellPadding="10"
            CellSpacing="2" ForeColor="#333333"
            GridLines="None" AllowSorting="True" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="brand_guid" Visible="false" HeaderText="brand_guid" SortExpression="brand_guid" />
                <asp:BoundField DataField="brand_name" HeaderText="Brand Name"
                    SortExpression="brand_name" ReadOnly="true" />
                <asp:BoundField DataField="order_id" HeaderText="Order Id"
                    SortExpression="order_id" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img style="height: 100px" alt="<%# Eval("brand_name") %>" src="../<%# Eval("img_path") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Edit Image">
                    <ItemTemplate>
                        <a href="brands.aspx?id=<%# Eval("id") %>">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EdilystCommerceConnectionString %>" UpdateCommand="update brands set order_id=@order_id where id=@id " DeleteCommand="Delete from brands where id=@id " SelectCommand="SELECT * FROM [brands]">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="order_id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
