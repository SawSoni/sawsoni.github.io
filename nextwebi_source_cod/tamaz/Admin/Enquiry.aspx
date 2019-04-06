<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="Enquiry.aspx.cs" Inherits="Admin_Enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="breadcrumb">
        <li class="active">My Enquiry</li>
    </ul>
    <div class="well">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            PageSize="50">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="mobile" HeaderText="Mobile" 
                    SortExpression="mobile" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="type" HeaderText="Enquiry Type" 
                    SortExpression="type" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" 
                    Visible="False" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" 
                    Visible="False" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" Visible="False" />
                <asp:BoundField DataField="message" HeaderText="Message" 
                    SortExpression="message" />
                <asp:BoundField DataField="product" HeaderText="Product" 
                    SortExpression="product" />
                <asp:BoundField DataField="posted_on" HeaderText="Posted On" 
                    SortExpression="posted_on" />
                <asp:BoundField DataField="website" HeaderText="On" SortExpression="website" />
                <asp:BoundField DataField="global_pin" HeaderText="global_pin" 
                    SortExpression="global_pin" Visible="False" />
                <asp:BoundField DataField="local_pin" HeaderText="local_pin" 
                    SortExpression="local_pin" Visible="False" />
                <asp:BoundField DataField="ip_address" HeaderText="IP Address" 
                    SortExpression="ip_address" />
                <asp:BoundField DataField="other" HeaderText="other" SortExpression="other" 
                    Visible="False" />
                <asp:BoundField DataField="other1" HeaderText="Status" 
                    SortExpression="other1" />
                <asp:BoundField DataField="other2" HeaderText="other2" SortExpression="other2" 
                    Visible="False" />
                <asp:BoundField DataField="other3" HeaderText="other3" SortExpression="other3" 
                    Visible="False" />
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
            DeleteCommand="DELETE FROM [contact_us] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [contact_us] ([type], [name], [mobile], [email], [city], [state], [country], [message], [product], [posted_on], [website], [global_pin], [local_pin], [ip_address], [other], [other1], [other2], [other3]) VALUES (@type, @name, @mobile, @email, @city, @state, @country, @message, @product, @posted_on, @website, @global_pin, @local_pin, @ip_address, @other, @other1, @other2, @other3)" 
            SelectCommand="SELECT * FROM [contact_us] ORDER BY [id] DESC" 
            UpdateCommand="UPDATE [contact_us] SET [type] = @type, [name] = @name, [mobile] = @mobile, [email] = @email, [city] = @city, [state] = @state, [country] = @country, [message] = @message, [product] = @product, [posted_on] = @posted_on, [website] = @website, [global_pin] = @global_pin, [local_pin] = @local_pin, [ip_address] = @ip_address, [other] = @other, [other1] = @other1, [other2] = @other2, [other3] = @other3 WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="message" Type="String" />
                <asp:Parameter Name="product" Type="String" />
                <asp:Parameter Name="posted_on" Type="String" />
                <asp:Parameter Name="website" Type="String" />
                <asp:Parameter Name="global_pin" Type="String" />
                <asp:Parameter Name="local_pin" Type="String" />
                <asp:Parameter Name="ip_address" Type="String" />
                <asp:Parameter Name="other" Type="String" />
                <asp:Parameter Name="other1" Type="String" />
                <asp:Parameter Name="other2" Type="String" />
                <asp:Parameter Name="other3" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="message" Type="String" />
                <asp:Parameter Name="product" Type="String" />
                <asp:Parameter Name="posted_on" Type="String" />
                <asp:Parameter Name="website" Type="String" />
                <asp:Parameter Name="global_pin" Type="String" />
                <asp:Parameter Name="local_pin" Type="String" />
                <asp:Parameter Name="ip_address" Type="String" />
                <asp:Parameter Name="other" Type="String" />
                <asp:Parameter Name="other1" Type="String" />
                <asp:Parameter Name="other2" Type="String" />
                <asp:Parameter Name="other3" Type="String" />
                <asp:Parameter Name="id" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </div>
</asp:Content>

