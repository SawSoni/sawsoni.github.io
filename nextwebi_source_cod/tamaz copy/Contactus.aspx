<%@ Page Title=" Contact Us | Tamaz Global Trading Co." Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        h2 {
            border-bottom: 1px solid #e4e4e4;
            color: #444;
            font-size: 15px;
            font-weight: normal;
            margin-bottom: 5px;
            margin-top: 0;
            padding: 3px 8px;
            text-transform: uppercase;
        }

        .large-field {
            min-width: 200px;
            width: 80% !important;
            max-width: 80% !important;
            margin: 10px 0px 0px 0px;
            border: 1px solid #e1e1e1;
            height: 37px;
            padding: 0 12px;
        }
    </style>
    <%--    <script>
        $(document).ready(function () {
            $('#<%=btn_submit.ClientID %>').click(function () {

                var fname = $('#<%=txt_name.ClientID %>').val();
                var mobile = $('#<%=txt_mobile.ClientID %>').val();


                if (fname == "") {
                    alert("Name Required !");
                    return false;
                }

                if (mobile == "" || isNaN(mobile) || mobile.length < 10) {
                    alert("Enter Valid Mobile Number !");
                    return false;
                }


            });
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:ScriptManager runat="server" ID="First"></asp:ScriptManager>--%>
    <div id="content">
        <!--Breadcrumb Part Start-->


        <!--Breadcrumb Part End-->
        <div class="inner-header">
            <div class="container">
                <div class="pull-left">
                    <h1 class="inner-title" style="margin-bottom: 20px;">Contact Us</h1>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>



        <h2 style="margin: 0px 0px 15px 20px; padding-left: 0px;">Contact Form</h2>
        <div class="content" style="margin-left: 20px;">
            <b>Name:</b><br />
            <asp:TextBox ID="txt_name" CssClass="large-field" PlaceHolder="Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txt_name" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>

            <br />
            <br />
            <b>Country:</b><br />
            <asp:TextBox ID="txt_country" CssClass="large-field" PlaceHolder="Country" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txt_country" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Country"></asp:RequiredFieldValidator>

            <br />
            <br />
            <b>City:</b><br />
            <asp:TextBox ID="txt_city" CssClass="large-field" PlaceHolder="City" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txt_city" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter City"></asp:RequiredFieldValidator>

            <br />
            <br />
            <b>E-Mail Address:</b><br />
            <asp:TextBox ID="txt_email" CssClass="large-field" PlaceHolder="Email Id" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txt_email" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email-ID"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txt_email" ErrorMessage="Invalid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Regist"></asp:RegularExpressionValidator>
            <br />
            <br />
            <b>Mobile No:</b><br />
            <asp:TextBox ID="txt_mobile" CssClass="large-field" PlaceHolder="Mobile Number" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txt_mobile" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                ControlToValidate="txt_mobile" ErrorMessage="10 Digit mobile no." ValidationGroup="Regist"
                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="txt_mobile"></asp:FilteredTextBoxExtender>
            <br />
            <br />
            <b>Enquiry:</b><br />
            <asp:TextBox ID="txt_enquiry" CssClass="large-field2" PlaceHolder="Enquiry" TextMode="MultiLine"
                Width="98%" Style="margin-top: 12px;" Height="150px" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-2 col-xs-4">
                            <asp:Image ID="imgCaptcha" Style="position: relative; right: 0px; top: 0px;" runat="server" />

                        </div>
                        <div class="col-md-2 col-xs-4">
                            <asp:ImageButton ID="btnRefresh" Style="border-width: 0px; width: 80%;" CausesValidation="false" OnClick="btnRefresh_Click1"  ImageUrl="images/reset-icon.png" runat="server" />

                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <br />
            <asp:TextBox ID="txtCaptcha" placeholder="Please enter above code" Style="margin-top: 6px;" runat="server"
                CssClass="large-field">
            </asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtCaptcha" ValidationGroup="Regist" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Captcha"></asp:RequiredFieldValidator>

            <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="lblsuccess" runat="server" Text=""></asp:Label><br />
        </div>
        <div class="buttons" style="margin: 0px 0px 0px 20px;">
            <div class="left">
                <asp:Button ID="btn_submit" runat="server" CssClass="button" Text="Submit" OnClick="btn_submit_Click" ValidationGroup="Regist" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <hr />
    </div>
</asp:Content>

