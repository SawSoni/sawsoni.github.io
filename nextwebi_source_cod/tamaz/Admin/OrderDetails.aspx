<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="Admin_OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
table,tr,td
{
    border:1px solid #ccc;
}
td
{
    padding:5px 10px 5px 15px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="breadcrumb">
        
            <li class="active">Order Details - <%=Convert.ToString(Request.QueryString["id"]) %></li>
        </ul>
        <div class="well">
            <div style="width:100%">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                ForeColor="#333333" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="12px" 
                    ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" Font-Size="12px" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <Columns>
                <asp:BoundField DataField="small_image" HeaderText="Product" 
                        SortExpression="small_image" Visible="false" />
                        <asp:TemplateField>
                        <ItemTemplate>
                        <img src='../<%#Eval("small_image") %>' />
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                        <a href='../Product/<%#Eval("product_name") %>' target="_blank"><%#Eval("product_name") %></a>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="product_name" HeaderText="Name" 
                        SortExpression="product_name" Visible="false" />
                        <asp:BoundField DataField="item_count" HeaderText="Quantity" 
                        SortExpression="item_count" />
                        <asp:BoundField DataField="total_price" HeaderText="Amount" 
                        SortExpression="total_price" />
                        <asp:TemplateField HeaderText="Supplier">
                        <ItemTemplate>
                        <a href='SupplierDetails.aspx?id=<%#Eval("supplier_guid") %>' target="_blank"><%#Eval("supplier_company")%></a>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <div style="width:40%; padding-top:20px;">
            <div style="border-bottom:2px solid #ccc;">Customer Details</div><br />
            <table border="1px solid #ccc">
            <tr>
            <td class="td1">Customer Name</td>
            
            <td class="td3"><span id="sp_name" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Email</td>
            
            <td  class="td3"><span id="sp_email" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Mobile</td>
            
            <td  class="td3"><span id="sp_mobile" style="margin-right:15px;" runat="server"></span><span id="sp_ver" style="font-weight:bold; color:Green; " runat="server"></span><span id="sp_nver" style="font-weight:bold; color:Red" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Address</td>
            
            <td  class="td3"><span id="sp_address" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Landmark</td>
            
            <td  class="td3"><span id="sp_landmark" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">City</td>
            
            <td  class="td3"><span id="sp_city" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Pincode</td>
            
            <td  class="td3"><span id="sp_pincode" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">State</td>
            
            <td  class="td3"><span id="sp_state" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Country</td>
            
            <td  class="td3"><span id="sp_country" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Ordered On</td>
            
            <td  class="td3"><span id="sp_orderedon" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Payment Mode</td>
            
            <td  class="td3"><span id="sp_pm" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Ordered Status</td>
            
            <td  class="td3"><span id="sp_os" runat="server"></span></td>
            </tr>
            <tr>
            <td  class="td1">Total Amount</td>
            
            <td  class="td3"><span id="sp_ta" runat="server"></span></td>
            </tr>
            
            </table>
            </div>
            
        </div>
</asp:Content>

