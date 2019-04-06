<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="adminpwdchange.aspx.cs" Inherits="Admin_adminpwdchange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <ul class="breadcrumb">
        
            <li class="active">Administrator Password Change</li>
        </ul>

<div class="well">

    <table style="width:100%;" cellpadding="5">
        <tr>
            <td width="322">
                Your old password</td>
            <td width="322">
                            <asp:TextBox ID="txt_oldpassword" runat="server" AutoPostBack="True" 
                                ontextchanged="txt_oldpassword_TextChanged" TextMode="Password"></asp:TextBox>
            </td>
            <td width="322">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txt_oldpassword" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="322">
                &nbsp;</td>
            <td width="322">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td width="322">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="322">
                New Password
            </td>
            <td width="322">
                            <asp:TextBox ID="txt_newpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td width="322">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txt_newpassword" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="322">
                Re-type New Password</td>
            <td width="322">
                            <asp:TextBox ID="txt_retypepassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td width="322">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txt_retypepassword" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txt_newpassword" ControlToValidate="txt_retypepassword" 
                                ErrorMessage="Password Not Matched"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="322">
                &nbsp;</td>
            <td width="322">
                            <asp:Label ID="lbl_message" runat="server"></asp:Label>
            </td>
            <td width="322">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="322">
                &nbsp;</td>
            <td width="322">
                            <asp:Button ID="btn_change" runat="server" onclick="btn_change_Click" 
                                Text="Submit" />
            </td>
            <td width="322">
                &nbsp;</td>
        </tr>
        </table>

</div>

</asp:Content>

