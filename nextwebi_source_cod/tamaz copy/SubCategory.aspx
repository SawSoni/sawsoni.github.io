<%@ Page Title="Tamaz Global Trading Co." Language="C#" MasterPageFile="~/main2.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/Ecom.js" type="text/javascript"></script>--%>
    <%--<script>
        $(function () {

            var projects = function (request, response) {
                var url = '<%= ResolveUrl("~/Backend.asmx/Acomp") %>';
                var projects = [];
                var type = "category";
                var apikey = getKey("apiKey");
                var parameter = { "type": type, "para": $("#project").val(), "apiKey": apikey }
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(parameter),
                    contentType: 'application/json; charset=utf-8',
                    dataType: "json",
                    success: function (data) {
                        response(data.d);

                    },
                    error: function (error) {
                        alert('error; ' + eval(error));
                    }

                });
            };
            $("#project").autocomplete({
                minLength: 0,
                source: projects,
                focus: function (event, ui) {
                    $("#project").val(ui.item.label);
                    return false;
                },
                select: function (event, ui) {
                    var productName = ui.item.label.split(" ");
                    var product = "";
                    for (var i = 0; i < productName.length; i++) {
                        if (i == 0) {
                            product = productName[i];
                        }
                        else {
                            product = product + "-" + productName[i];
                        }
                    }
                    window.location = "Product/" + product;
                    //                    $("#project").val(ui.item.label);
                    //                    $("#project-id").val(ui.item.value);
                    //                    $("#project-description").html(ui.item.desc);
                    //                    $("#project-icon").attr("src", "images/" + ui.item.icon);

                    return false;
                }
            })
    .autocomplete("instance")._renderItem = function (ul, item) {
        return $("<li>")
        .append("<a><div class='row'><div class='col-md-12' style='border-bottom:1px solid #ccc;'><div class='col-sm-1'><img style='width:30px;border:1px solid#999;' alt='tamaz' src='../" + item.icon + "'/></div><div class='col-sm-11'> " + item.label + "<br>" + item.desc + "</div></div></div></a>")
        .appendTo(ul);
    };
        });

    </script>--%>
    <asp:PlaceHolder ID="MetaPlaceHolder" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumb"><a href="Default.aspx">Home</a> » <a id="cat" href="#"><%=category %></a> » <a href="#"><%=subCategory %></a></div>
    <div class="inner-header">

        <div class="skin-whitening">
            <div class="pull-left">
                <h1 id="a123" class="inner-title"><%=subCategory %> in India</h1>
				

            </div>

            <div class="clearfix"></div>
        </div>
    </div>


    <div class="beta-products-list">
        <%--  <div id="pro1"></div>--%>

        <%=productlist %>
    </div>
    <!-- .beta-products-list -->
    <div style="clear: both;"></div>
    <div id="categoryDesc" style="margin-top: 20px; padding: 30px; border: 1px solid #ccc; min-height: 100px;" runat="server"></div>

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

