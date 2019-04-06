using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Data;
using System.Configuration;

public partial class Admin_AddImages : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            PopulateCategory();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       try
        {
            productInfo obj = new productInfo();
            SqlCommand cmd;

            if (FileUpload1.HasFile)
            {
                string fileExtension1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower());

                if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                {
                    con.Open();
                    SqlCommand cmdMultiImage = new SqlCommand("SELECT count(*) FROM multi_image where product_id='" + ddl_category.SelectedItem.Value + "' ", con);
            SqlDataAdapter daMultiImage = new SqlDataAdapter(cmdMultiImage);
            DataSet dsMultiImage = new DataSet();
            daMultiImage.Fill(dsMultiImage);
            if (dsMultiImage.Tables[0].Rows.Count > 0 && dsMultiImage.Tables[0].Rows[0][0] != "")
            {
                string strproductID = ddl_category.SelectedItem.Value;
                //FileUpload1.SaveAs(Server.MapPath(".") + "\\../product\\" + strproductID + "_small"+Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1);
                string SaveLocationSmall = Server.MapPath(".") + "\\../product\\" + strproductID + "_small" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;

                System.Drawing.Bitmap bmpPostedImageSmall = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                System.Drawing.Image objImageSmall = obj.ScaleImageSmall(bmpPostedImageSmall, 81);
                objImageSmall.Save(SaveLocationSmall, ImageFormat.Png);
                string SaveLocationBig = Server.MapPath(".") + "\\../product\\" + strproductID + "_big" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;

                System.Drawing.Bitmap bmpPostedImageBig = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                System.Drawing.Image objImageBig = obj.ScaleImageBig(bmpPostedImageBig, 81);
                objImageBig.Save(SaveLocationBig, ImageFormat.Png);

                string SaveOther = Server.MapPath(".") + "\\../product\\" + strproductID + "_other" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;

                System.Drawing.Bitmap bmpPostedOther = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                System.Drawing.Image objOther = obj.other(bmpPostedOther, 81);
                objOther.Save(SaveOther, ImageFormat.Png);
                con.Close();
                cmd = new SqlCommand("insert into multi_image values(@product_id,@small_image,@big_image,@full_image,@other,@other1,@other2)", con);
                cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = strproductID;
                cmd.Parameters.Add("@small_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_small" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;
                cmd.Parameters.Add("@big_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_big" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;
                cmd.Parameters.Add("@full_image", SqlDbType.VarChar).Value = "product/" + strproductID + "_other" + Convert.ToString(dsMultiImage.Tables[0].Rows[0][0]) + fileExtension1;
                cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "";
                cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
                cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
                con.Open();
                cmd.ExecuteNonQuery();
                lbl_added.Text = "Image updated successfully..";
            }
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
    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT product_name,product_id FROM product_details", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "product_name";
                ddl_category.DataValueField = "product_id";
                ddl_category.DataBind();
            }

            ddl_category.Items.Insert(0, new ListItem("Select Product", "Select Product"));

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
        //try
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where product_id = @product_id", con);
        //    cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Value;
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    DataTable oDt = new DataTable();
        //    oDt = ds.Tables[0];

        //    foreach (DataRow oRow in oDt.Rows)
        //    {

        //        ddl_product.Items.Add(oRow["product_name"].ToString());
        //     }

        //}
        //catch (Exception es)
        //{

        //}
        //finally
        //{
        //    con.Close();
        //}
    }
}