<%@ Page Language="C#" AutoEventWireup="true" CodeFile="con1.aspx.cs" Inherits="con1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="extra/css/coin-slider.css" rel="stylesheet" type="text/css" />
    <link href="extra/css/style.css" rel="stylesheet" type="text/css" />
    <script src="extra/js/coin-slider.min.js" type="text/javascript"></script>
    <script src="extra/js/cufon-titillium-600.js" type="text/javascript"></script>
    <script src="extra/js/cufon-yui.js" type="text/javascript"></script>
    <script src="extra/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="extra/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="extra/js/script.js" type="text/javascript"></script>
    <style>
    .btn
    {
        background-image:url("extra/images/submit.gif");
        width:88px;
        height:29px;
        cursor:pointer;
        border:none;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ol>
              <li>
                <label for="cname">Name (required)</label>
                <input id="txt_name" name="cname" class="text" runat="server" />
              </li>
              <li>
                <label for="email">Email Address (required)</label>
                <input id="txt_email" name="email" class="text" runat="server" />
              </li>
              <li>
                <label for="mobile">Mobile No.</label>
                <input name="mobile" class="text" id="txt_mobile" maxlength="10" runat="server" />
              </li>
              <li>
                <label for="msg">Your Message</label>
                <textarea id="txt_msg" name="msg" rows="8" cols="50"  runat="server"></textarea>
              </li>
              <li>
                  <asp:Button ID="Button1" CssClass="btn" runat="server" Text="" 
                      onclick="Button1_Click" />
                
                <div class="clr"></div>
                  <asp:Label ID="lblsuccess" runat="server"></asp:Label>
              </li>
            </ol>
    </div>
    </form>
</body>
</html>
