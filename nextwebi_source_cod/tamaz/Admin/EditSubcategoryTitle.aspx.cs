using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Admin_EditSubcategoryTitle : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCategory();

        }
    }

    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct category FROM category", con);
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
            SqlCommand cmd = new SqlCommand("SELECT distinct sub_category_name FROM sub_category_seo where category_name = '" + ddl_category.SelectedItem.ToString() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_sub_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_sub_category.DataSource = ds.Tables[0];
                ddl_sub_category.DataTextField = "sub_category_name";
                ddl_sub_category.DataValueField = "sub_category_name";
                ddl_sub_category.DataBind();
            }

            ddl_sub_category.Items.Insert(0, new ListItem("Select Sub Category", "Select Sub Category"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }


    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            con.Open();

            cmd = new SqlCommand("update sub_category_seo set title=@title,meta_keyword=@meta_keyword,meta_desc=@meta_desc,other=@other where sub_category_name='" + ddl_sub_category.SelectedItem.Text + "'", con);
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txt_title.Text;
            cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_keyword.Text;
            cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_desc.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = txt_full_desc.Content;
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Sub Category Description added successfully..";
            con.Close();
            txt_title.Text = "";
            txt_keyword.Text = "";
            txt_desc.Text = "";
            txt_full_desc.Content = "";
            ddl_sub_category.ClearSelection();
            ddl_category.ClearSelection();

        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateSubCategory();
    }
    protected void ddl_sub_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd;

        cmd = new SqlCommand("select * from sub_category_seo where sub_category_name='" + ddl_sub_category.SelectedItem.Text + "'", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {

            txt_title.Text = ds.Tables[0].Rows[0]["title"].ToString();
            txt_keyword.Text = ds.Tables[0].Rows[0]["meta_keyword"].ToString();
            txt_desc.Text = ds.Tables[0].Rows[0]["meta_desc"].ToString();
            txt_full_desc.Content = ds.Tables[0].Rows[0]["other"].ToString();
        }
    }
}