<%@ Page Title="" Language="C#" MasterPageFile="~/main2.master" AutoEventWireup="true" CodeFile="products-by-brands.aspx.cs" Inherits="products_by_brands" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:PlaceHolder ID="MetaPlaceHolder" runat="server" />
    <div class="breadcrumbs">
        <div>
            <div class="row">
                <ul>
                    <li class="home"><a href="../Default.aspx" title="Go to Home Page">Home</a><span>&mdash;›</span></li>
                    <li class=""><a href="#">TopBrands</a><span>&mdash;›</span></li>
                    <li class="category13"><strong>
                        <%=strBrand %></strong></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="category-title">
        <h1 class="inner-title">
            <%=strBrand %></h1>
    </div>
    <div class="category-products">
        <ul id="pro1" runat="server" class="products-grid">
        </ul>
        <div style="clear: both;">
        </div>
        <div id="categoryDesc" class="std2" runat="server">
        </div>
        <div style="clear: both">
        </div>
        <br />
        <br />
        <div style="width: 100%; text-align: center; background-color: #007FB8; color: #fff; padding: 1px;">
            <h5>Quick Enquiry Form</h5>
        </div>
        <div class="tab-content" id="tab-order">
            <asp:TextBox ID="txt_neme" CssClass="large-field" PlaceHolder="Name " runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="kkkk" ControlToValidate="txt_neme" Display="Dynamic" ForeColor="Red" ErrorMessage="Field can not empty!" ValidationGroup="abcd"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:TextBox ID="txt_mobile" CssClass="large-field" PlaceHolder="Mobile No" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txt_mobile" Display="Dynamic" ForeColor="Red" ErrorMessage="Field can not empty!" ValidationGroup="abcd"></asp:RequiredFieldValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="txt_mobile"></asp:FilteredTextBoxExtender>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ControlToValidate="txt_mobile" ValidationExpression="[0-9]{10}" ErrorMessage="Only 10 Digit no. Required" ValidationGroup="abcd" ForeColor="Red"></asp:RegularExpressionValidator>

            <br />
            <br />
            <asp:TextBox ID="txt_city" CssClass="large-field" PlaceHolder="City" runat="server"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="txt_message" CssClass="large-field" PlaceHolder="Message" TextMode="MultiLine"
                Height="100px" runat="server"></asp:TextBox><br />
            <br />
            <asp:Button ID="btn_order" CssClass="button" runat="server" Text="Submit" OnClick="btn_order_Click" ValidationGroup="abcd" />
            <br />
            <br />
            <asp:Label ID="lblsuccess" runat="server"></asp:Label>
        </div>
    </div>

    <div id="pop_box1" class="modal fade">
        <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content">
                <div class="modal-body" style="padding: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div id="Div3">
                        <div class="row">
                            <div class="col-md-12" style="margin-bottom: 0px;">
                                <h2>Get Quick Quote</h2>
                            </div>
                            <div class="p20">
                                <div class="col-md-12">

                                    <asp:DropDownList ID="ddl_quanty" CssClass="large-field" runat="server">
                                        <asp:ListItem>Quantity</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtname" placeholder="Name" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtname" ValidationGroup="Regi" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtemail" placeholder="Email" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtemail" ValidationGroup="Regi" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email-ID"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="Reg" Display="Dynamic" ControlToValidate="txtemail" ErrorMessage="Invalid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    <asp:TextBox ID="txtmobile" placeholder="Mobile" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtmobile" ValidationGroup="Regi" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                        ControlToValidate="txtmobile" ErrorMessage="Only numbers are allowed" ValidationGroup="Regi"
                                        ValidationExpression="[0-9]"></asp:RegularExpressionValidator>
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="txtmobile"></asp:FilteredTextBoxExtender>

                                    <asp:TextBox ID="txtcountry" placeholder="Country" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtcountry" ValidationGroup="Regi" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Country"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtcity" placeholder="City" CssClass="large-field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtcity" ValidationGroup="Regi" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter City"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtmessge" CssClass="large-field" placeholder="Message" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                    <div class="clearfix"></div>
                                    <br />
                                    <asp:Button ID="btn_contact" Style="margin-top: 10px;" class="btn btn-default cp-button" ValidationGroup="Regi" runat="server" OnClick="btn_contact_Click" Text="Submit"></asp:Button>


                                </div>
                                <div class="clearfix"></div>
                            </div>

                        </div>



                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

