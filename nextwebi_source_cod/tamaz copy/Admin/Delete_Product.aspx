<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="Delete_Product.aspx.cs" Inherits="Admin_Delete_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <ul class="breadcrumb">
        
            <li class="active">Delete a Product</li>
        </ul>
        <div class="well">
    
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <div id="tab">
        <label>Select Product Category</label>
        <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True">
        </asp:DropDownList>

        
        

        <br />

        
        

    </div>
      </div>
  
  </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="8" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                        <a href='<%# "SupplierDetails.aspx?id=" + Eval("supplier_guid") %>'><%#Eval("product_name") %></a>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="category" HeaderText="Category" 
                        SortExpression="category" />
                    <asp:BoundField DataField="product_id" HeaderText="Product ID" 
                        SortExpression="product_id" />
                    <asp:BoundField DataField="product_name" HeaderText="Product Name" Visible="false" 
                        SortExpression="product_name" />
                        
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                    <asp:BoundField DataField="discount_price" HeaderText="Discount Price" 
                        SortExpression="discount_price" />
                    <asp:BoundField DataField="final_price" HeaderText="Final Price" 
                        SortExpression="final_price" />
                    <asp:BoundField DataField="isfeatured" HeaderText="Is Featured" 
                        SortExpression="isfeatured" />
                    <asp:BoundField DataField="datetime" HeaderText="Added Date" 
                        SortExpression="datetime" />
                        
                <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                    Font-Size="12px" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="12px" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <EmptyDataTemplate>Product Not Found For the Selected Category</EmptyDataTemplate>
            </asp:GridView>

  
            
  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:con2 %>" 
                DeleteCommand="DELETE FROM [product_details] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [product_details] ([category], [product_id], [product_name], [price], [discount_price], [final_price], [isfeatured], [datetime]) VALUES (@category, @product_id, @product_name, @price, @discount_price, @final_price, @isfeatured, @datetime)" 
                SelectCommand="SELECT [id], [category], [product_id], [product_name], [price], [discount_price], [final_price], [isfeatured], [datetime],[supplier_guid] FROM [product_details] WHERE ([category] = @category)" 
                UpdateCommand="UPDATE [product_details] SET [category] = @category, [product_id] = @product_id, [product_name] = @product_name, [price] = @price, [discount_price] = @discount_price, [final_price] = @final_price, [isfeatured] = @isfeatured, [datetime] = @datetime WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="product_id" Type="String" />
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="discount_price" Type="String" />
                    <asp:Parameter Name="final_price" Type="String" />
                    <asp:Parameter Name="isfeatured" Type="String" />
                    <asp:Parameter Name="datetime" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_category" Name="category" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="product_id" Type="String" />
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="discount_price" Type="String" />
                    <asp:Parameter Name="final_price" Type="String" />
                    <asp:Parameter Name="isfeatured" Type="String" />
                    <asp:Parameter Name="datetime" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

  
</div>



</asp:Content>

