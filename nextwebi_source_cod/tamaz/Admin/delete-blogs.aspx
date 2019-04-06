<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="delete-blogs.aspx.cs" Inherits="Admin_delete_blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="Title" 
                SortExpression="title" />
            <asp:BoundField DataField="datetime" HeaderText="Date" 
                SortExpression="datetime" />
            <asp:BoundField DataField="postedby" HeaderText="Posted By" 
                SortExpression="postedby" />
           <%-- <asp:BoundField DataField="cont" HeaderText="Content" SortExpression="cont" />--%>
            <asp:BoundField DataField="other" HeaderText="other" SortExpression="other" 
                Visible="False" />
            <asp:BoundField DataField="other1" HeaderText="other1" SortExpression="other1" 
                Visible="False" />
            <asp:BoundField DataField="other2" HeaderText="Page Title" 
                SortExpression="other2" />
            <asp:BoundField DataField="other3" HeaderText="Keyword" 
                SortExpression="other3" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
        <h1><br /><br />No data found</h1>
        </EmptyDataTemplate>
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
        ConnectionString="<%$ ConnectionStrings:con2 %>" 
        DeleteCommand="DELETE FROM [blogs] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [blogs] ([title], [datetime], [postedby], [cont], [other], [other1], [other2], [other3]) VALUES (@title, @datetime, @postedby, @cont, @other, @other1, @other2, @other3)" 
        SelectCommand="SELECT [id], [title], [datetime], [postedby], [cont], [other], [other1], [other2], [other3] FROM [blogs] ORDER BY [id] DESC" 
        
        UpdateCommand="UPDATE [blogs] SET [title] = @title, [datetime] = @datetime, [postedby] = @postedby, [cont] = @cont, [other] = @other, [other1] = @other1, [other2] = @other2, [other3] = @other3 WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="datetime" Type="String" />
            <asp:Parameter Name="postedby" Type="String" />
            <asp:Parameter Name="cont" Type="String" />
            <asp:Parameter Name="other" Type="String" />
            <asp:Parameter Name="other1" Type="String" />
            <asp:Parameter Name="other2" Type="String" />
            <asp:Parameter Name="other3" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="datetime" Type="String" />
            <asp:Parameter Name="postedby" Type="String" />
            <asp:Parameter Name="cont" Type="String" />
            <asp:Parameter Name="other" Type="String" />
            <asp:Parameter Name="other1" Type="String" />
            <asp:Parameter Name="other2" Type="String" />
            <asp:Parameter Name="other3" Type="String" />
            <asp:Parameter Name="id" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

