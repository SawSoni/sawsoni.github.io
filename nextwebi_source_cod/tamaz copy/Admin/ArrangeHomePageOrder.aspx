<%@ Page Title="Arrange Product Order" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="ArrangeHomePageOrder.aspx.cs" Inherits="Admin_ArrangeHomePageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul class="breadcrumb">
        
            <li class="active">Arrange Product Order</li>
        </ul>
        <div class="well">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="product_name" HeaderText="product_name" 
                        SortExpression="product_name" />
                    <asp:BoundField DataField="orderby" HeaderText="orderby" 
                        SortExpression="orderby" />
                    <asp:BoundField DataField="home_display_order" HeaderText="home_display_order" 
                        SortExpression="home_display_order" />
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
                DeleteCommand="DELETE FROM [product_details] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [product_details] ([product_name], [orderby], [home_display_order]) VALUES (@product_name, @orderby, @home_display_order)" 
                SelectCommand="SELECT [id], [product_name], [orderby], [home_display_order] FROM [product_details] ORDER BY [product_name]" 
                UpdateCommand="UPDATE [product_details] SET [product_name] = @product_name, [orderby] = @orderby, [home_display_order] = @home_display_order WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="orderby" Type="String" />
                    <asp:Parameter Name="home_display_order" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="orderby" Type="String" />
                    <asp:Parameter Name="home_display_order" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>

