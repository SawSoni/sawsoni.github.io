<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true"
    EnableEventValidation="true" CodeFile="Edit_Product_Deatils.aspx.cs" Inherits="Admin_Edit_Product_Deatils" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Edit Product Details</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active in" id="home">
                <div id="tab">
                    <label>
                        Select Product Category</label>
                    <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged">
                    </asp:DropDownList>
                    <label>
                        Select Product Sub Category</label>
                    <asp:DropDownList ID="ddl_subcategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_subcategory_SelectedIndexChanged">
                    </asp:DropDownList>
                    <label>
                        Select Product</label>
                    <asp:DropDownList ID="ddl_product" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_product_SelectedIndexChanged">
                    </asp:DropDownList>
                    
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
                    <%--<label>
                        Discount Price</label>
                    <asp:TextBox ID="txt_discount_price" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>
                    <label>
                        Final Price</label>
                    <asp:TextBox ID="txt_final_price" runat="server" class="input-xlarge" Width="500px"></asp:TextBox>--%>
                    
                    
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
                    <%--<label>Technical Specification</label>
        <cc1:Editor ID="txt_techspecs" runat="server"  Height="400" Width="600"  /> 
                    --%>
                    <br />
                    <%--<br />
                    <asp:CheckBox ID="chk_featured" Text="Is Featured" runat="server" />
                    <label>
                        (Selecting Is Featured will display the product on home page featured(popular) )</label><br />
                    <br />
                    <asp:CheckBox ID="chk_hotselling" Text="Is Hotselling " runat="server" />
                    <label>
                        (Selecting Is Hotselling will display the product in Hotselling Tab at left )</label><br />--%>
                    <br />
                    <asp:Label ID="lbl_success" runat="server"></asp:Label>
                </div>
            </div>
            <div class="btn-toolbar">
                <br />
                <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Update"
                    OnClick="btn_submit_Click" />
                <br />
                <br />
                <br />
                <br />
                <label>
                    <b>Upload New image</b></label>
                <br />
                <label>
                    Product Image -
                </label>
                <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_upload" runat="server" class="btn btn-primary" Text="Upload"
                    OnClick="btn_upload_Click" />
                <br />
                <asp:Label ID="lbl_added" runat="server"></asp:Label>
                <br />
                <asp:Image ID="img_product_small" runat="server" Width="200" Height="200" />
            </div>
        </div>
    </div>
</asp:Content>
