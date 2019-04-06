using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;

public partial class main : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    public string category_list = string.Empty;
    public string Latest_Product = string.Empty;
    public string category = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
        }
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        Response.Cookies["apiKey"].Value = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        Page page = HttpContext.Current.CurrentHandler as Page;
        // page.ClientScript.RegisterStartupScript(GetType(), "Script", "abc()", true);
        PopulateCatrgory();
        PopulateProduct();
    }
    protected void PopulateCatrgory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM category order by cast(other as int) ASC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string url = GetRouteUrl("Category", new { CategoryName = seourl(ds.Tables[0].Rows[i]["category"].ToString()) });
                //category_list = category_list + "<li><div style='padding-top:5px;padding-bottom:5px;' id='" + ds.Tables[0].Rows[i]["category"].ToString() + "' class='category'><span class='bigdot'>.</span><a href='" + url + "' class=''>" + ds.Tables[0].Rows[i]["category"].ToString() + " </a><span  style='float:right'>></span></div>";
                SqlCommand cmd1 = new SqlCommand("SELECT *, (Select Count(category) from sub_category where category_id='" + ds.Tables[0].Rows[i]["id"].ToString() + "') as Exp1 FROM sub_category where category_id='" + ds.Tables[0].Rows[i]["id"].ToString() + "' order by cast(other_sort as int)  ASC", con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    category_list = category_list + "<li class='level0- level0 open'> <span class='magicat-cat'><a href='" + url + "'><span>" + ds.Tables[0].Rows[i]["category"].ToString() + " (" + ds1.Tables[0].Rows[0]["Exp1"].ToString() + ")</span></a></span>";
                }
                else
                {
                    category_list = category_list + "<li class='level0- level0 '> <span class='magicat-cat'><a href='" + url + "'><span>" + ds.Tables[0].Rows[i]["category"].ToString() + "</span></a></span>";
                }
                category = category + "<option value='" + (i + 1) + "'>" + ds.Tables[0].Rows[i]["category"].ToString() + "</option>";


                for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                {

                    string strProCount = strProdCount(ds1.Tables[0].Rows[j]["sub_category"].ToString()), cat_count = "";
                    if (strProCount != "0")
                    {
                        cat_count = "( " + strProCount + ")";
                    }
                    else
                    {
                        cat_count = "";
                    }
                    string subUrl = GetRouteUrl("SubCategory", new { SubCategoryName = seourl(ds1.Tables[0].Rows[j]["sub_category"].ToString()) });
                    if (j == 0 && ds1.Tables[0].Rows.Count != 1)
                    {
                        category_list = category_list + "<ul style='display: none;'><li class='first level1- level1 '> <span class='magicat-cat'><a href='" + subUrl + "'><span>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " " + cat_count + "</span></a></span></li>";//<div id='" + ds.Tables[0].Rows[i]["category"].ToString() + "-div' style='display:none'>" + "<ul><li><a href='" + subUrl + "' class=''>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " </a></li>";
                    }
                    else if (j == (ds1.Tables[0].Rows.Count - 1) && ds1.Tables[0].Rows.Count != 1)
                    {
                        category_list = category_list + "<li class='first level1- level1 '> <span class='magicat-cat'><a href='" + subUrl + "'><span>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " " + cat_count + "</span></a></span></li></ul>";
                    }
                    else if (ds1.Tables[0].Rows.Count == 1)
                    {
                        category_list = category_list + "<ul style='display: none;'><li class='first level1- level1 '> <span class='magicat-cat'><a href='" + subUrl + "'><span>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " " + cat_count + "</span></a></span></li></ul>";//<li><a href='" + subUrl + "' class=''>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " </a></li></ul>" + "</div>";
                    }
                    else
                    {
                        category_list = category_list + "<li class='first level1- level1 '> <span class='magicat-cat'><a href='" + subUrl + "'><span>" + ds1.Tables[0].Rows[j]["sub_category"].ToString() + " " + cat_count + "</span></a></span></li>";
                    }

                }

                category_list = category_list + "</li>";
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
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT product_name,small_image,price,discount_price,final_price,product_id FROM product_details where hotselling = 'Yes' order by id ASC ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ((ds.Tables[0].Rows.Count > 3) ? 3 : ds.Tables[0].Rows.Count); i++)
            {
                string url = GetRouteUrl("Product", new { ProductName = seourl(ds.Tables[0].Rows[i]["product_name"].ToString()) });
                //                Latest_Product = Latest_Product + @"<div class='media beta-sales-item'>
                //									<a class='pull-left' href='" + url + "'><img src='" + ds.Tables[0].Rows[i]["small_image"].ToString() + @"' alt=''></a>
                //									<div class='media-body'>
                //										<a href='" + url + @"'>" + ds.Tables[0].Rows[i]["product_name"].ToString() + @"</a><br/>
                //										<span class='beta-sales-price' style='color:#005387;'>" + ds.Tables[0].Rows[i]["final_price"].ToString() + @"</span>
                //									</div>
                //								</div>";
                Latest_Product = Latest_Product + @"<li class='item'> <a  class='product-image' title='" + ds.Tables[0].Rows[i]["product_name"].ToString() + @"' href='" + url + @"'><img style='padding:2px;border:1px solid #ccc' width='60' alt='" + ds.Tables[0].Rows[i]["product_name"].ToString() + @"' src='" + ds.Tables[0].Rows[i]["small_image"].ToString() + @"'></a>
                  <div class='product-details'>
                    <p class='product-name'> <a href='" + url + @"'>" + ds.Tables[0].Rows[i]["product_name"].ToString() + @"</a> </p>
                    <span class='price'>" + ds.Tables[0].Rows[i]["final_price"].ToString() + @"</span> </div>
                </li>";
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

    public string strProdCount(string Sub_category)
    {
        string strCount = "0";
        try
        {

            SqlCommand cmd = new SqlCommand("select count(product_name) as ProdCount from product_details where sub_category = '" + Sub_category + "'", con);

            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow oRow in ds1.Tables[0].Rows)
                {
                    strCount = Convert.ToString(oRow["ProdCount"]);
                }
            }
        }
        catch (Exception es)
        {

        }
        finally
        {

        }
        return strCount;

    }

    protected void btn_CBsubmit_Click(object sender, EventArgs e)
    {
        //productInfo obj = new productInfo();
        //productInfo sms = new productInfo();
        //sms.callMeBack(txt_CBname.Text, txt_CBmobileno.Text, txt_CBTime.Text);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ScriptKey", "alert('Your request has been submitted successfully.Our Representative will call you back.');window.location='Default.aspx'; ", true);
        //obj.queryRequest("1143", "abdul_123", txt_CBname.Text + " Requesting for callmeback on " + txt_CBmobileno.Text + " at time " + txt_CBTime.Text, sms.ISTINIDAtime().ToString(), "CallBack", "glutamart.com");
        //sms.ReplySMS(txt_CBmobileno.Text);
        //sendemail();
        //txt_CBTime.Text = "";
        //txt_CBname.Text = "";
        //txt_CBmobileno.Text = "";


    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["captcha"].ToString() == txtCaptcha.Text)
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
                q.name = txt_name.Text;
                q.postedOn = p.ISTINIDAtime().ToString();
                q.email = txt_email.Text;
                q.product = "";
                q.queryGuid = Guid.NewGuid().ToString();
                q.status = "open";
                q.type = "Open Query";
                q.website = "bunnybash.in";
                int rslt = p.QueryUs(q);
                if (rslt == 0)
                {
                    txt_email.Text = string.Empty;
                    txt_message.Text = string.Empty;
                    txt_mobile.Text = string.Empty;
                    txt_name.Text = string.Empty;
                    Response.Write("<script>alert('Query submitted successfully , our representative will get back to you soon !!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Something went wrong , please try again later !!');</script>");
                }
            }
            else
            {
                lbl_captcha.Text = "Invalid Captcha";
            }

        }
        catch (Exception ex)
        {
        }
        finally
        {

        }
    }
    protected void sendemail()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
            mail.CC.Add("honorajay@gmail.com");
            mail.Bcc.Add("shashi@nextwebi.in");

            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "beautyplushealth.in Call Back Request";


            string Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txt_CBname.Text + " Requesting for call back " + "<br/>" + "<br/>" + "<br/>" + "Regards:" + "<br/>" + "Name: " + Convert.ToString(txt_CBname.Text) + "<br/>" + "Contact No : " + Convert.ToString(txt_CBmobileno.Text) + "<br/>" + "Time of call : " + Convert.ToString(txt_CBTime.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "Beauty Plus Health" + "<br/>" + "http://beautyplushealth.in";
            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "relay-hosting.secureserver.net";
            smtp.Port = 25;
            //smtp.Credentials = new System.Net.NetworkCredential
            //     ("sales@beautyplushealth.in", "123456a$");

            //smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        catch (Exception es)
        {

        }
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
