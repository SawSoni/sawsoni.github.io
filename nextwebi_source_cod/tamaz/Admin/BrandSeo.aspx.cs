using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_BrandSeo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetBrands();

        }
    }
    public void GetBrands()
    {
        try
        {
            string queryseo = "Select distinct brand_guid, brand_name from brands ";
            SqlCommand cmdseo = new SqlCommand(queryseo, con);
            SqlDataAdapter sdaseo = new SqlDataAdapter(cmdseo);
            DataTable dtseo = new DataTable();
            sdaseo.Fill(dtseo);
            if (dtseo.Rows.Count > 0)
            {
                DropDownList1.Items.Clear();
                DropDownList1.DataSource = dtseo;
                DropDownList1.DataTextField = "brand_name";
                DropDownList1.DataValueField = "brand_guid";
                DropDownList1.DataBind();
            }
            DropDownList1.Items.Insert(0, new ListItem("Select Brand", ""));
        }
        catch (Exception ex)
        {

        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {

            if (btn_save.Text == "Update")
            {
                SqlCommand cmd = new SqlCommand("Update top_brands_seo set title=@title,meta_keyword=@meta_keyword,meta_desc=@meta_desc,other=@other,other1=@other1,other2=@other2 where brand_guid='" + DropDownList1.SelectedValue.ToString() + "'", con);
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txt_title.Text;
                cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_keyword.Text;
                cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_desc.Text;
                cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = txt_full_desc.Content;
                cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
                cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
                con.Open();
                cmd.ExecuteNonQuery();
                lbl_success.Text = "SEO details updated successfully..";
                con.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into top_brands_seo values(@brand_name,@brand_guid,@title,@meta_keyword,@meta_desc,@other,@other1,@other2)", con);
                cmd.Parameters.Add("@brand_name", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text.Trim();
                cmd.Parameters.Add("@brand_guid", SqlDbType.VarChar).Value = DropDownList1.SelectedValue.ToString().Trim();
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = txt_title.Text;
                cmd.Parameters.Add("@meta_keyword", SqlDbType.VarChar).Value = txt_keyword.Text;
                cmd.Parameters.Add("@meta_desc", SqlDbType.VarChar).Value = txt_desc.Text;
                cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = txt_full_desc.Content;
                cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
                cmd.Parameters.Add("@other2", SqlDbType.VarChar).Value = "";
                con.Open();
                cmd.ExecuteNonQuery();
                lbl_success.Text = "SEO details added successfully..";
                con.Close();
                txt_title.Text = "";
                txt_keyword.Text = "";
                txt_desc.Text = "";
                DropDownList1.ClearSelection();
                //Response.Redirect("add_new_category.aspx");
            }
        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
    public void GetSeo()
    {
        try
        {
            string queryseo = "Select * from top_brands_seo where brand_guid='" + DropDownList1.SelectedValue.ToString() + "'";
            SqlCommand cmdseo = new SqlCommand(queryseo, con);
            SqlDataAdapter sdaseo = new SqlDataAdapter(cmdseo);
            DataTable dtseo = new DataTable();
            sdaseo.Fill(dtseo);
            if (dtseo.Rows.Count > 0)
            {
                txt_desc.Text = Convert.ToString(dtseo.Rows[0]["meta_desc"]);
                txt_full_desc.Content = Convert.ToString(dtseo.Rows[0]["other"]);
                txt_keyword.Text = Convert.ToString(dtseo.Rows[0]["meta_keyword"]);
                txt_title.Text = Convert.ToString(dtseo.Rows[0]["title"]);
                btn_save.Text = "Update";
            }
            else
            {
                txt_title.Text = "";
                txt_keyword.Text = "";
                txt_desc.Text = "";
                txt_full_desc.HtmlPanelCssClass = "";
               
                btn_save.Text = "Save";
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex > 0)
        {

            GetSeo();

        }
    }
}