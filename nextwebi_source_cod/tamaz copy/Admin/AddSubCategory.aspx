<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="Admin_AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add Sub Category</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active in" id="home">
                <div id="tab">
                <label>Select Category</label>
                    <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True">
                    </asp:DropDownList><br />
                    <label>
                       Sub Category Name</label>
                    <asp:TextBox ID="txt_category" runat="server" class="input-xlarge"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
            <div class="btn-toolbar">
                <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Save" OnClick="btn_submit_Click" />
                <br />
                <br />
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" EmptyDataText="No item">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="sub_category" HeaderText="sub_category" 
                    SortExpression="sub_category" />
                     <asp:BoundField DataField="other" HeaderText="Page Title" SortExpression="other" />
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
            ConnectionString="<%$ ConnectionStrings:EdilystCommerceConnectionString %>" 
            DeleteCommand="DELETE FROM [sub_category] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [sub_category] ([sub_category], [other]) VALUES (@sub_category, @other)" 
            SelectCommand="SELECT [id], [sub_category], [other] FROM [sub_category] WHERE ([category_id] = @category_id)" 
            UpdateCommand="UPDATE [sub_category] SET [sub_category] = @sub_category, [other] = @other WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sub_category" Type="String" />
                <asp:Parameter Name="other" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_category" Name="category_id" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="sub_category" Type="String" />
                <asp:Parameter Name="other" Type="String" />
                <asp:Parameter Name="id" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>

