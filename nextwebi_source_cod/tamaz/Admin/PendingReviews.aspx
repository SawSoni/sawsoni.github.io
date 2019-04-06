<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="PendingReviews.aspx.cs" Inherits="Admin_PendingReviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Reviews</li>
    </ul>
    <div class="well">
    <table style="width:100%;">
        <tr>
            <td width="252">
                <%--Select Review Status--%></td>
            <td width="252">
                <asp:DropDownList ID="ddl_reviews_status" runat="server" AutoPostBack="True" Visible="false"
                    DataSourceID="SqlDataSource1" DataTextField="status" DataValueField="status">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:con2 %>" 
                    SelectCommand="SELECT DISTINCT [status] FROM [reviews]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                    DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"  Visible="false"
                            ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                            <a href='<%# "ApproveReview.aspx?id=" + Eval("id") %>'>ID</a>
                            </ItemTemplate>
                            </asp:TemplateField>

                        <asp:BoundField DataField="product_name" HeaderText="Product" 
                            SortExpression="product_name" />
                        <asp:BoundField DataField="username" HeaderText="User" 
                            SortExpression="username" />
                        <asp:BoundField DataField="your_review" HeaderText="your_review" 
                            SortExpression="your_review" Visible="False" />
                        <asp:BoundField DataField="posted_date" HeaderText="Date" 
                            SortExpression="posted_date" />
                        <asp:BoundField DataField="rating" HeaderText="Rating" 
                            SortExpression="rating" />
                        <asp:BoundField DataField="status" HeaderText="Status" 
                            SortExpression="status" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:con2 %>" 
                    DeleteCommand="DELETE FROM [reviews] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [reviews] ([product_name], [username], [your_review], [posted_date], [rating], [status]) VALUES (@product_name, @username, @your_review, @posted_date, @rating, @status)" 
                    SelectCommand="SELECT [id], [product_name], [username], [your_review], [posted_date], [rating], [status] FROM [reviews] WHERE ([status] = @status) ORDER BY [id] DESC" 
                    
                    UpdateCommand="UPDATE [reviews] SET [product_name] = @product_name, [username] = @username, [your_review] = @your_review, [posted_date] = @posted_date, [rating] = @rating, [status] = @status WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="product_name" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="your_review" Type="String" />
                        <asp:Parameter Name="posted_date" Type="String" />
                        <asp:Parameter Name="rating" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="status" QueryStringField="status" 
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="product_name" Type="String" />
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="your_review" Type="String" />
                        <asp:Parameter Name="posted_date" Type="String" />
                        <asp:Parameter Name="rating" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                        <asp:Parameter Name="id" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table></div>
</asp:Content>

