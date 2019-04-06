<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="ViewProductDetails.aspx.cs" Inherits="Admin_ViewProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">View Product Details</li>
    </ul>
    <div class="well">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            PageSize="100">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="category" HeaderText="category" 
                    SortExpression="category" />
                     <asp:BoundField DataField="sub_category" HeaderText="Sub Category" 
                    SortExpression="sub_category" />
                <asp:BoundField DataField="product_id" HeaderText="product_id" 
                    SortExpression="product_id" />
                <asp:BoundField DataField="product_name" HeaderText="product_name" 
                    SortExpression="product_name" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" Visible="false" />
                <asp:BoundField DataField="discount_price" HeaderText="discount_price" Visible="false" 
                    SortExpression="discount_price" />
                <asp:BoundField DataField="final_price" HeaderText="final_price" 
                    SortExpression="final_price" />
                <asp:BoundField DataField="sort_desc" HeaderText="sort_desc"  Visible="false"
                    SortExpression="sort_desc" />
                <asp:BoundField DataField="full_desc" HeaderText="full_desc"  Visible="false"
                    SortExpression="full_desc" />
                <asp:BoundField DataField="small_image" HeaderText="small_image"  Visible="false"
                    SortExpression="small_image" />
                <asp:BoundField DataField="big_image" HeaderText="big_image"  Visible="false"
                    SortExpression="big_image" />
                <asp:BoundField DataField="isfeatured" HeaderText="isfeatured" 
                    SortExpression="isfeatured" />
                <asp:BoundField DataField="page_title" HeaderText="page_title"  Visible="false"
                    SortExpression="page_title" />
                <asp:BoundField DataField="meta_keyword" HeaderText="meta_keyword"  Visible="false"
                    SortExpression="meta_keyword" />
                <asp:BoundField DataField="meta_desc" HeaderText="meta_desc" Visible="false"
                    SortExpression="meta_desc" />
                <asp:BoundField DataField="other" HeaderText="other" SortExpression="other"  Visible="false" />
                <asp:BoundField DataField="datetime" HeaderText="datetime" 
                    SortExpression="datetime" />
                <asp:BoundField DataField="hotselling" HeaderText="hotselling" 
                    SortExpression="hotselling" />
                <asp:BoundField DataField="home_display_order" HeaderText="Display Order" 
                    SortExpression="home_display_order" />
                <asp:BoundField DataField="product_rating" HeaderText="Rating" 
                    SortExpression="product_rating" />
               
                <asp:BoundField DataField="product_idval" HeaderText="product_idval"  Visible="false"
                    SortExpression="product_idval" />
                <asp:BoundField DataField="supplier_guid" HeaderText="supplier_guid" 
                    SortExpression="supplier_guid" />
                <asp:BoundField DataField="premium" HeaderText="premium" Visible="false"
                    SortExpression="premium" />
                <asp:BoundField DataField="row_val" HeaderText="row_val" Visible="false" 
                    SortExpression="row_val" />
                <asp:BoundField DataField="col_val" HeaderText="col_val" Visible="false" 
                    SortExpression="col_val" />
                <asp:BoundField DataField="other3" HeaderText="other3" Visible="false"
                    SortExpression="other3" />
                <asp:BoundField DataField="other2" HeaderText="other2" Visible="false" 
                    SortExpression="other2" />
                <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock"  Visible="false" />
                <asp:BoundField DataField="orderby" HeaderText="orderby" 
                    SortExpression="orderby" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                Font-Size="12px" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="12px" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EdilystCommerceConnectionString %>" 
            SelectCommand="SELECT * FROM [product_details] ORDER BY [id] DESC">
        </asp:SqlDataSource>
    </div>
</asp:Content>

