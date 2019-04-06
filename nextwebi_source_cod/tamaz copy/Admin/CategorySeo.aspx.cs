using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_CategorySeo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            con.Open();

            cmd = new SqlCommand("insert into category_seo values(@category_name,@category_id,@title,@meta_keyword,@meta_desc,@other,@other1,@other2)", con);
            cmd.Parameters.Add("@category_name", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text.Trim();
            cmd.Parameters.Add("@category_id", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txt_title.Text;
            cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_keyword.Text;
            cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_desc.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = txt_full_desc.Content;
            cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Category Description added successfully..";
            con.Close();
            txt_title.Text = "";
            txt_keyword.Text = "";
            txt_desc.Text = "";
            //Response.Redirect("add_new_category.aspx");

        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
}