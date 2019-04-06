using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class con1 : System.Web.UI.Page
{
    string message = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        productInfo sms = new productInfo();
        sendemail();
        sms.queryRequest("1182", "abdul_123", message, sms.ISTINIDAtime().ToString(), "Contact Us", "drjamesglutathione.in");
    }
    protected void sendemail()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("info@magicproducts.in");
            mail.CC.Add("honorajay@gmail.com");

            mail.From = new MailAddress("info@magicproducts.in");
            mail.Subject = "drjamesglutathione.in Contact us form";


            string Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txt_name.Value + " successfully registered his/her Query " + "<br/>" + "<br/>" + "<br/>" + "Regards:" + "<br/>" + "Name: " + Convert.ToString(txt_name.Value) + "<br/>" + "Contact No : " + Convert.ToString(txt_mobile.Value) + "<br/>" + "Email Id : " + Convert.ToString(txt_email.Value) + "<br/>" + "<br/>" + "Message : " + Convert.ToString(txt_msg.Value) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "drjamesglutathione.in" + "<br/>" + "http://drjamesglutathione.in";
            message = "Dear Sir/Madam," + txt_name.Value + " successfully registered his/her Query " + "Regards:" + Convert.ToString(txt_name.Value) + " Contact No : " + Convert.ToString(txt_mobile.Value) + " Email Id : " + Convert.ToString(txt_email.Value) + " Message : " + Convert.ToString(txt_msg.Value);
            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "relay-hosting.secureserver.net";
            smtp.Port = 25;
            //smtp.Credentials = new System.Net.NetworkCredential
            //     ("mail@magicproducts.in", "123456a$");

            //smtp.EnableSsl = true;
            smtp.Send(mail);

            lblsuccess.Text = "your query has been posted successfuly.. we will get back to you soon. Thank You!";
            txt_name.Value = "";
            txt_mobile.Value = "";
            txt_msg.Value = "";
            txt_email.Value = "";

        }
        catch (Exception es)
        {

            lblsuccess.Text = "There is some problem please try after some time. Thank You!";
        }
    }
}