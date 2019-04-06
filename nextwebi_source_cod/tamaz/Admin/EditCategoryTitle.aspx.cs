using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_EditCategoryTitle : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SELECT category_name FROM category_seo", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.DropDownList1.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "category_name";
                DropDownList1.DataValueField = "category_name";
                DropDownList1.DataBind();
            }

            DropDownList1.Items.Insert(0, new ListItem("Select Category", "Select Category"));

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

            cmd = new SqlCommand("update category_seo set title=@title,meta_keyword=@meta_keyword,meta_desc=@meta_desc,other=@other where category_name='" + DropDownList1.SelectedItem.Text + "'", con);
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txt_title.Text;
            cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_keyword.Text;
            cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_desc.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = txt_full_desc.Content;
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Category Description added successfully..";
            con.Close();
            txt_title.Text = "";
            txt_keyword.Text = "";
            txt_desc.Text = "";
            txt_full_desc.Content = "";
            //Response.Redirect("add_new_category.aspx");

        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd;
        con.Open();

        cmd = new SqlCommand("select * from category_seo where category_name='" + DropDownList1.SelectedItem.Text + "'", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
         con.Close();
        txt_title.Text = ds.Tables[0].Rows[0]["title"].ToString();
        txt_keyword.Text = ds.Tables[0].Rows[0]["meta_keyword"].ToString();
        txt_desc.Text = ds.Tables[0].Rows[0]["meta_desc"].ToString();
        txt_full_desc.Content = ds.Tables[0].Rows[0]["other"].ToString();
    }
}