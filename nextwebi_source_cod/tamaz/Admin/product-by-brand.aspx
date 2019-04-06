<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="product-by-brand.aspx.cs" Inherits="Admin_product_by_brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .col40 {
            width: 40%;
            float: left;
        }

        .col20 {
            width: 20%;
            float: left;
        }

        .btn {
            background-image: none !important;
            border: 1px solid #49afcd;
            border-radius: 11px;
            font-size: 20px;
            font-weight: bold;
        }

        .productlist {
            background-color: #fff;
            width: 100%;
        }

            .productlist option {
                background: green none repeat scroll 0 0;
                color: #fff;
                margin: 2px;
                padding: 5px;
                font-weight: bold;
            }

        .brandlist {
            background-color: #fff;
            width: 100%;
        }

            .brandlist option {
                background: green none repeat scroll 0 0;
                color: #fff;
                margin: 2px;
                padding: 5px;
                font-weight: bold;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="active">Map Product With Brand</li>
    </ul>
    <div class="well">
        <div id="myTabContent" class="tab-content">
            <table>
                <tr>
                    <td>
                        <label>
                            Category Name</label>

                        <asp:DropDownList ID="ddl_category" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged" AutoPostBack="true" runat="server" class="input-xlarge"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" Display="Dynamic" InitialValue="0" ControlToValidate="ddl_category" runat="server" ErrorMessage="Category Required"></asp:RequiredFieldValidator>
                        <label>
                            Sub Category Name</label>
                        <asp:DropDownList ID="ddl_sub_category" OnSelectedIndexChanged="ddl_sub_category_SelectedIndexChanged" AutoPostBack="true" runat="server" class="input-xlarge"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" Display="Dynamic" InitialValue="0" ControlToValidate="ddl_sub_category" runat="server" ErrorMessage="Sub Category Required"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                    <td>
                        <label>
                            Brands</label>
                        <asp:DropDownList ID="ddl_brand" AutoPostBack="true" OnSelectedIndexChanged="ddl_brand_SelectedIndexChanged" runat="server" class="input-xlarge"></asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" Display="Dynamic" InitialValue="0" ControlToValidate="ddl_brand" runat="server" ErrorMessage="Brand Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <t>
                    <td>
                        <asp:ListBox ID="lstProduct" CssClass="productlist" SelectionMode="Multiple" Height="300px" runat="server"></asp:ListBox>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_next_multi" CssClass="btn btn-info" runat="server" Text=">>" OnClick="btn_next_multi_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_prev_multi" CssClass="btn btn-info" runat="server" Text="<<" OnClick="btn_prev_multi_Click" /></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:ListBox ID="lstBrand" CssClass="brandlist" SelectionMode="Multiple" Height="300px" runat="server"></asp:ListBox>
                    </td>
               
                    <tr><td colspan="3" ><asp:Button ID="Button1" CssClass="btn btn-info" Font-Size="14px" runat="server" Text="Submit" OnClick="Button1_Click" /></td></tr>
            </table>
        </div>
    </div>

</asp:Content>

