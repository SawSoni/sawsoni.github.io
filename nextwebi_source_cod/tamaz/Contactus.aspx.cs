using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;

public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
        }
    }
    string message = string.Empty;
    protected void sendemail()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
         
            mail.CC.Add("honorajay@gmail.com");

            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "tamazglobal.com Contact us form";


            string Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txt_name.Text + " successfully registered his/her Query " + "<br/>" + "<br/>" + "<br/>" + "Regards:" + "<br/>" + "Name: " + Convert.ToString(txt_name.Text) + "<br/>" + "Contact No : " + Convert.ToString(txt_mobile.Text) + "<br/>" + "Email Id : " + Convert.ToString(txt_email.Text) + "<br/>" + "Country : " + Convert.ToString(txt_country.Text) + "<br/>" + "City : " + Convert.ToString(txt_city.Text) + "<br/>" + "Message : " + Convert.ToString(txt_enquiry.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "m47" + "<br/>" + "http://tamazglobal.com/";
            message = "Dear Sir/Madam," + txt_name.Text + " successfully registered his/her Query " + "Regards:" + Convert.ToString(txt_name.Text) + " Contact No : " + Convert.ToString(txt_mobile.Text) + " Email Id : " + Convert.ToString(txt_email.Text) + "Country : " + Convert.ToString(txt_country.Text) + " City : " + Convert.ToString(txt_city.Text) + " Message : " + Convert.ToString(txt_enquiry.Text);
            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "dedrelay.secureserver.net";
            smtp.Port = 25;
            //smtp.Credentials = new System.Net.NetworkCredential
            //     ("contact.email.server@gmail.com", "Indian@2016");

            //smtp.EnableSsl = true;
            smtp.Send(mail);

            //   lblsuccess.Text = "your query has been posted successfuly.. we will get back to you soon. Thank You!";
            txt_name.Text = "";
            txt_mobile.Text = "";
            txt_enquiry.Text = "";
            txt_city.Text = "";
            txt_email.Text = "";

        }
        catch (Exception es)
        {

            lblsuccess.Text = "There is some problem please try after some time. Thank You!";
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //productInfo sms = new productInfo();
        //sms.Contact(txt_name.Text, txt_mobile.Text, sms.ISTINIDAtime().ToString("dd-MM-yyyy"), txt_city.Text, txt_enquiry.Text, "9916726373", "MGCPRO");
        if (Session["captcha"].ToString() == txtCaptcha.Text)
        {
            sendemail();
            txtCaptcha.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('your query has been posted successfuly.. we will get back to you soon. Thank You! ');window.location='" + Request.RawUrl + "';", true);

        }
        else
        {
            lbl_captcha.Text = "Invalid Captcha";
        }
        //productInfo.queryRequest("8251", "abdul_123", message, sms.ISTINIDAtime().ToString(), "Contact Us", "beautyplushealth.in");
    }



    void FillCapctha()
    {
        try
        {
            Random random = new Random();

            string combination = "0123456789";

            StringBuilder captcha = new StringBuilder();

            for (int i = 0; i < 6; i++)

                captcha.Append(combination[random.Next(combination.Length)]);

            Session["captcha"] = captcha.ToString();

            imgCaptcha.ImageUrl = "capcha.aspx?" + DateTime.Now.Ticks.ToString();
        }

        catch
        {
            throw;
        }
    }

    protected void btnRefresh_Click1(object sender, ImageClickEventArgs e)
    {
        FillCapctha();
    }
}