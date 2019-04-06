<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AddCurrency.aspx.cs" Inherits="Admin_AddCurrency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add Currency</li>
    </ul>
    <div class="well">
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
    <label>Currency</label>
        <asp:TextBox ID="txt_currency" placeholder="Currency" runat="server"></asp:TextBox>
        <label>Value</label>
        <asp:TextBox ID="txt_value" placeholder="Value" runat="server"></asp:TextBox><br />
        <asp:Button ID="btn_currency" CssClass="btn btn-primary" runat="server" 
            Text="Add Currency" onclick="btn_currency_Click" />
            <br />
            <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" PageSize="100">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="currency" HeaderText="Currency" 
                    SortExpression="currency" />
                <asp:BoundField DataField="currency_value" HeaderText="Value" 
                    SortExpression="currency_value" />
                <asp:BoundField DataField="date_time" HeaderText="Updated On" 
                    SortExpression="date_time" Visible="False" />
                <asp:BoundField DataField="updated_by" HeaderText="Updated By" 
                    SortExpression="updated_by" Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="12px" 
                ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" Font-Size="12px" ForeColor="#333333" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EdilystCommerceConnectionString %>" 
            DeleteCommand="DELETE FROM [currency] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [currency] ([currency], [currency_value], [date_time], [updated_by]) VALUES (@currency, @currency_value, @date_time, @updated_by)" 
            SelectCommand="SELECT [currency], [id], [currency_value], [date_time], [updated_by] FROM [currency] ORDER BY [currency]" 
            UpdateCommand="UPDATE [currency] SET [currency] = @currency, [currency_value] = @currency_value, [date_time] = @date_time, [updated_by] = @updated_by WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="currency" Type="String" />
                <asp:Parameter Name="currency_value" Type="String" />
                <asp:Parameter Name="date_time" Type="String" />
                <asp:Parameter Name="updated_by" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="currency" Type="String" />
                <asp:Parameter Name="currency_value" Type="String" />
                <asp:Parameter Name="date_time" Type="String" />
                <asp:Parameter Name="updated_by" Type="String" />
                <asp:Parameter Name="id" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

