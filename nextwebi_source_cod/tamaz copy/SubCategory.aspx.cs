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

public partial class SubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    public string category = string.Empty;
    public string subCategory = string.Empty;
    public string productlist = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //string[] str = RouteData.Values["CategoryName"].ToString().Split('.');
        category = urlval(Convert.ToString(RouteData.Values["CategoryName"]));
        subCategory = urlval(Convert.ToString(RouteData.Values["SubCategoryName"]));
        if (subCategory.Contains(".aspx"))
        {
            subCategory = subCategory.Split('.')[0];
        }
        PopulateProduct();
        PopulatePageDetails();
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

    protected void PopulatePageDetails()
    {
        try
        {
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM sub_category_seo where sub_category_name='" + subCategory + "' ", con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            string strCatDesc = string.Empty;
            if (ds1.Tables[0].Rows.Count > 0 && Convert.ToString(ds1.Tables[0].Rows[0][0]) != "")
            {
                Page.Title = Convert.ToString(ds1.Tables[0].Rows[0]["title"]); ;
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
    protected void PopulateProduct()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where sub_category='" + subCategory + "'  order by cast(other_sort as int)  ASC ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int j = 0;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string url = "Product/" + seourl(Convert.ToString(ds.Tables[0].Rows[i]["product_name"]));

                //fp.name = Convert.ToString(ds.Tables[0].Rows[i]["product_name"]);
                //fp.id = long.Parse(Convert.ToString(ds.Tables[0].Rows[i]["id"]));
                //fp.guid = Convert.ToString(ds.Tables[0].Rows[i]["product_id"]);
                //fp.finalPrice = Convert.ToString(ds.Tables[0].Rows[i]["final_price"]);
                //fp.image = Convert.ToString(ds.Tables[0].Rows[i]["big_image"]);
                //fp.rating = int.Parse(Convert.ToString(ds.Tables[0].Rows[i]["product_rating"]));
                //fp.hotSelling = Convert.ToString(ds.Tables[0].Rows[i]["sort_desc"]);
                //fp.url = url;

                string ribbon = string.Empty;
                if (ds.Tables[0].Rows[i]["hotselling"].ToString() == "Yes")
                {
                    ribbon = "<div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div>";
                }
                else
                {
                    ribbon = "";
                }

                if (i % 3 == 0 || i == 0)
                {
                    productlist = productlist + " <div class='products-grid'>";
                }
                productlist += "<div class='row'><div class='item col-lg-12 col-md-3 col-sm-12 col-xs-12'><div class='col-item'><div  class='product-image-area' style='background:#f5f5f5;border:1px solid #dcdcdc;'><div class='col-md-3' style='padding:0px;'> <a class='product-image' title='" + ds.Tables[0].Rows[i]["product_name"] + "' href='../" + url + "'> <img src='../" + ds.Tables[0].Rows[i]["big_image"] + "' class='img-responsive' alt='" + ds.Tables[0].Rows[i]["product_name"] + "' /> </a></div><div class='col-md-9'><div class='info' style='height:auto;border:none;background:#f5f5f5;text-align:left;'><div class='info-inner'><div class='item-title' style='text-align:left;padding-top:10px;'><h2><a title=' " + ds.Tables[0].Rows[i]["product_name"] + "' href='../" + url + "'> " + ds.Tables[0].Rows[i]["product_name"] + " </a></h2> </div><div class='item-content'><div class='price-box'><p class='special-price'> " + ds.Tables[0].Rows[i]["sort_desc"] + " </p><div class='btn-home w110' ><a data-toggle='modal' href='#pop_box1'>Contact Us</a></div></div></div></div></div></div><div class='actions'></div><div class='clearfix'> </div></div></div></div></div>";

                if (i % 3 == 2 || (i + 1) == ds.Tables[0].Rows.Count)
                {
                    productlist = productlist + "</div>";
                }

                //if (((i + 1) % 3 == 1 || i == 0) && i != 1)
                //{
                //    productlist = productlist + "<div class='row'>";
                //}
                //string url = GetRouteUrl("Product", new { ProductName = seourl(ds.Tables[0].Rows[i]["product_name"].ToString()) });
                //productlist = productlist + "<div class='col-sm-4 '><div class='single-item'  style='border:1px solid #ccc; padding:10px; text-align:center;'>" + ribbon + "<div class='single-item-header' ><a href='" + url + "'><img src='../" + ds.Tables[0].Rows[i]["big_image"].ToString() + "' alt=''></a></div><div class='single-item-body'><p class='single-item-title' style='text-align:center;  padding-top:10px'>" + ds.Tables[0].Rows[i]["product_name"].ToString() + "</p><p class='single-item-price' style='text-align:center; color:#8C1C40; padding-top:10px'><span>" + ds.Tables[0].Rows[i]["final_price"].ToString() + "</span></p></div><div class='single-item-caption' style='text-align:center; padding-top:10px; '><input type='button'class='button beta-btn primary beta-btn-small' id='btn-" + ds.Tables[0].Rows[i][0].ToString() + " ' class='button' onclick='return false;' value='Add to Cart'/><div class='clearfix'></div></div></div></div>";
                //if ((i + 1) % 3 == 0 && i != 0)
                //{
                //    productlist = productlist + "</div><div class='space40'>&nbsp;</div>";
                //}
                //j = i + 1;
            }
            if (j % 3 != 0 && j != 0)
            {
                productlist = productlist + "</div><div class='space40'>&nbsp;</div>";
            }
            //    SqlCommand cmd1 = new SqlCommand("SELECT title,meta_keyword,meta_desc,other FROM category_seo where category_name='" + category + "'  ", con);
            //    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            //    DataSet ds1 = new DataSet();
            //    da1.Fill(ds1);
            //    string strCatDesc = string.Empty;
            //    if (ds1.Tables[0].Rows.Count > 0 && Convert.ToString(ds1.Tables[0].Rows[0][0]) != "")
            //    {
            //        //Request.QueryString["id"].ToString().Trim();
            //        Page.Title = Convert.ToString(ds1.Tables[0].Rows[0]["title"]);
            //        HtmlMeta metakey = new HtmlMeta();
            //        metakey.Name = "Keywords";
            //        metakey.Content = Convert.ToString(ds1.Tables[0].Rows[0]["meta_keyword"]);
            //        MetaPlaceHolder.Controls.Add(metakey);
            //        HtmlMeta metadesc = new HtmlMeta();
            //        metadesc.Name = "Description";
            //        metadesc.Content = Convert.ToString(ds1.Tables[0].Rows[0]["meta_desc"]);
            //        MetaPlaceHolder.Controls.Add(metadesc);
            //        strCatDesc = Convert.ToString(ds1.Tables[0].Rows[0]["other"]);
            //    }
            //    if (strCatDesc.Length > 10)
            //    {
            //        categoryDesc.InnerHtml = strCatDesc;

            //    }
            //    else
            //    {
            //        categoryDesc.Visible = false;
            //    }
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

    protected int sendemail2222()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
            mail.To.Add("honorajay@gmail.com");
            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "tamazglobal.com Query form product list page";


            Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txtname.Text + " is Querying about " + subCategory + " <br/>" + "<br/>" + "Regards:" + "<br/>" + "Contact No : " + Convert.ToString(txtmobile.Text) + "<br/>" + "Email Id : " + Convert.ToString(txtemail.Text) + "<br/>" + "Quantity : " + Convert.ToString(ddl_quanty.SelectedItem.Text) + "<br/>" + "Country : " + txtcountry.Text + "<br/>" + " City : " + Convert.ToString(txtcity.Text) + "<br/>" + " Message : " + Convert.ToString(txtmessge.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "Tamaz Global" + "<br/>" + "http://tamazglobal.com/";

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