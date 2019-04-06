<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true"
    CodeFile="add_new_category.aspx.cs" Inherits="Admin_add_new_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add New Blog Category</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active in" id="home">
                <div id="tab">
                    <label>
                        Category Name</label>
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
        <ul class="breadcrumb">
            <li class="active">Category List (Note: Display Order should be numeric only)</li>
        </ul>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10"
            CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" AllowSorting="True" EnableModelValidation="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" Visible="False" />
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="other" HeaderText="Display Order" 
                    SortExpression="other" />
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
            
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con2 %>"
            DeleteCommand="DELETE FROM [category] WHERE [id] = @id" InsertCommand="INSERT INTO [category] ([category], [other]) VALUES (@category, @other)"
            SelectCommand="SELECT * FROM [category]" 
            UpdateCommand="UPDATE [category] SET [category] = @category, [other] = @other WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="other" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="other" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
