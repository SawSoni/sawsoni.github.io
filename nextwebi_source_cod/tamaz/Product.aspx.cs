using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;
using System.Text;

public partial class Product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    public string product_name = string.Empty;
    public string image_popup = string.Empty;
    public string product_code = string.Empty;
    public string product_id = string.Empty;
    public string product_image = string.Empty;
    public string product_imagebig = string.Empty;
    public string product_price = string.Empty;
    public string product_dprice = string.Empty;
    public string product_fprice = string.Empty;
    public string addtocart1 = string.Empty;
    public string imagebig = string.Empty;
    public string desc = string.Empty;
    public string relatedProducts = string.Empty;
    public string product_category = string.Empty;
    public string anchorTag = string.Empty;
    public string multiImage = string.Empty;
    public string reviewVal = string.Empty;
    public string pbtn = string.Empty;
    public string techspecs = string.Empty;
    public string sortDesc = string.Empty;
    public string product_rating = string.Empty;
    public string reviewCount = string.Empty;
    public string ribbonTag = string.Empty;
    public string fb = string.Empty;
    public string strProductinfo = string.Empty;
    public string strProductShipping = string.Empty;
    public string StrProdCat = string.Empty;
    public string strSubCat = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {


        product_name = urlval(Convert.ToString(RouteData.Values["ProductName"]));
		if(product_name.Contains(".aspx"))
		{product_name  = product_name.Split('.')[0];
		}
        PopulateProduct();
        if (!IsPostBack)
        {
            FillCapctha();
            BindDDL(strSubCat);
            RelatedProducts(product_category);
        }


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
    protected void reviews(string productName)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM reviews where product_name='" + productName + "' and status='Approved' order by CAST(posted_date AS date) desc ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0].ToString() != "")
            {
                for (int i = 0; i < ((ds.Tables[0].Rows.Count < 4) ? ds.Tables[0].Rows.Count : 4); i++)
                {
                    reviewVal = reviewVal + @"<div id='review' runat='server' class='review-list'> <div class='author'><b>" + ds.Tables[0].Rows[i]["username"].ToString() + @"</b> on  " + ds.Tables[0].Rows[i]["posted_date"].ToString() + @"</div>
          <div class='rating-box' style='float:right'><div style='width:" + (int.Parse(ds.Tables[0].Rows[i]["rating"].ToString()) * 20) + @"%;float:left;' class='rating'></div></div>
          <div class='text'>" + ds.Tables[0].Rows[i]["your_review"].ToString() + @"</div></div>";
                    reviewCount = ds.Tables[0].Rows.Count.ToString();
                }
            }
        }
        catch
        {
        }
        finally
        {
            con.Close();
        }
    }
    protected void BindDDL(string strSubCategory)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from product_details where sub_category = @sub_category", con);
            cmd.Parameters.AddWithValue("@sub_category", SqlDbType.VarChar).Value = strSubCategory;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_products.DataSource = ds.Tables[0];
                ddl_products.DataValueField = "product_name";
                ddl_products.DataTextField = "product_name";
                ddl_products.DataBind();
            }

            ddl_products.Items.Insert(0, new ListItem("Select Product.", "Select Product."));
        }
        catch
        {

        }
        finally
        {
            con.Close();
        }

    }

    protected void RelatedProducts(string category)
    {
        try
        {
            /*
            
             */
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where category='" + category + "' order by isfeatured desc ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0].ToString() != "")
            {
                for (int i = 0; i < ((ds.Tables[0].Rows.Count < 5) ? ds.Tables[0].Rows.Count : 5); i++)
                {
                    //string ribbon = string.Empty;
                    //if (ds.Tables[0].Rows[i]["hotselling"].ToString() == "Yes")
                    //{
                    //    ribbon = "<div class='sale-label sale-top-right'><div class='ribbon-wrapper'><div class='ribbon sale'>Hot</div></div></div>";
                    //}
                    //else
                    //{
                    //    ribbon = "";
                    //}
                    productInfo pi = new productInfo();
                    //string price = string.Empty;
                    //if (Convert.ToString(ds.Tables[0].Rows[i]["final_price"]).ToLower() == "contact for price")
                    //{
                    //    price = "contact for price";

                    //}
                    //else
                    //{
                    //    price = pi.UnitPrice("INR", long.Parse(Convert.ToString(ds.Tables[0].Rows[i]["final_price"]))).ToString();
                    //}
                    string url = GetRouteUrl("Product", new { ProductName = seourl(ds.Tables[0].Rows[i]["product_name"].ToString()) });
                    relatedProducts = relatedProducts + @"<div class='item'>
                            <div class='col-item'>
                             
                              <div class='product-image-area' style='padding:10px; border:1px solid #ccc;'> <a class='product-image' title=' " + ds.Tables[0].Rows[i]["product_name"].ToString() + @"' href='" + url + "'> <img src='../" + ds.Tables[0].Rows[i]["big_image"].ToString() + @"' class='img-responsive' alt='" + ds.Tables[0].Rows[i]["product_name"].ToString() + @"' /> </a></div>
                              <div class='info'>
                                <div class='info-inner'>
                                  <div class='item-title'> <a href='#l' title=' " + ds.Tables[0].Rows[i]["product_name"].ToString() + "'> " + ds.Tables[0].Rows[i]["product_name"].ToString() + @" </a> </div>

                                </div>
                              
                                <div class='clearfix'> </div>
                              </div>
                            </div>
                          </div>";


                }
            }
        }
        catch
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
            SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where product_name='" + product_name + "' order by isfeatured desc ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {

                    strProductinfo = @" <div class='row '>
                    <div class='col-md-4'><p><b><span class='w125'>Place of Origin</span>:</b></p></div>
                     <div class='col-md-8'>" + row["isfeatured"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Brand Name</span>:</b></p></div><div class='col-md-8'>" + row["datetime"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Key Ingrediants</span>:</b></p></div><div class='col-md-8'>" + row["stock"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Model Number</span>:</b></p></div><div class='col-md-8'>" + row["hotselling"].ToString() + "</div></div>";

                    strProductShipping = @"<div class='row '><div class='col-md-4'><p><b><span class='w125'>Minimum Order Quantity:</span>:</b></p></div><div class='col-md-8'> " + row["orderby"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Packaging Details:</span>:</b></p></div><div class='col-md-8'>" + row["other2"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Delivery Time</span>:</b></p></div><div class='col-md-8'>" + row["other3"].ToString() + "</div></div><div class='row '><div class='col-md-4'><p><b><span class='w125'>Payment Terms</span>:</b></p></div><div class='col-md-8'>" + row["home_display_order"].ToString() + "</div></div>";

                    desc = row["full_desc"].ToString();
                    image_popup = "../" + row["big_image"].ToString();
                    anchorTag = "<div><a data-toggle='modal' href='#image_popup'> <img id='image' style='display: block;' src='../" + row["big_image"].ToString() + "' alt='" + row["product_name"].ToString() + "' title='' itemprop='image'> </a> </div>";
                    product_category = row["category"].ToString();

                    StrProdCat = "<h5 style='margin:0px;font-weight:bold;'><a href='../SubCategory/" + row["sub_category"].ToString() + "'>" + "View All " + row["sub_category"].ToString() + "</a></h5>";
                    strSubCat = row["sub_category"].ToString();


                    product_id = row["product_id"].ToString();
                    product_code = row["product_idval"].ToString();
                    product_name = row["product_name"].ToString();
                    product_image = "" + row["small_image"].ToString();
                    string product_imageZoom = "" + row["other"].ToString();
                    product_imagebig = "<img src='../" + row["big_image"].ToString() + "' alt=''/>";
                    product_price = row["price"].ToString();
                    product_dprice = row["discount_price"].ToString();
                    sortDesc = row["sort_desc"].ToString();
                    productInfo pi = new productInfo();

                    techspecs = row["other2"].ToString();
                    imagebig = "<img src='../" + product_imagebig + "' title='" + product_name + "' width='200px'; height='250px'; alt='#' id='image' />";
                    addtocart1 = "<input type='button' class='button' id='btn-" + product_id + "' value='Add to Cart' onclick='return false;' />";

                    product_rating = "<div style='width:" + (int.Parse(row["product_rating"].ToString()) * 20).ToString() + "%' class='rating'></div>";
                    //anchorTag = "<div><a data-toggle='modal' href='#pop_box' href='../" + Convert.ToString(RouteData.Values["ProductName"]) + "'> <img id='image' style='display: block;' src='../" + row["big_image"].ToString() + "' alt='' title='' itemprop='image'> </a> </div>";
                    Page.MetaDescription = row["meta_desc"].ToString();

                    HtmlMeta metakey = new HtmlMeta();
                    Page.Title = row["page_title"].ToString();
                    metakey.Name = "Keywords";
                    metakey.Content = row["meta_keyword"].ToString();
                    MetaPlaceHolder.Controls.Add(metakey);
                    HtmlMeta metaUrl = new HtmlMeta();
                    metaUrl.Attributes.Add("property", "og:url");
                    metaUrl.Content = "http://www.tamazglobal.com/Product/" + Convert.ToString(RouteData.Values["ProductName"]);
                    MetaPlaceHolder.Controls.Add(metaUrl);
                    HtmlMeta metaType = new HtmlMeta();
                    metaType.Attributes.Add("property", "og:type");
                    metaType.Content = "http://tamazglobal.com";
                    MetaPlaceHolder.Controls.Add(metaType);
                    HtmlMeta metaTitle = new HtmlMeta();
                    metaTitle.Attributes.Add("property", "og:title");
                    metaTitle.Content = row["page_title"].ToString();
                    MetaPlaceHolder.Controls.Add(metaTitle);
                    HtmlMeta metaDesc = new HtmlMeta();
                    metaDesc.Attributes.Add("property", "og:description");
                    metaDesc.Content = row["sort_desc"].ToString();
                    MetaPlaceHolder.Controls.Add(metaDesc);
                    HtmlMeta metaImage = new HtmlMeta();
                    metaImage.Attributes.Add("property", "og:image");
                    metaImage.Content = "../" + row["big_image"].ToString();
                    MetaPlaceHolder.Controls.Add(metaImage);

                    pbtn = "<button onClick='return false;' class='button button1 btn-cart' title='Add to Cart' type='button' id='btn-" + row["product_id"].ToString() + @" ' class='button1' onclick='return false;' value='Add to Cart'><span><i class='icon-basket'></i> Add to Cart</span></button>";
                    if (row["hotselling"].ToString() == "Yes")
                    {
                        ribbonTag = "<div class='new-label new-top-left'> Hot </div>";
                    }
                    else
                    {
                        ribbonTag = "";
                    }
                    fb = "<div class='fb-share-button' data-href='#' data-layout='button_count'></div>";
                    ////http://zofet.com/Product/"+Convert.ToString(RouteData.Values["ProductName"])+
                }

            }
            else
            {
                Response.Redirect("../ServerPage.html");
            }
            con.Close();
            con.Open();
            SqlCommand cmdMultiImage = new SqlCommand("SELECT * FROM multi_image where product_id='" + product_id + "' order by id desc ", con);
            SqlDataAdapter daMultiImage = new SqlDataAdapter(cmdMultiImage);
            DataSet dsMultiImage = new DataSet();
            daMultiImage.Fill(dsMultiImage);
            if (dsMultiImage.Tables[0].Rows.Count > 0 && dsMultiImage.Tables[0].Rows[0][0] != "")
            {
                for (int i = 0; i < ((dsMultiImage.Tables[0].Rows.Count > 4) ? 4 : dsMultiImage.Tables[0].Rows.Count); i++)
                {
                    multiImage = multiImage + "<a href='../" + dsMultiImage.Tables[0].Rows[i]["full_image"].ToString() + "' title='#' class='cloud-zoom-gallery' rel=\"useZoom: 'zoom1', smallImage: '../" + dsMultiImage.Tables[0].Rows[i]["big_image"].ToString() + "'\" ><img src='../" + dsMultiImage.Tables[0].Rows[i]["small_image"].ToString() + "' width='62' title='#' alt='#' /></a>";
                }
            }

        }
        catch (Exception)
        {

        }
        finally
        {
            con.Close();
        }
    }
    private string proName(string s)
    {
        string[] strArr = s.Split('-');
        string prodName = string.Empty;
        for (int i = 0; i < strArr.Length; i++)
        {
            if (prodName == "")
            {
                prodName = strArr[i];
            }
            else
            {
                prodName = prodName + " " + strArr[i];
            }
        }
        return prodName;
    }
    protected void btn_review_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            con.Open();
            productInfo myUtility = new productInfo();
            cmd = new SqlCommand("insert into reviews values(@product_name,@username,@your_review,@posted_date,@rating,@status,@other,@other1,@other2,@other3)", con);
            cmd.Parameters.Add("@product_name", SqlDbType.VarChar).Value = proName(RouteData.Values["ProductName"].ToString());
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txt_name.Text;
            cmd.Parameters.Add("@your_review", SqlDbType.VarChar).Value = txt_review.Text;
            cmd.Parameters.Add("@posted_date", SqlDbType.VarChar).Value = myUtility.ISTINIDAtime().ToString();
            cmd.Parameters.Add("@rating", SqlDbType.VarChar).Value = rating_hotel.CurrentRating;
            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "Pending";
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = "";
            cmd.ExecuteNonQuery();
            Label1.Text = "New Category added successfully..";
            con.Close();
            txt_name.Text = "";
            txt_review.Text = "";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
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
    protected void btn_order_Click(object sender, EventArgs e)
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
                q.name = txt_neme.Text;
                q.postedOn = p.ISTINIDAtime().ToString();
                q.email = txt_email.Text;
                q.product = product_name;
                q.queryGuid = Guid.NewGuid().ToString();
                q.status = "open";
                q.type = "Product";
                q.website = "tamazglobal.com";
                int rslt = p.QueryUs(q);
                if (rslt == 0)
                {
                    txt_email.Text = string.Empty;
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
    string Body = string.Empty;
    string message = string.Empty;

    protected void sendemail2222()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("sales@tamazglobal.com");
            mail.To.Add("honorajay@gmail.com");

            mail.From = new MailAddress("sales@tamazglobal.com");
            mail.Subject = "tamazglobal.com Query form";


            Body = "Dear Sir/Madam," + "<br/>" + "<br/>" + txtname.Text + " is Querying about " + urlval(Convert.ToString(RouteData.Values["ProductName"])) + " <br/>" + "<br/>" + "Regards:" + "<br/>" + "Contact No : " + Convert.ToString(txtmobile.Text) + "<br/>" + "Country : " + txtcountry.Text + "<br/>" + " City : " + Convert.ToString(txtcity.Text) + "<br/>" + " Message : " + Convert.ToString(txtmessge.Text) + "<br/><br/><br/>" + "Webmaster" + "<br/><br/>" + "Tamaz Global" + "<br/>" + "http://tamazglobal.com/";

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
            txtcountry.Text = "";
            txtcity.Text = "";
            txtemail.Text = "";
            ddl_quanty.ClearSelection();


        }
        catch (Exception es)
        {

            //lblsuccess.Text = "There is some problem please try after some time. Thank You!";
        }
    }


    protected void ddl_products_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect("http://google.com");
        if (ddl_products.SelectedIndex > 0)
        {
            Response.Redirect("../product/" + ddl_products.SelectedItem.Value);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please Select a Product.');", true);
        }
    }

    protected void btn_contact_Click(object sender, EventArgs e)
    {
        try
        {
            sendemail2222();
            Response.Write("<script>alert('Query submitted successfully , our representative will get back to you soon !!');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went wrong , please try again later !!');</script>");
        }
        finally
        {

        }
    }
    protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
    {
        FillCapctha();
    }
}