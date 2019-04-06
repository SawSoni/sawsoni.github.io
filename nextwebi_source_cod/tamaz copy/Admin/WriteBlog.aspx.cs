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

public partial class Admin_WriteBlog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region Get New Generate Blog ID
    public string GenerateBlogID()
    {
        string Str_id = string.Empty;

        try
        {
            int temp = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Max(id) as stdid from blogs", con);
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
    protected void WriteBlog()
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
                        string strProductImgID = GenerateBlogID();
                        string SaveLocationBlog = Server.MapPath(".") + "\\../images\\Blog\\" + strProductImgID + "_blog" + fileExtension1;

                        System.Drawing.Bitmap bmpPostedImageBlog = new System.Drawing.Bitmap(fileupload_small.PostedFile.InputStream);
                        System.Drawing.Image objImageBlog = obj.ScaleImageBlog(bmpPostedImageBlog, 81);
                        objImageBlog.Save(SaveLocationBlog, ImageFormat.Png);


                        cmd = new SqlCommand("insert into blogs values(@title,@datetime,@postedby,@cont,@other,@other1,@other2,@other3)", con);
                        cmd.Parameters.AddWithValue("@title", SqlDbType.VarChar).Value = txt_title.Text;
                        cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = txt_postedon.Text;
                        cmd.Parameters.Add("@postedby", SqlDbType.VarChar).Value = txt_postedby.Text;
                        cmd.Parameters.Add("@cont", SqlDbType.VarChar).Value = txt_content.Content;
                        cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = strProductImgID;
                        cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "image/Blogs/" + strProductImgID + "_blog" + fileExtension1;
                        cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = txt_pagetitle.Text;
                        cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = txt_keywords.Text;
                        
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lbl_success.Text = "Your Blog Posted successfully..";
                        txt_title.Text = string.Empty;
                        txt_postedon.Text = string.Empty;
                        txt_postedby.Text = string.Empty;
                        txt_content.Content = string.Empty;
                        txt_keywords.Text = string.Empty;
                        txt_pagetitle.Text = string.Empty;
                        

                    }
                    else
                    {
                        lbl_success.Text = "Cannot accept files of this type. - System will accept only .gif, .png, .jpg, .jpeg";
                    }
                }
                
            }
            else
            {
                lbl_success.Text = "Please Select image for blog";
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        WriteBlog();
    }
}