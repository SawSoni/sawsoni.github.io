using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Admin_SubCategorySeo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Getcategory();
        }
    }

    protected void Getcategory()
    {
        try
        {
            DataSet ds = new DataSet();
          
            SqlCommand cmd = new SqlCommand("SELECT * FROM category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
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
        catch (Exception ee)
        {
            Response.Write(ee.Message);
        }
        finally
        {
           
        }
    }

    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
        
            SqlCommand cmd = new SqlCommand("SELECT distinct sub_category FROM sub_category where category = '" + ddl_category.SelectedItem.ToString() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);


            this.ddl_sub_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_sub_category.DataSource = ds.Tables[0];
                ddl_sub_category.DataTextField = "sub_category";
                ddl_sub_category.DataValueField = "sub_category";
                ddl_sub_category.DataBind();
            }
            ddl_sub_category.Items.Insert(0, new ListItem("Select Sub Category", "Select Sub Category"));

        }
        catch (Exception ee)
        {
            Response.Write(ee.Message);
        }
        finally
        {
          
        }
    }
  

    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            con.Open();

            cmd = new SqlCommand("insert into sub_category_seo values(@category_name,@sub_category_name,@category_id,@title,@meta_keyword,@meta_desc,@other,@other1,@other2)", con);
            cmd.Parameters.Add("@category_name", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Text.Trim();
            cmd.Parameters.Add("@sub_category_name", SqlDbType.VarChar).Value = ddl_sub_category.SelectedItem.Text.Trim();
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