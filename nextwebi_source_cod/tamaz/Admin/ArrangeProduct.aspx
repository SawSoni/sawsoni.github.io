<%@ Page Title="Arrange Product Order" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="ArrangeProduct.aspx.cs" Inherits="Admin_ArrangeProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul class="breadcrumb">
        
            <li class="active">Arrange Product Order</li>
        </ul>
        <div class="well">
         <label>Select Product Category</label>
        <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_category_SelectedIndexChanged" 
                DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category" 
            ></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:con2 %>" 
                SelectCommand="SELECT DISTINCT [category] FROM [product_details] ORDER BY [category]">
            </asp:SqlDataSource>
            <br />
        <asp:Label ID="lbl_product" Text="Select Product" runat="server" ></asp:Label><br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
            >
        </asp:DropDownList>
        <br />
        <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField  ShowEditButton="True" />
                    <asp:BoundField DataField="product_id" HeaderText="ID" 
                        SortExpression="product_id" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" Visible="False" />
                    <asp:BoundField DataField="product_name" HeaderText="Product Name" 
                        SortExpression="product_name" />
                    <asp:BoundField DataField="final_price" HeaderText="Price" 
                        SortExpression="final_price" />
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                    <asp:BoundField DataField="other3" HeaderText="Display Order" 
                        SortExpression="other3" />
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:Button ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
OnClientClick="return confirm('Are you sure you want to delete this Entry?');" />
                    </ItemTemplate>
                    </asp:TemplateField>
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
                InsertCommand="INSERT INTO [product_details] ([category], [product_id], [product_name], [final_price], [other3]) VALUES (@category, @product_id, @product_name, @final_price, @other3)" 
                SelectCommand="SELECT [category], [id], [product_id], [product_name], [final_price], [other3] FROM [product_details] WHERE ([category] = @category) ORDER BY [product_name]" 
                UpdateCommand="UPDATE [product_details] SET [category] = @category, [product_id] = @product_id, [product_name] = @product_name, [final_price] = @final_price, [other3] = @other3 WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="product_id" Type="String" />
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="final_price" Type="String" />
                    <asp:Parameter Name="other3" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_category" Name="category" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="product_id" Type="String" />
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="final_price" Type="String" />
                    <asp:Parameter Name="other3" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>

