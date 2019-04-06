using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

public partial class Category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    public string category = string.Empty;
    public string productlist = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["index"] = "0";
        }
        //string[] str = RouteData.Values["CategoryName"].ToString().Split('.');
        category = urlval(Convert.ToString(RouteData.Values["CategoryName"]));
        if (category.Contains(".aspx"))
        {
            category = category.Split('.')[0];
        }
        PopulateProduct();
    }
    private string urlval(string url)
    {
        string[] strArr = url.Split('-');
        string resulturl = string.Empty;
        for (int i = 0; i < strArr.Length; i++)
        {
            if (resulturl == "")
            {
                resulturl = strArr[i];
            }
            else
            {
                resulturl = resulturl + " " + strArr[i];
            }
        }
        return resulturl;
    }
    private string seourl(string url)
    {
        string[] strArr = url.Split(' ');
        string resulturl = string.Empty;
        for (int i = 0; i < strArr.Length; i++)
        {
            if (resulturl == "")
            {
                resulturl = strArr[i];
            }
            else
            {
                resulturl = resulturl + "-" + strArr[i];
            }
        }
        return resulturl;
    }
    protected void PopulateProduct()
    {
        try
        {
            //con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT product_id,product_name,big_image,price,discount_price,final_price,product_id,hotselling FROM product_details where category='" + category + "' order by isfeatured desc ", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //int j = 0;
            //for (int i = 0; i < ((ds.Tables[0].Rows.Count > 50) ? 50 : ds.Tables[0].Rows.Count); i++)
            //{
            //    string ribbon = string.Empty;
            //    if (ds.Tables[0].Rows[i]["hotselling"].ToString() == "Yes")
            //    {
            //        ribbon = "<div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div>";
            //    }
            //    else
            //    {
            //        ribbon = "";
            //    }
            //    if (((i + 1) % 3 == 1 || i == 0) && i != 1)
            //    {
            //        productlist = productlist + "<div class='row'>";
            //    }
            //    string url = GetRouteUrl("Product", new { ProductName = seourl(ds.Tables[0].Rows[i]["product_name"].ToString()) });
            //    productlist = productlist + "<div class='col-sm-4 '><div class='single-item'  style='border:1px solid #ccc; padding:10px; text-align:center;'>" + ribbon + "<div class='single-item-header' ><a href='" + url + "'><img src='../" + ds.Tables[0].Rows[i]["big_image"].ToString() + "' alt=''></a></div><div class='single-item-body'><p class='single-item-title' style='text-align:center;  padding-top:10px'>" + ds.Tables[0].Rows[i]["product_name"].ToString() + "</p><p class='single-item-price' style='text-align:center; color:#8C1C40; padding-top:10px'><span>" + ds.Tables[0].Rows[i]["final_price"].ToString() + "</span></p></div><div class='single-item-caption' style='text-align:center; padding-top:10px; '><input type='button'class='button beta-btn primary beta-btn-small' id='btn-" + ds.Tables[0].Rows[i][0].ToString() + " ' class='button' onclick='return false;' value='Add to Cart'/><div class='clearfix'></div></div></div></div>";
            //    if ((i + 1) % 3 == 0 && i != 0)
            //    {
            //        productlist = productlist + "</div><div class='space40'>&nbsp;</div>";
            //    }
            //    j = i+1;
            //}
            //if (j % 3 != 0 && j != 0)
            //{
            //    productlist = productlist + "</div><div class='space40'>&nbsp;</div>";
            //}
            SqlCommand cmd1 = new SqlCommand("SELECT title,meta_keyword,meta_desc,other FROM category_seo where category_name='" + category + "'  ", con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            string strCatDesc = string.Empty;
            if (ds1.Tables[0].Rows.Count > 0 && Convert.ToString(ds1.Tables[0].Rows[0][0]) != "")
            {
                //Request.QueryString["id"].ToString().Trim();
                Page.Title = Convert.ToString(ds1.Tables[0].Rows[0]["title"]);
                HtmlMeta metakey = new HtmlMeta();
                metakey.Name = "Keywords";
                metakey.Content = Convert.ToString(ds1.Tables[0].Rows[0]["meta_keyword"]);
                MetaPlaceHolder.Controls.Add(metakey);
                HtmlMeta metadesc = new HtmlMeta();
                metadesc.Name = "Description";
                metadesc.Content = Convert.ToString(ds1.Tables[0].Rows[0]["meta_desc"]);
                MetaPlaceHolder.Controls.Add(metadesc);
                strCatDesc = Convert.ToString(ds1.Tables[0].Rows[0]["other"]);
            }
            if (strCatDesc.Length > 10)
            {
                categoryDesc.InnerHtml = strCatDesc;

            }
            else
            {
                categoryDesc.Visible = false;
            }
        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }
    string Body = string.Empty;
    string message = string.Empty;
    protected void sendemail()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
            mail.CC.Add("honorajay@gmail.com");

            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "Tamaz Global Query form";


            Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txt_neme.Text + " is Querying about " + urlval(Convert.ToString(RouteData.Values["CategoryName"])) + " <br/>" + "<br/>" + "Regards:" + "<br/>" + "Name: " + Convert.ToString(txt_neme.Text) + "<br/>" + "Contact No : " + Convert.ToString(txt_mobile.Text) + "<br/>" + " City : " + Convert.ToString(txt_city.Text) + "<br/>" + " Message : " + Convert.ToString(txt_message.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "Bunny Bash." + "<br/>" + "http://www.bunnybash.in";

            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "dedrelay.secureserver.net";
            smtp.Port = 25;
            //smtp.Credentials = new System.Net.NetworkCredential
            //     ("contact.email.server@gmail.com", "123456a$");

            smtp.EnableSsl = false;
            smtp.Send(mail);

            lblsuccess.Text = "your query has been posted successfuly.. we will get back to you soon. Thank You!";
            txt_neme.Text = "";
            txt_mobile.Text = "";
            txt_message.Text = "";
            //txt_pincode.Text = "";
            //txt_state.Text = "";
            txt_city.Text = "";


        }
        catch (Exception es)
        {

            lblsuccess.Text = "There is some problem please try after some time. Thank You!";
        }
    }
    protected void btn_order_Click(object sender, EventArgs e)
    {
        try
        {
            String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            QuickQuery q = new QuickQuery();
            productInfo p = new productInfo();
            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            string ipStr = ip.Replace("::ffff:", "");
            q.globalPin = "ravi@global123";
            q.ip = ipStr;
            q.localPin = "123456a$";
            q.message = txt_message.Text;
            q.mobile = txt_mobile.Text;
            q.name = txt_neme.Text;
            q.postedOn = p.ISTINIDAtime().ToString();
            q.email = "";
            q.product = category;
            q.queryGuid = Guid.NewGuid().ToString();
            q.status = "open";
            q.type = "Category";
            q.website = "bunnybash.in";
            int rslt = p.QueryUs(q);
            if (rslt == 0)
            {
                //txt_email.Text = string.Empty;
                txt_message.Text = string.Empty;
                txt_mobile.Text = string.Empty;
                txt_neme.Text = string.Empty;
                Response.Write("<script>alert('Query submitted successfully , our representative will get back to you soon !!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Something went wrong , please try again later !!');</script>");
            }
        }
        catch (Exception ex)
        {
        }
        finally
        {

        }
    }
}