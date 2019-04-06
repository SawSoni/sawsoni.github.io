using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;


public partial class Admin_Edit_Product_Deatils : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack==false)
        {
            PopulateCategory();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;

            string strproductID = ddl_product.SelectedItem.Value;
            cmd = new SqlCommand("update product_details set product_name=@product_name,price=@price,sort_desc=@sort_desc,full_desc=@full_desc,isfeatured=@isfeatured,page_title=@page_title,meta_keyword=@meta_keyword,meta_desc=@meta_desc,datetime=@datetime,other2=@other2,hotselling=@hotselling,stock=@stock,home_display_order=@home_display_order,product_idval=@product_idval,orderby=@orderby,other3=@other3 where product_id=@product_id", con);
            cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = strproductID;
            cmd.Parameters.Add("@product_name", SqlDbType.VarChar).Value = txt_productname.Text;
            cmd.Parameters.Add("@price", SqlDbType.VarChar).Value = txt_price.Text;
          //  cmd.Parameters.Add("@discount_price", SqlDbType.VarChar).Value = txt_discount_price.Text;
          //  cmd.Parameters.Add("@final_price", SqlDbType.VarChar).Value = txt_final_price.Text;
            cmd.Parameters.Add("@sort_desc", SqlDbType.VarChar).Value = txt_sort_desc.Text;
            cmd.Parameters.Add("@full_desc", SqlDbType.VarChar).Value = txt_full_desc.Content;
            cmd.Parameters.Add("@isfeatured", SqlDbType.VarChar).Value = txt_origin.Text;
            cmd.Parameters.Add("@hotselling", SqlDbType.VarChar).Value = txt_model.Text;
            cmd.Parameters.Add("@stock", SqlDbType.VarChar).Value = txt_Ingrediants.Text;
            cmd.Parameters.Add("@orderby", SqlDbType.VarChar).Value = txt_min_order.Text;
            cmd.Parameters.Add("@page_title", SqlDbType.VarChar).Value = txt_meta_title.Text;
            cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_meta_key.Text;
            cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_meta_desc.Text;
            cmd.Parameters.Add("@home_display_order", SqlDbType.VarChar).Value = txt_paymentterms.Text;
            cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = txt_brandname.Text;
            cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = txt_packaging.Text;
            cmd.Parameters.Add("@product_idval", SqlDbType.VarChar).Value = txt_productid.Text;
            cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = txt_deliveyTime.Text;
            //cmd.Parameters.Add("@supplier_guid", SqlDbType.VarChar).Value = ddl_supplier.SelectedItem.Value;



            con.Open();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Updated successfully');window.location='" + Request.RawUrl + "';", true);
            //lbl_success.Text = "Product information updated successfully..";

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

    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct category FROM product_details", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "category";
                ddl_category.DataValueField = "category";
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
            SqlCommand cmd = new SqlCommand("SELECT distinct sub_category FROM product_details where category='"+ ddl_category.SelectedItem.Text +"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_subcategory.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_subcategory.DataSource = ds.Tables[0];
                ddl_subcategory.DataTextField = "sub_category";
                ddl_subcategory.DataValueField = "sub_category";
                ddl_subcategory.DataBind();
                ddl_subcategory.Visible = true;
            }
            ddl_subcategory.Items.Insert(0, new ListItem("Select Sub Category", "Select Sub Category"));

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
            SqlCommand cmd = new SqlCommand("SELECT product_name,product_id FROM product_details where sub_category='" + ddl_subcategory.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_product.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_product.DataSource = ds.Tables[0];
                ddl_product.DataTextField = "product_name";
                ddl_product.DataValueField = "product_id";
                ddl_product.DataBind();
            }

            ddl_product.Items.Insert(0, new ListItem("Select Product", "Select Product"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }

    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateSubCategory();
       
    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            productInfo obj = new productInfo();
            if (FileUpload1.HasFile)
            {
                string fileExtension1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower());

                if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                {
                    string strproductID = ddl_product.SelectedItem.Value;
                    //FileUpload1.SaveAs(Server.MapPath(".") + "\\../product\\" + strproductID + "_small" + fileExtension1);
                    string SaveLocationSmall = Server.MapPath(".") + "\\../product\\" + strproductID + "_small" + fileExtension1;

                    System.Drawing.Bitmap bmpPostedImageSmall = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                    System.Drawing.Image objImageSmall = obj.ScaleImageSmall(bmpPostedImageSmall, 81);
                    objImageSmall.Save(SaveLocationSmall, ImageFormat.Png);
                    string SaveLocationBig = Server.MapPath(".") + "\\../product\\" + strproductID + "_big" + fileExtension1;

                    System.Drawing.Bitmap bmpPostedImageBig = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                    System.Drawing.Image objImageBig = obj.ScaleImageBig(bmpPostedImageBig, 81);
                    objImageBig.Save(SaveLocationBig, ImageFormat.Png);
                    string SaveLocationOther = Server.MapPath(".") + "\\../product\\" + strproductID + "_other" + fileExtension1;

                    System.Drawing.Bitmap bmpPostedImageOther = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                    System.Drawing.Image objImageOther = obj.other(bmpPostedImageOther, 81);
                    objImageOther.Save(SaveLocationOther, ImageFormat.Png);

                    cmd = new SqlCommand("update product_details set small_image = @small_image,big_image=@big_image,other=@other_image where product_id = @product_id", con);
                    cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = strproductID;
                    cmd.Parameters.Add("@small_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_small" + fileExtension1;
                    cmd.Parameters.Add("@big_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_big" + fileExtension1;
                    cmd.Parameters.Add("@other_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_other" + fileExtension1;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbl_added.Text = "New Small Image updated successfully..";

                }
                else
                {
                    lbl_added.Text = "Cannot accept files of this type. - System will accept only .gif, .png, .jpg, .jpeg";
                }
            }
            else
            {
                lbl_added.Text = "Please Select a Product image";
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
    protected void ddl_subcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
       PopulateProduct();
    }
    protected void ddl_product_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where product_id = @product_id", con);
            cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = ddl_product.SelectedItem.Value;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable oDt = new DataTable();
            oDt = ds.Tables[0];

            foreach (DataRow oRow in oDt.Rows)
            {

               // txt_discount_price.Text = Convert.ToString(oRow["discount_price"]);
              //  txt_final_price.Text = Convert.ToString(oRow["final_price"]);
                txt_full_desc.Content = Convert.ToString(oRow["full_desc"]);
                txt_meta_desc.Text = Convert.ToString(oRow["meta_desc"]);
                txt_meta_key.Text = Convert.ToString(oRow["meta_keyword"]);
                txt_meta_title.Text = Convert.ToString(oRow["page_title"]);
                txt_price.Text = Convert.ToString(oRow["price"]);
                txt_productname.Text = Convert.ToString(oRow["product_name"]);
                txt_sort_desc.Text = Convert.ToString(oRow["sort_desc"]);
                txt_brandname.Text = Convert.ToString(oRow["datetime"]);
                txt_origin.Text = Convert.ToString(oRow["isfeatured"]);
                txt_model.Text = Convert.ToString(oRow["hotselling"]);
                txt_Ingrediants.Text = Convert.ToString(oRow["stock"]);
                txt_productid.Text = Convert.ToString(oRow["product_idval"]);
                txt_packaging.Text = Convert.ToString(oRow["other2"]);
                txt_paymentterms.Text = Convert.ToString(oRow["home_display_order"]);
                txt_min_order.Text = Convert.ToString(oRow["orderby"]);
                txt_deliveyTime.Text = Convert.ToString(oRow["other3"]); 

                //txt_techspecs.Content = Convert.ToString(oRow["other2"]);

                //other details
                //if (Convert.ToString(oRow["isfeatured"]) == "Yes")
                //{
                //    chk_featured.Checked = true;
                //}
                //if (Convert.ToString(oRow["hotselling"]) == "Yes")
                //{
                //    chk_hotselling.Checked = true;
                //}
                //img_product_big.ImageUrl = "../" + Convert.ToString(oRow["big_image"]);
                img_product_small.ImageUrl = "../" + Convert.ToString(oRow["small_image"]);
            }

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
            PopulateCategory();
        }
    }
}