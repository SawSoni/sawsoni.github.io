<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="CategorySeo.aspx.cs" Inherits="Admin_CategorySeo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add SEO Description</li>
    </ul>
    <div class="well">
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="category" 
            DataValueField="category" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:con2 %>" 
            SelectCommand="SELECT DISTINCT [category] FROM [category]">
        </asp:SqlDataSource>
        <br />
        <label>Page Title</label>
        <asp:TextBox ID="txt_title" class="input-xlarge" PlaceHolder="Page Title" runat="server"></asp:TextBox>
        <label>Meta Keyword</label>
        <asp:TextBox ID="txt_keyword" class="input-xlarge" PlaceHolder="Meta Keywords" runat="server"></asp:TextBox>
        <label>Meta Description</label>
        <asp:TextBox ID="txt_desc" class="input-xlarge" PlaceHolder="Meta Description" runat="server"></asp:TextBox><br />
        <label>Category Description</label>
        <cc1:Editor ID="txt_full_desc" runat="server" Height="400" Width="600" />
               <br /><br />
        <asp:Label ID="lbl_success" runat="server" ></asp:Label><br />
        <asp:Button ID="btn_save" CssClass="btn btn-primary" runat="server" Text="Save" 
            onclick="btn_save_Click" />
            <br />
            <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="category_name" HeaderText="Category" 
                    SortExpression="category_name" />
                <asp:BoundField DataField="title" HeaderText="Page Title" 
                    SortExpression="title" />
                <asp:BoundField DataField="meta_keyword" HeaderText="Meta Keyword" 
                    SortExpression="meta_keyword" />
                <asp:BoundField DataField="meta_desc" HeaderText="Meta Description" 
                    SortExpression="meta_desc" />
                    <asp:BoundField DataField="other" HeaderText="Category Description" 
                    SortExpression="other" Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:con2 %>" 
            DeleteCommand="DELETE FROM [category_seo] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [category_seo] ([category_name], [title], [meta_keyword], [meta_desc],[other]) VALUES (@category_name, @title, @meta_keyword, @meta_desc,@other)" 
            SelectCommand="SELECT [category_name], [title], [meta_keyword], [meta_desc], [id],[other] FROM [category_seo] WHERE ([category_name] = @category_name) ORDER BY [id]" 
            UpdateCommand="UPDATE [category_seo] SET [category_name] = @category_name, [title] = @title, [meta_keyword] = @meta_keyword, [meta_desc] = @meta_desc,[other]=@other WHERE [category_name] = @category_name">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="category_name" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="meta_keyword" Type="String" />
                <asp:Parameter Name="meta_desc" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="category_name" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="category_name" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="meta_keyword" Type="String" />
                <asp:Parameter Name="meta_desc" Type="String" />
                <asp:Parameter Name="id" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

