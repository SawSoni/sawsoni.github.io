using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;

/// <summary>
/// Summary description for productInfo
/// </summary>
public class productInfo
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    public productInfo()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public long UnitPrice(string currency, long amount)
    {
        long result = 0;
        try
        {
            con.Open();
            DataSet ds = new DataSet();
            ds.Clear();
            SqlCommand cmd = new SqlCommand("select currency_value from currency where currency='" + currency + "'", con);
            SqlDataAdapter sDa = new SqlDataAdapter(cmd);
            sDa.Fill(ds);
            if (ds.Tables.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (Convert.ToString(row["currency_value"]).ToLower() != "contact for price")
                    {
                        result = int.Parse(Convert.ToString(row["currency_value"])) * amount;
                    }
                    else
                    {
                        result = 0;
                    }
                }
            }
        }
        catch (Exception ex)
        {
        }
        finally
        {
            con.Close();
        }
        return result;
    }
    public DateTime ISTINIDAtime()
    {
        //
        // TODO: Add constructor logic here
        //
        DateTime localTime;
        DateTime utcTime = DateTime.UtcNow;
        TimeZoneInfo tzi = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        localTime = TimeZoneInfo.ConvertTimeFromUtc(utcTime, tzi); // convert from utc to local
        return localTime;
    }
    public System.Drawing.Image ScaleImageSmall(System.Drawing.Image image, int maxHeight)
    {
        var ratio = (double)maxHeight / image.Height;
        //  var newWidth = (int)(image.Width * ratio);
        // var newHeight = (int)(image.Height * ratio);

        var newWidth = 60;
        var newHeight = 60;


        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }
    public System.Drawing.Image ScaleImageBlog(System.Drawing.Image image, int maxHeight)
    {
        var ratio = (double)maxHeight / image.Height;
        //  var newWidth = (int)(image.Width * ratio);
        // var newHeight = (int)(image.Height * ratio);

        var newWidth = 500;
        var newHeight = 200;


        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }
    public System.Drawing.Image ScaleImageBig(System.Drawing.Image image, int maxHeight)
    {
        var ratio = (double)maxHeight / image.Height;
        //  var newWidth = (int)(image.Width * ratio);
        // var newHeight = (int)(image.Height * ratio);

        var newWidth = 250;
        var newHeight = 250;


        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }
    public System.Drawing.Image other(System.Drawing.Image image, int maxHeight)
    {
        var ratio = (double)maxHeight / image.Height;
        //  var newWidth = (int)(image.Width * ratio);
        // var newHeight = (int)(image.Height * ratio);

        var newWidth = 500;
        var newHeight = 500;


        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }
    public string SendOTP(string strMobileno, string strPassword, string orderid)
    {
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create(@"http://sms.ciphertrivia.com//api/web2sms.php?workingkey=A5c19d3f460e66a434d48587799312738&to=" + strMobileno + "&sender=BUNNYB&message=Greetings from Bunny Bash your one time password (OTP) is " + strPassword);
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');

            //status
            HttpWebRequest myHttpWebRequest2 = null;
            HttpWebResponse myHttpWebResponse2 = null;
            StreamReader strStreemReader2 = null;
            myHttpWebRequest2 = (HttpWebRequest)HttpWebRequest.Create(@"" + strmsgid[2]);


            myHttpWebRequest2.Method = "GET";
            myHttpWebRequest2.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse2 = (HttpWebResponse)myHttpWebRequest2.GetResponse();
            strStreemReader2 = new StreamReader(myHttpWebResponse2.GetResponseStream());
            strStreemResponse2 = strStreemReader2.ReadToEnd();
        }
        catch
        {
        }
        return strStreemResponse2;
    }
    public int querySms(string name, string mobile)
    {
        int rslt = 0;
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=15802vgs22e70e8gt62j8&to=9741045673&sender=GLUMRR&message=Dear Distributor, " + name + " has posted a query on TamazGlobal.com please call at " + mobile);
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');
            rslt = 1;
        }
        catch
        {
        }
        return rslt;
    }
    public int querySmsResponse(string mobile)
    {
        int rslt = 0;
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=15802vgs22e70e8gt62j8&to=" + mobile + "&sender=GLUMRR&message=Your request has been posted to our local distributors for any query please call at 9663977155 Regards, TamazGlobal.com");
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');
            rslt = 1;
        }
        catch
        {
        }
        return rslt;
    }
    public int queryRequest(string pin_no, string admin_pin, string message, string datetime, string type, string sitename)
    {
        int rslt = 0;
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            //try
            //{
            //    HttpWebRequest myHttpWebRequest = null;
            //    HttpWebResponse myHttpWebResponse = null;
            //    StreamReader strStreemReader = null;
            //    myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=15802vgs22e70e8gt62j8&to=9741045673&sender=GLUMRR&message=Dear Distributor, " + name + " has posted a query on GultaMart.com please call at " + mobile);
            //    myHttpWebRequest.Method = "GET";
            //    myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            //    myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            //    strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            //    strStreemResponse = strStreemReader.ReadToEnd();
            //    string[] strmsgid = strStreemResponse.Split('=');
            //}
            //catch
            //{
            //}
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into reporting values(@pin_no,@admin_pin,@message,@datetime,@type,@other,@other1,@other2,@other3,@other4,@other5)", con);
            cmd.Parameters.AddWithValue("@pin_no", SqlDbType.VarChar).Value = pin_no;
            cmd.Parameters.Add("@admin_pin", SqlDbType.VarChar).Value = admin_pin;
            cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = message;
            cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = datetime;
            cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "Pending";
            cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = sitename;
            cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other4", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other5", SqlDbType.VarChar).Value = "";

            cmd.ExecuteNonQuery();
            rslt = 1;
        }
        catch (Exception ex)
        {
            rslt = 0;
        }
        finally
        {
            con.Close();
        }
        return rslt;
    }
    public string callMeBack(string name, string mobileNumber, string time)
    {
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=15802vgs22e70e8gt62j8&to=9741045673&sender=GLUMRR&message=" + name + " has requested for call me back option. mobile no " + mobileNumber + ". Call Time: " + time);
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');

            //status
            HttpWebRequest myHttpWebRequest2 = null;
            HttpWebResponse myHttpWebResponse2 = null;
            StreamReader strStreemReader2 = null;
            myHttpWebRequest2 = (HttpWebRequest)HttpWebRequest.Create(@"" + strmsgid[2]);


            myHttpWebRequest2.Method = "GET";
            myHttpWebRequest2.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse2 = (HttpWebResponse)myHttpWebRequest2.GetResponse();
            strStreemReader2 = new StreamReader(myHttpWebResponse2.GetResponseStream());
            strStreemResponse2 = strStreemReader2.ReadToEnd();
        }
        catch
        {
        }
        return strStreemResponse2;
    }
    public string ReplySMS(string mobileNumber)
    {
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=15802vgs22e70e8gt62j8&to=" + mobileNumber + "&sender=GLUMRR&message=Dear User, Thanks for your query on TamazGlobal.com, My name is Sahil. I am your personal consultant, soon I will contact to you. meanwhile for any query or consultation/clarification please call me any time at +919663977155");
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');


        }
        catch
        {
        }
        return strStreemResponse2;
    }
    public int QueryUs(QuickQuery q)
    {
        QueryEmail qe = new QueryEmail();
        int rslt = 1;
        try
        {
            qe.fromEmail = "contact.email.server@gmail.com";

            qe.toEmail = "sales@tamazglobal.com," + "shashi@nextwebi.in";
            //qe.toEmail = "shashi@nextwebi.in";
            qe.ccEmail = "honorajay@gmail.com";
            qe.uid = "contact.email.server@gmail.com";
            qe.pwd = "Indian@2016";
            qe.subject = "TamazGlobal.com | Type :" + q.type + " | " + q.product;
            qe.body = "Dear Sir/Madam,<br/> you got enquiry <br/> Enquiry Type: " + q.type + "<br/>Product :" + q.product + "<br/> Name :" + q.name + "<br/>Email :" + q.email + "<br/>Mobile:" + q.mobile + "<br/>Message: " + q.message + "<br/><br/>Webmaster,<br/> Tamaz Global <br/>http://tamazglobal.com";

            con.Open();
            productInfo obj = new productInfo();
            SqlCommand cmd = new SqlCommand(@"insert into contact_us(type,name,email,mobile,message,website,global_pin,local_pin,posted_on,ip_address,product,other,other1) values('" + q.type + "','" + q.name + "','" + q.email + "','" + q.mobile + "','" + q.message + "','" + q.website + "','" + q.globalPin + "','" + q.localPin + "','" + q.postedOn + "','" + q.ip + "','" + q.product + "','" + q.queryGuid + "','" + q.status + "')", con);
            cmd.ExecuteNonQuery();
            SendEmail(qe);
            rslt = 0;
        }
        catch (Exception ex)
        {
            rslt = 1;
        }
        finally
        {
            con.Close();
        }
        return rslt;

    }

    public int SendEmail(QueryEmail qe)
    {
        int rslt = 1;
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(qe.toEmail);
            mail.CC.Add(qe.ccEmail);

            mail.From = new MailAddress(qe.fromEmail);
            mail.Subject = qe.subject;

            mail.Body = qe.body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential
                 (qe.uid, qe.pwd);

            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        catch (Exception ex)
        {

        }
        finally
        {
        }
        return rslt;
    }
    public int SubEmail(EmailSubscription e)
    {
        int rslt = 1;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into subscription_email(email_id,status,datetime) values('" + e.email + "','" + e.status + "','" + e.time + "')", con);
            cmd.ExecuteNonQuery();
            rslt = 0;
        }
        catch
        {
            rslt = 1;
        }
        finally
        {
            con.Close();
        }
        return rslt;
    }
    public int SubWhatsapp(WhatsappSubscription w)
    {
        int rslt = 1;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into whatsapp_subscription(mobile,status,datetime) values('" + w.mobile + "','" + w.status + "','" + w.time + "')", con);
            cmd.ExecuteNonQuery();
            rslt = 0;
        }
        catch
        {
            rslt = 1;
        }
        finally
        {
            con.Close();
        }
        return rslt;
    }
    public status VendorRegistration(vendor v)
    {
        status st = new status();
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into vendor(vendor_guid,name,company,email,email_verification,mobile,mobile_verification,landline,country,state,city,address,file_address,date_time,category) values('" + v.vendorGuid + "','" + v.name + "','" + v.company + "','" + v.email + "','" + v.emailVerification + "','" + v.mobile + "','" + v.mobileVerification + "','" + v.landline + "','" + v.country + "','" + v.state + "','" + v.city + "','" + v.address + "','" + v.fileAddress + "','" + v.time + "','" + v.category + "')", con);
            cmd.ExecuteNonQuery();
            st.val = 0;
            st.message = "Vendor registered successfully !!";
        }
        catch (Exception ex)
        {
            st.val = 1;
            st.message = "Something went wrong ! please try again ..";
        }
        finally
        {
            con.Close();
        }
        return st;
    }

    public status consult(consulting1 c)
    {
        status st = new status();
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into consulting(consulting_guid,name,mobile,email,requirement,country,state,city,address,date_time) values('" + c.consultingGuid + "','" + c.name + "','" + c.mobile + "','" + c.email + "','" + c.requirement + "','" + c.country + "','" + c.state + "','" + c.city + "','" + c.address + "','" + c.time + "')", con);
            cmd.ExecuteNonQuery();
            st.val = 0;
            st.message = "Request submitted successfully, will get back to you shortly !!";
        }
        catch (Exception ex)
        {
            st.val = 1;
            st.message = "something went wrong ! please try again ..";
        }
        finally
        {
            con.Close();
        }
        return st;



    }

    public string SendWhatAppSMS(string mobileNumber)
    {
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create("http://sms.ciphertrivia.com//api/web2sms.php?workingkey=A5c19d3f460e66a434d48587799312738&to=7022044111&sender=BUNNYB&message=Dear Team, A user wants to connect with you on whatsapp using the mobile no " + mobileNumber);
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');


        }
        catch
        {
        }
        return strStreemResponse2;
    }

    public string SendOrderSuccessFull(string strMobileno, string orderid)
    {
        string strResponseResult = string.Empty;
        string strStreemResponse = string.Empty;
        string strStreemResponse2 = string.Empty;
        try
        {
            HttpWebRequest myHttpWebRequest = null;
            HttpWebResponse myHttpWebResponse = null;
            StreamReader strStreemReader = null;
            myHttpWebRequest = (HttpWebRequest)HttpWebRequest.Create(@"http://sms.ciphertrivia.com//api/web2sms.php?workingkey=A5c19d3f460e66a434d48587799312738&to=" + strMobileno + "&sender=BUNNYB&message=Thank you for choosing Bunny Bash your order is placed successfully order no. is " + orderid);
            myHttpWebRequest.Method = "GET";
            myHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();
            strStreemReader = new StreamReader(myHttpWebResponse.GetResponseStream());
            strStreemResponse = strStreemReader.ReadToEnd();
            string[] strmsgid = strStreemResponse.Split('=');

            //status
            HttpWebRequest myHttpWebRequest2 = null;
            HttpWebResponse myHttpWebResponse2 = null;
            StreamReader strStreemReader2 = null;
            myHttpWebRequest2 = (HttpWebRequest)HttpWebRequest.Create(@"" + strmsgid[2]);


            myHttpWebRequest2.Method = "GET";
            myHttpWebRequest2.ContentType = "text/xml; encoding='utf-8'";
            myHttpWebResponse2 = (HttpWebResponse)myHttpWebRequest2.GetResponse();
            strStreemReader2 = new StreamReader(myHttpWebResponse2.GetResponseStream());
            strStreemResponse2 = strStreemReader2.ReadToEnd();
        }
        catch
        {
        }
        return strStreemResponse2;
    }
}