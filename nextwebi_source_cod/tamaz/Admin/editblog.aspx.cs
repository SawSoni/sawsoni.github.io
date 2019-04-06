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

public partial class Admin_editblog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    string blogId=string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddl_blogtitle_SelectedIndexChanged(object sender, EventArgs e)
    {
        populateBlog();
    }
    protected void populateBlog()
    {
        try
        {
            SqlCommand cmd;

            
                        //cmd = new SqlCommand("update blogs set title= @title,datetime=@datetime,postedby=@postedby,cont=@cont,other=@other,other1=@other1,other2=@other2,other3=@other3 where title='"+ddl_blogtitle.SelectedItem.Text+"'", con);
                        //cmd.Parameters.AddWithValue("@title", SqlDbType.VarChar).Value = txt_title.Text;
                        //cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = txt_postedon.Text;
                        //cmd.Parameters.Add("@postedby", SqlDbType.VarChar).Value = txt_postedby.Text;
                        //cmd.Parameters.Add("@cont", SqlDbType.VarChar).Value = txt_content.Content;
                        //cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = strProductImgID;
                        //cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "image/Blogs/" + strProductImgID + "_blog" + fileExtension1;
                        //cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = txt_pagetitle.Text;
                        //cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = txt_keywords.Text;

                        con.Open();
                        cmd = new SqlCommand("select * from blogs where title='" + ddl_blogtitle.SelectedItem.Text + "'", con);
                        DataSet dsEb=new DataSet();
                        SqlDataAdapter da=new SqlDataAdapter(cmd);
                        da.Fill(dsEb);
                        //lbl_success.Text = "Your Blog Posted successfully..";
                        txt_title.Text = dsEb.Tables[0].Rows[0]["title"].ToString();
                        txt_postedon.Text = dsEb.Tables[0].Rows[0]["datetime"].ToString();
                        txt_postedby.Text = dsEb.Tables[0].Rows[0]["postedby"].ToString();
                        txt_content.Content = dsEb.Tables[0].Rows[0]["cont"].ToString();
                        txt_keywords.Text = dsEb.Tables[0].Rows[0]["other2"].ToString();
                        txt_pagetitle.Text = dsEb.Tables[0].Rows[0]["other3"].ToString();
                        blogId = dsEb.Tables[0].Rows[0]["other2"].ToString();
                        img_product_small.ImageUrl = "../"+dsEb.Tables[0].Rows[0]["other1"].ToString();
            //        }
            //        else
            //        {
            //            lbl_success.Text = "Cannot accept files of this type. - System will accept only .gif, .png, .jpg, .jpeg";
            //        }
            //    }

            //}
            //else
            //{
            //    lbl_success.Text = "Please Select image for blog";
            //}

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
    protected void EditBlog()
    {
        try
        {
            SqlCommand cmd;

            
                        cmd = new SqlCommand("update blogs set title= @title,datetime=@datetime,postedby=@postedby,cont=@cont,other2=@other2,other3=@other3 where title='" + ddl_blogtitle.SelectedItem.Text + "'", con);
                        cmd.Parameters.AddWithValue("@title", SqlDbType.VarChar).Value = txt_title.Text;
                        cmd.Parameters.Add("@datetime", SqlDbType.VarChar).Value = txt_postedon.Text;
                        cmd.Parameters.Add("@postedby", SqlDbType.VarChar).Value = txt_postedby.Text;
                        cmd.Parameters.Add("@cont", SqlDbType.VarChar).Value = txt_content.Content;
                        cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = txt_pagetitle.Text;
                        cmd.Parameters.Add("@other3", SqlDbType.VarChar).Value = txt_keywords.Text;

                        con.Open();
                        cmd.ExecuteNonQuery();
                        lbl_success.Text = "Blog Updated successfully..";
                        txt_title.Text = string.Empty;
                        txt_postedon.Text = string.Empty;
                        txt_postedby.Text = string.Empty;
                        txt_content.Content = string.Empty;
                        txt_keywords.Text = string.Empty;
                        txt_pagetitle.Text = string.Empty;


                   
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
        EditBlog();
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
                int fileSizeBig = FileUpload1.PostedFile.ContentLength;
                if (1 == 1)
                {
                    if ((fileExtension1 == ".jpg" || fileExtension1 == ".jpeg" || fileExtension1 == ".png" || fileExtension1 == ".gif"))
                    {
                        string strProductImgID = blogId;
                        string SaveLocationBlog = Server.MapPath(".") + "\\../image\\Blogs\\" + strProductImgID + "_blog" + fileExtension1;

                        System.Drawing.Bitmap bmpPostedImageBlog = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);
                        System.Drawing.Image objImageBlog = obj.ScaleImageBlog(bmpPostedImageBlog, 81);
                        objImageBlog.Save(SaveLocationBlog, ImageFormat.Png);

                        cmd = new SqlCommand("update blogs set other1 = @other1 where title = @title", con);
                        cmd.Parameters.AddWithValue("@other1", SqlDbType.VarChar).Value = "image/Blogs/" + strProductImgID + "_blog" + fileExtension1;
                        cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = ddl_blogtitle.SelectedItem.Text;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lbl_added.Text = "New Image updated successfully..";

                    }
                    else
                    {
                        lbl_added.Text = "Cannot accept files of this type. - System will accept only .gif, .png, .jpg, .jpeg";
                    }
                }
                

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
}