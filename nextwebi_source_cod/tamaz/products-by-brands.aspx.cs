using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class products_by_brands : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    public string strBrand = string.Empty;
    public string productlist = string.Empty, strCatDesc = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["index"] = "0";
        }
        //string[] str = RouteData.Values["CategoryName"].ToString().Split('.');
        strBrand = urlval(Convert.ToString(RouteData.Values["BrandName"]));
        if (strBrand.Contains(".aspx"))
        {
            strBrand = strBrand.Split('.')[0];
        }
        PopulateProduct(strBrand);
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
    protected void PopulateProduct(string brand)
    {
        try
        {
            string query = "Select * from product_by_brand where brand_name='" + brand + "'  order by cast(other_sort as int)  ASC";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                string query1 = "Select * from product_details where product_id='" + dr["product_id"] + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    string url = "../Product/" + seourl(Convert.ToString(dt1.Rows[0]["product_name"]));
                    string ribbon = "";
                    //productlist += "<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-6'><div class='col-item'>" + ribbon + "<div  class='product-image-area' style='border:1px solid #ccc;padding:10px;'> <a class='product-image' title='" + dt1.Rows[0]["product_name"] + "' href='" + url + "'> <img src='" + dt1.Rows[0]["big_image"] + "' class='img-responsive' alt='a' /> </a></div><div class='info'><div class='info-inner'><div class='item-title'><a title=' " + dt1.Rows[0]["product_name"] + "' href='" + url + "'> " + dt1.Rows[0]["product_name"] + " </a> </div><div class='item-content'><div class='ratings'><div class='rating-box'><div style='width:" + (Convert.ToDecimal(dt1.Rows[0]["product_rating"]) * 20) + "%' class='rating'></div> </div> </div><div class='price-box'><p class='special-price'> <span class='price'> Rs. " + dt1.Rows[0]["final_price"] + "</span> </p></div></div></div><div class='actions'><input type='button'class='button  btn-cart' id='btn-" + dt1.Rows[0]["product_id"] + " '  onclick='return false;' value='Add to Cart'/></div><div class='clearfix'> </div></div></div></li>";

                    productlist += "<div class='row'><div class='item col-lg-12 col-md-3 col-sm-12 col-xs-12'><div class='col-item'><div  class='product-image-area' style='background:#f5f5f5;border:1px solid #dcdcdc;'><div class='col-md-3' style='padding:0px;'> <a class='product-image' title='" + dt1.Rows[0]["product_name"] + "' href='../" + url + "'> <img src='../" + dt1.Rows[0]["big_image"] + "' class='img-responsive' alt='" + dt1.Rows[0]["product_name"] + "' /> </a></div><div class='col-md-9'><div class='info' style='height:auto;border:none;background:#f5f5f5;text-align:left;'><div class='info-inner'><div class='item-title' style='text-align:left;padding-top:10px;'><h2><a title=' " + dt1.Rows[0]["product_name"] + "' href='../" + url + "'> " + dt1.Rows[0]["product_name"] + " </a></h2> </div><div class='item-content'><div class='price-box'><p class='special-price'> " + dt1.Rows[0]["sort_desc"] + " </p><div class='btn-home w110' ><a data-toggle='modal' href='#pop_box1'>Contact Us</a></div></div></div></div></div></div><div class='actions'></div><div class='clearfix'> </div></div></div></div></div>";
                }

            }
            pro1.InnerHtml = productlist;

            string queryseo = "Select * from top_brands_seo where brand_name='" + brand + "'";
            SqlCommand cmdseo = new SqlCommand(queryseo, con);
            SqlDataAdapter sdaseo = new SqlDataAdapter(cmdseo);
            DataTable dtseo = new DataTable();
            sdaseo.Fill(dtseo);
            if (dtseo.Rows.Count > 0)
            {
                Page.Title = Convert.ToString(dtseo.Rows[0]["title"]);
                HtmlMeta metakey = new HtmlMeta();
                metakey.Name = "Keywords";
                metakey.Content = Convert.ToString(dtseo.Rows[0]["meta_keyword"]);
                MetaPlaceHolder.Controls.Add(metakey);
                HtmlMeta metadesc = new HtmlMeta();
                metadesc.Name = "Description";
                metadesc.Content = Convert.ToString(dtseo.Rows[0]["meta_desc"]);
                categoryDesc.InnerHtml = Convert.ToString(dtseo.Rows[0]["other"]);
                MetaPlaceHolder.Controls.Add(metadesc);
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
            q.product = strBrand;
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


    protected int sendemail2222()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
            mail.To.Add("honorajay@gmail.com");
            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "tamazglobal.com Query form product list page";


            Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txtname.Text + " is Querying about " + strBrand + " <br/>" + "<br/>" + "Regards:" + "<br/>" + "Contact No : " + Convert.ToString(txtmobile.Text) + "<br/>" + "Email Id : " + Convert.ToString(txtemail.Text) + "<br/>" + "Quantity : " + Convert.ToString(ddl_quanty.SelectedItem.Text) + "<br/>" + "Country : " + txtcountry.Text + "<br/>" + " City : " + Convert.ToString(txtcity.Text) + "<br/>" + " Message : " + Convert.ToString(txtmessge.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "Tamaz Global" + "<br/>" + "http://tamazglobal.com/";

            //        message = "Dear Sir/Madam, " + txt_neme.Text + " is Querying about " + urlval(Convert.ToString(RouteData.Values["ProductName"])) + "  Regards:" + " Name: " + Convert.ToString(txt_neme.Text) + " Contact No : " + Convert.ToString(txt_mobile.Text) + " City : " + Convert.ToString(txt_city.Text) + " Message : " + Convert.ToString(txt_message.Text);

            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "dedrelay.secureserver.net";
            smtp.Port = 25;
            //smtp.Credentials = new System.Net.NetworkCredential
            //      ("contact.email.server@gmail.com", "Indian@2016");

            smtp.EnableSsl = false;
            smtp.Send(mail);

            //lblsuccess.Text = "your query has been posted successfuly.. we will get back to you soon. Thank You!";
            txtname.Text = "";
            txtmobile.Text = "";
            txtmessge.Text = "";
            txtcity.Text = "";
            txtemail.Text = "";
            ddl_quanty.ClearSelection();
            return 1;

        }
        catch (Exception es)
        {
            return 0;
            //lblsuccess.Text = "There is some problem please try after some time. Thank You!";
        }
    }
    protected void btn_contact_Click(object sender, EventArgs e)
    {

        try
        {
            int mail = sendemail2222();
            if (mail == 1)
                Response.Write("<script>alert('Query submitted successfully , our representative will get back to you soon !!');</script>");
            else
                Response.Write("<script>alert('Something went wrong , please try again later !!');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went wrong , please try again later !!');</script>");
        }
        finally
        {

        }
    }
}