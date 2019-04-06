using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_brands : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    public string img = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            GetCategory();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        addnewcategory();
    }

    public void imagecompress(Bitmap original_image, string tmguid, int height, int width)
    {
        string extension = Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower());
        Bitmap final_image = null;
        Graphics graphic = null;
        final_image = new Bitmap(width, height);
        graphic = Graphics.FromImage(final_image);
        graphic.DrawImage(original_image, 0, 0, width, height);
        final_image.Save(MapPath("..") + ("\\product\\" + tmguid + "_Treg" + extension));
        if (graphic != null) graphic.Dispose();
        if (original_image != null) original_image.Dispose();
        if (final_image != null) final_image.Dispose();
    }

    protected void GetCategory()
    {
        try
        {
            string query = "Select * from brands where id='" + Request.QueryString["id"] + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                btn_submit.Text = "Update";
                txt_category.Text = dt.Rows[0]["brand_name"].ToString();
                txt_category.Enabled = false;
                img = "<img alt='' style='height=100px' src='../" + dt.Rows[0]["img_path"].ToString() + "' />";
            }
            else
            {
                txt_category.Enabled = true; ;
            }

        }
        catch (Exception exx)
        {

        }
    }

    protected void addnewcategory()
    {
        try
        {
            if (btn_submit.Text == "Update")
            {
              

                string strImgGuid = Guid.NewGuid().ToString();
                string fileExtension1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower());
                if (FileUpload1.HasFile)
                {
                    if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                    {
                        Bitmap original_image = new Bitmap(FileUpload1.FileContent);
                        imagecompress(original_image, strImgGuid, 140, 263);
                    }
                                      

                    SqlCommand cmd;
                    cmd = new SqlCommand("Update brands set img_path=@img_path Where id='" + Request.QueryString["id"] + "'", con);
                    cmd.Parameters.Add("@img_path", SqlDbType.VarChar).Value = "product/" + strImgGuid + "_Treg" + fileExtension1;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Category SuccessFully Added ! ');window.location='" + Request.RawUrl + "';", true);
                }
            }
            else
            {
                string strImgGuid = Guid.NewGuid().ToString();
                string fileExtension1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower());
                if (FileUpload1.HasFile)
                {
                    if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                    {
                        Bitmap original_image = new Bitmap(FileUpload1.FileContent);
                        imagecompress(original_image, strImgGuid, 140, 263);
                    }

                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into brands(brand_guid,brand_name, order_id,img_path) values(@brand_guid,@brand_name,@order_id,@img_path)", con);
                    cmd.Parameters.Add("@brand_guid", SqlDbType.VarChar).Value = Guid.NewGuid().ToString();
                    cmd.Parameters.Add("@brand_name", SqlDbType.VarChar).Value = txt_category.Text;
                    cmd.Parameters.Add("@order_id", SqlDbType.VarChar).Value = "0";
                    cmd.Parameters.Add("@img_path", SqlDbType.VarChar).Value = "product/" + strImgGuid + "_Treg" + fileExtension1;
                    cmd.ExecuteNonQuery();
                    Label1.Text = "New Category added successfully..";
                    con.Close();
                    txt_category.Text = "";
                    //Response.Redirect("add_new_category.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
}