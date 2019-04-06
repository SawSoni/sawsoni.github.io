<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AddTags.aspx.cs" Inherits="Admin_AddTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add Tags</li>
    </ul>
    <div class="well">
        <asp:Label ID="lbl_success" runat="server"></asp:Label><br />
    <label>Tags</label>
        <asp:TextBox ID="txt_tags" PlaceHolder="Tags" runat="server"></asp:TextBox><br />
        <asp:Button ID="btn_tags" CssClass="btn btn-primary" runat="server" 
            Text="Add Tags" onclick="btn_tags_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            PageSize="50">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="tags" HeaderText="tags" SortExpression="tags" />
                <asp:BoundField DataField="added_by" HeaderText="added_by" 
                    SortExpression="added_by" />
                <asp:BoundField DataField="added_on" HeaderText="added_on" 
                    SortExpression="added_on" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EdilystCommerceConnectionString %>" 
            DeleteCommand="DELETE FROM [tags] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [tags] ([tags], [added_by], [added_on]) VALUES (@tags, @added_by, @added_on)" 
            SelectCommand="SELECT [id], [tags], [added_by], [added_on] FROM [tags] ORDER BY [id] DESC" 
            UpdateCommand="UPDATE [tags] SET [tags] = @tags, [added_by] = @added_by, [added_on] = @added_on WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tags" Type="String" />
                <asp:Parameter Name="added_by" Type="String" />
                <asp:Parameter Name="added_on" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tags" Type="String" />
                <asp:Parameter Name="added_by" Type="String" />
                <asp:Parameter Name="added_on" Type="String" />
                <asp:Parameter Name="id" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

