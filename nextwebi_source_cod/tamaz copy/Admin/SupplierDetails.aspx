<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="SupplierDetails.aspx.cs" Inherits="Admin_SupplierDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul class="breadcrumb">
        
            <li class="active">Supplier Details</li>
        </ul>
        <div class="well">
        <table>
        <tbody>
        <tr>
        <td class="td1">Supplier Name</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_name" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Company</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_company" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Contact Number</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_mobile" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Email Id</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_email" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Website</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_website" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Address</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_address" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Trust Level</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_tl" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Country</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_country" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Added By</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_addedby" runat="server"></span></td>
        </tr>
        <tr>
        <td class="td1">Added On</td>
        <td class="td2">:</td>
        <td class="td3"><span id="sp_addedon" runat="server"></span></td>
        </tr>
        </tbody>
        </table>
        </div>
</asp:Content>

