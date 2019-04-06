<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="View_Enquiry.aspx.cs" Inherits="Admin_View_Enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <ul class="breadcrumb">
        
            <li class="active">View Enquiry</li>
        </ul>
        <div class="well">
    
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <div id="tab">
     
        

        
        

    </div>
      </div>
  
  </div>
            

  <div style="overflow:auto; padding:20px;">
  
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="8" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" 
                AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="order_id" HeaderText="Order ID" 
                        SortExpression="order_id" Visible="false" />
                        <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                        <a href='<%# "OrderDetails.aspx?id=" + Eval("order_id") %>'><%#Eval("order_id")%></a>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Buyer" 
                        SortExpression="name" />
                    <asp:BoundField DataField="buyer_id" HeaderText="Email" 
                        SortExpression="buyer_id" />
                    <asp:BoundField DataField="buyer_mobile" HeaderText="Mobile" 
                        SortExpression="buyer_mobile" />
                    <asp:BoundField DataField="order_price" HeaderText="Price" 
                        SortExpression="order_price" />
                    <asp:BoundField DataField="order_status" HeaderText="order_status" 
                        SortExpression="order_status" Visible="False" />
                    <asp:BoundField DataField="payment_mode" HeaderText="payment_mode" 
                        SortExpression="payment_mode" Visible="False" />
                    <asp:BoundField DataField="otp" HeaderText="otp" 
                        SortExpression="otp" Visible="False" />
                    <asp:BoundField DataField="verified_mobile" HeaderText="verified_mobile" 
                        SortExpression="verified_mobile" Visible="False" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                        Visible="False" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="other1" HeaderText="other1" SortExpression="other1" 
                        Visible="False" />
                    <asp:BoundField DataField="other2" HeaderText="other2" SortExpression="other2" 
                        Visible="False" />
                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                    <asp:BoundField DataField="pincode" HeaderText="Pincode" 
                        SortExpression="pincode" />
                    <asp:BoundField DataField="address" HeaderText="Address" 
                        SortExpression="address" />
                    <asp:BoundField DataField="landmark" HeaderText="Landmark" 
                        SortExpression="landmark" />
                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                    <asp:BoundField DataField="country" HeaderText="Country" 
                        SortExpression="country" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 </asp:GridView>

  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:con2 %>" 
                DeleteCommand="DELETE FROM [orders] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [orders] ([order_id], [buyer_id], [buyer_mobile], [order_price], [order_status], [payment_mode], [otp], [verified_mobile], [other1], [other2]) VALUES (@order_id, @buyer_id, @buyer_mobile, @order_price, @order_status, @payment_mode, @otp, @verified_mobile, @other1, @other2)" 
                SelectCommand="SELECT distinct o.[order_id], b.[name], o.[buyer_id], o.[buyer_mobile], o.[order_price], o.[order_status], o.[payment_mode], o.[otp], o.[verified_mobile], o.[id], o.[other1], o.[other2]
     ,b.[city]
      ,b.[pincode]
      ,b.[address]
      ,b.[landmark]
      ,b.[state]
      ,b.[country] FROM [orders] o  inner join buyers b on b.buyer_id=o.buyer_id ORDER BY o.[id] DESC" 
                
                
                UpdateCommand="UPDATE [orders] SET [order_id] = @order_id, [buyer_id] = @buyer_id, [buyer_mobile] = @buyer_mobile, [order_price] = @order_price, [order_status] = @order_status, [payment_mode] = @payment_mode, [otp] = @otp, [verified_mobile] = @verified_mobile, [other1] = @other1, [other2] = @other2 WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="order_id" Type="String" />
                    <asp:Parameter Name="buyer_id" Type="String" />
                    <asp:Parameter Name="buyer_mobile" Type="String" />
                    <asp:Parameter Name="order_price" Type="String" />
                    <asp:Parameter Name="order_status" Type="String" />
                    <asp:Parameter Name="payment_mode" Type="String" />
                    <asp:Parameter Name="otp" Type="String" />
                    <asp:Parameter Name="verified_mobile" Type="String" />
                    <asp:Parameter Name="other1" Type="String" />
                    <asp:Parameter Name="other2" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="order_id" Type="String" />
                    <asp:Parameter Name="buyer_id" Type="String" />
                    <asp:Parameter Name="buyer_mobile" Type="String" />
                    <asp:Parameter Name="order_price" Type="String" />
                    <asp:Parameter Name="order_status" Type="String" />
                    <asp:Parameter Name="payment_mode" Type="String" />
                    <asp:Parameter Name="otp" Type="String" />
                    <asp:Parameter Name="verified_mobile" Type="String" />
                    <asp:Parameter Name="other1" Type="String" />
                    <asp:Parameter Name="other2" Type="String" />
                    <asp:Parameter Name="id" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
  </div>

  
</div>




</asp:Content>

