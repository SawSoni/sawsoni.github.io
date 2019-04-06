<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="RegisteredCustomers.aspx.cs" Inherits="Admin_RegisteredCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="breadcrumb">
        <li class="active">Registered Customers</li>
    </ul>
    <div class="well" >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource1" 
    ForeColor="#333333" Font-Size="12px" Width="1500px" style=" max-width:1500px;">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Reg ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="customer_name" HeaderText="Customer Name" 
                SortExpression="customer_name" />
            <asp:BoundField DataField="mobile" HeaderText="Mobile" 
                SortExpression="mobile" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="city" HeaderText="City" 
                SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="landmark" HeaderText="Landmark" 
                SortExpression="landmark" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
            <asp:BoundField DataField="country" HeaderText="Country" 
                SortExpression="country" Visible="False" />
            <asp:BoundField DataField="password" HeaderText="Password" 
                SortExpression="password" Visible="False" />
            <asp:CommandField ShowDeleteButton="True" />
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
    ConnectionString="<%$ ConnectionStrings:con2 %>" 
    
    SelectCommand="SELECT [id], [customer_name], [password], [email], [mobile], [address], [landmark], [city], [state], [country] FROM [customer_detail] ORDER BY [id] DESC" 
    DeleteCommand="DELETE FROM [customer_detail] WHERE [id] = @id" 
    InsertCommand="INSERT INTO [customer_detail] ([customer_name], [password], [email], [mobile], [address], [landmark], [city], [state], [country]) VALUES (@customer_name, @password, @email, @mobile, @address, @landmark, @city, @state, @country)" 
    UpdateCommand="UPDATE [customer_detail] SET [customer_name] = @customer_name, [password] = @password, [email] = @email, [mobile] = @mobile, [address] = @address, [landmark] = @landmark, [city] = @city, [state] = @state, [country] = @country WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="customer_name" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="mobile" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="landmark" Type="String" />
        <asp:Parameter Name="city" Type="String" />
        <asp:Parameter Name="state" Type="String" />
        <asp:Parameter Name="country" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="customer_name" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="mobile" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="landmark" Type="String" />
        <asp:Parameter Name="city" Type="String" />
        <asp:Parameter Name="state" Type="String" />
        <asp:Parameter Name="country" Type="String" />
        <asp:Parameter Name="id" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource></div>
</asp:Content>

