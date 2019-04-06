<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true"
    EnableEventValidation="true" CodeFile="add_new_product.aspx.cs" Inherits="Admin_add_new_product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Add New Product</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active in" id="home">
                <asp:Label ID="lbl_success" runat="server" Style="font-weight: bold; font-size: 18px;"></asp:Label>
                <div id="tab">
                    <label>
                        Select Product Category</label>
                    <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged">
                    </asp:DropDownList>
                    <label>
                        Select Product Sub Category</label>
                    <asp:DropDownList ID="ddl_subcategory" runat="server" Visible="False">
                    </asp:DropDownList>
                   <%-- <label>
                        Select Supplier</label>
                    <asp:DropDownList ID="ddl_supplier" runat="server" Visible="False">
                    </asp:DropDownList>--%>
                    <label>
                        Product Name</label>
                    <asp:TextBox ID="txt_productname" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Product Code</label>
                    <asp:TextBox ID="txt_productid" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Price</label>
                    <asp:TextBox ID="txt_price" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Place of origin</label>
                    <asp:TextBox ID="txt_origin" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Brand name</label>
                    <asp:TextBox ID="txt_brandname" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Key Ingrediants</label>
                    <asp:TextBox ID="txt_Ingrediants" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Model no</label>
                    <asp:TextBox ID="txt_model" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Min Order</label>
                    <asp:TextBox ID="txt_min_order" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Packaging Details</label>
                    <asp:TextBox ID="txt_packaging" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Delivery Time</label>
                    <asp:TextBox ID="txt_deliveyTime" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Payment Terms</label>
                    <asp:TextBox ID="txt_paymentterms" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Page Title</label>
                    <asp:TextBox ID="txt_meta_title" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Meta Keyword</label>
                    <asp:TextBox ID="txt_meta_key" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Meta Description</label>
                    <asp:TextBox ID="txt_meta_desc" runat="server" class="input-xlarge" Width="500px"
                        Height="100px" TextMode="MultiLine"></asp:TextBox>
                    <label>
                        Sort Description</label>
                    <asp:TextBox ID="txt_sort_desc" runat="server" class="input-xlarge" Width="500px"
                        Height="100px" TextMode="MultiLine"></asp:TextBox>
                    <label>
                        Full Description</label>
                    <cc1:Editor ID="txt_full_desc" runat="server" Height="400" Width="600" />
                    <br />
                    <br />
                    <%-- <label>Technical Specification</label>--%>
                    <%-- <cc1:Editor ID="txt_techspec" runat="server" Height="400" Width="600" />--%>
                    <br />
                    <br />
                    <label>
                        Product Image</label>
                    <asp:FileUpload ID="fileupload_small" runat="server" />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
            <div class="btn-toolbar">
                <br />
                <br />
                <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Submit"
                    OnClick="btn_submit_Click" />
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
