using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;


public partial class Admin_add_new_product : System.Web.UI.Page
{
    productInfo obj = new productInfo();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            PopulateCategory();
            PopulateSupplier();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        AddNewProduct();
        ClearData();
    }
    string subCategory = string.Empty;
    static int subCategoryFlag = 0;
    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,category FROM category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "category";
                ddl_category.DataValueField = "id";
                ddl_category.DataBind();
            }

            ddl_category.Items.Insert(0, new ListItem("Select Category", "Select Category"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }
    protected void PopulateSubCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,sub_category FROM sub_category where category_id='"+ddl_category.SelectedItem.Value+"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_subcategory.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_subcategory.DataSource = ds.Tables[0];
                ddl_subcategory.DataTextField = "sub_category";
                ddl_subcategory.DataValueField = "id";
                ddl_subcategory.DataBind();
                ddl_subcategory.Visible = true;
                subCategoryFlag = 1;
            }
            else
            {
                ddl_subcategory.Visible = false;
                subCategoryFlag = 1;
            }
            ddl_subcategory.Items.Insert(0, new ListItem("Select Sub Category", "Select Sub Category"));

        }
        catch (Exception es)
        {
            ddl_subcategory.Visible = false;
            subCategoryFlag = 1;
        }
        finally
        {
            con.Close();
        }
    }
    protected void PopulateSupplier()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT supplier_name,supplier_guid FROM supplier_master order by supplier_name", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_supplier.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_supplier.DataSource = ds.Tables[0];
                ddl_supplier.DataTextField = "supplier_name";
                ddl_supplier.DataValueField = "supplier_guid";
                ddl_supplier.DataBind();
                ddl_supplier.Visible = true;
               
            }
            else
            {
                //ddl_supplier.Visible = false;
                //subCategoryFlag = 1;
            }
            ddl_supplier.Items.Insert(0, new ListItem("Select Supplier", "Select Supplier"));

        }
        catch (Exception es)
        {
            //ddl_subcategory.Visible = false;
            //subCategoryFlag = 1;
        }
        finally
        {
            con.Close();
        }
    }
    public string GetSubCategory()
    {
        if (subCategoryFlag == 1)
        {
            subCategory = ddl_subcategory.SelectedItem.Text;
        }
        else
        {
            subCategory = "";
        }
        return subCategory;
    }

        #region Get New Generate Hotel ID
                                                                                                                                                            public string GenerateProductID()
    {
        string Str_id = string.Empty;

        try
        {
            int temp = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Max(product_id) as stdid from product_details", con);
            cmd.CommandType = CommandType.Text;
            int id;
            if (!Convert.IsDBNull(cmd.ExecuteScalar()))
            {
                id = Convert.ToInt32(cmd.ExecuteScalar());
            }
            else
            {
                id = 100;
            }
            if (id.ToString() != "")
            {
                temp = id + 1;
            }
            else
            {
                temp = +0111;
            }
            Str_id = temp.ToString();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        return Str_id;
    }
        #endregion
    Random rnd=new Random();
    protected void AddNewProduct()
    {
        try
        {
            SqlCommand cmd;
            productInfo obj = new productInfo();
            if (fileupload_small.HasFile)
            {
                string fileExtension1 = System.IO.Path.GetExtension(fileupload_small.PostedFile.FileName.ToLower());
                int fileSizeBig = fileupload_small.PostedFile.ContentLength;
                if (1 == 1)
                {
                    if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                    {
                        string strProductImgID = DateTime.Now.ToString("MMyyyyddhhmmss")+rnd.Next(100,999).ToString();
                        string SaveLocationSmall = Server.MapPath(".") + "\\../product\\" + strProductImgID + "_small" + fileExtension1;

                        System.Drawing.Bitmap bmpPostedImageSmall = new System.Drawing.Bitmap(fileupload_small.PostedFile.InputStream);
                        System.Drawing.Image objImageSmall = obj.ScaleImageSmall(bmpPostedImageSmall, 81);
                        objImageSmall.Save(SaveLocationSmall, ImageFormat.Png);
                        string SaveLocationBig = Server.MapPath(".") + "\\../product\\" + strProductImgID + "_big" + fileExtension1;

                        System.Drawing.Bitmap bmpPostedImageBig = new System.Drawing.Bitmap(fileupload_small.PostedFile.InputStream);
                        System.Drawing.Image objImageBig = obj.ScaleImageBig(bmpPostedImageBig, 81);
                        objImageBig.Save(SaveLocationBig, ImageFormat.Png);
                        string SaveLocationOther = Server.MapPath(".") + "\\../product\\" + strProductImgID + "_other" + fileExtension1;

                        System.Drawing.Bitmap bmpPostedImageOther = new System.Drawing.Bitmap(fileupload_small.PostedFile.InputStream);
                        System.Drawing.Image objImageOther = obj.other(bmpPostedImageOther, 81);
                        objImageOther.Save(SaveLocationOther, ImageFormat.Png);

                        cmd = new SqlCommand("insert into product_details(category,product_id,product_name,price,discount_price,final_price,sort_desc,full_desc,small_image,big_image,isfeatured,page_title,meta_keyword,meta_desc,other,datetime,stock,hotselling,orderby,other2,other3,home_display_order,product_rating,sub_category,product_idval,supplier_guid,category_order_value) values(@category,@product_id,@product_name,@price,@discount_price,@final_price,@sort_desc,@full_desc,@small_image,@big_image,@isfeatured,@page_title,@meta_keyword,@meta_desc,@other,@datetime,@stock,@hotselling,@orderby,@other2,@other3,@home_display_order,@product_rating,@sub_category,@product_idval,@supplier_guid,@category_order_value)", con);
                        cmd.Parameters.AddWithValue("@category", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Text;
                        cmd.Parameters.Add("@product_id", SqlDbType.VarChar).Value = strProductImgID;
                        cmd.Parameters.Add("@product_name", SqlDbType.VarChar).Value = txt_productname.Text;
                        cmd.Parameters.Add("@price", SqlDbType.VarChar).Value = txt_price.Text;
                        cmd.Parameters.Add("@discount_price", SqlDbType.VarChar).Value = txt_discount_price.Text;
                        cmd.Parameters.Add("@final_price", SqlDbType.VarChar).Value = txt_final_price.Text;
                        cmd.Parameters.Add("@sort_desc", SqlDbType.VarChar).Value = txt_sort_desc.Text;
                        cmd.Parameters.Add("@full_desc", SqlDbType.VarChar).Value = txt_full_desc.Content;
                        cmd.Parameters.Add("@small_image", SqlDbType.VarChar).Value = "product/" + strProductImgID + "_small" + fileExtension1;
                        cmd.Parameters.Add("@big_image", SqlDbType.VarChar).Value = "product/" + strProductImgID + "_big" + fileExtension1;
                        cmd.Parameters.Add("@page_title", SqlDbType.VarChar).Value = txt_meta_title.Text; 
                        cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_meta_key.Text;
                        cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_meta_desc.Text;
                        cmd.Parameters.Add("@isfeatured", SqlDbType.VarChar).Value = chk_featured.Checked ? "Yes" : "No";
                        cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "product/" + strProductImgID + "_other" + fileExtension1; ;
                        cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = obj.ISTINIDAtime().ToString();
                        cmd.Parameters.Add("@stock", SqlDbType.VarChar).Value = "1000";
                        cmd.Parameters.Add("@hotselling", SqlDbType.VarChar).Value = chk_hoteselling.Checked ? "Yes" : "No";
                        cmd.Parameters.Add("@orderby", SqlDbType.VarChar).Value = "1";
                        cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = ""; /// txt_techspec.Content;
                        cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = "NA3";
                        cmd.Parameters.Add("@home_display_order", SqlDbType.VarChar).Value = "100";
                        cmd.Parameters.Add("@product_rating", SqlDbType.VarChar).Value = "5";
                        cmd.Parameters.Add("@sub_category", SqlDbType.VarChar).Value = GetSubCategory();
                        cmd.Parameters.Add("@product_idval", SqlDbType.VarChar).Value = txt_productid.Text;
                        cmd.Parameters.Add("@supplier_guid", SqlDbType.VarChar).Value = ddl_supplier.SelectedItem.Value;
                        cmd.Parameters.Add("@category_order_value", SqlDbType.VarChar).Value = "100";
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lbl_success.Text = "New Product added successfully..";

                    }
                    else
                    {
                        lbl_success.Text = "Cannot accept files of this type. - System will accept only .gif, .png, .jpg, .jpeg";
                    }
                }
                else
                {
                    lbl_success.Text = "File size should be less then 2MB";
                }
            }
            else
            {
                lbl_success.Text = "Please Select a product image";
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
    }


    protected void ClearData()
    {
        txt_productname.Text = "";
        txt_sort_desc.Text = "";
        txt_price.Text = "";
        txt_full_desc.Content = "";
        txt_final_price.Text = "";
        txt_discount_price.Text = "";
        txt_meta_desc.Text = "";
        txt_meta_key.Text = "";
        txt_meta_title.Text = "";
        txt_productid.Text = string.Empty;

    }

    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateSubCategory();
    }
}