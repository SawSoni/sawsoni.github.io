using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AddSubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCategory();
        }
    }
    public void PopulateCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,category FROM category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);


            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "category";
                ddl_category.DataValueField = "id";
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string result = string.Empty;
        try
        {
            SqlCommand cmd;
            con.Open();
            //productInfo time = new productInfo();
            cmd = new SqlCommand("insert into sub_category values(@category,@other_sort,@category_id,@sub_category,@other,@other1)", con);
            cmd.Parameters.Add("@category", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Text;
            cmd.Parameters.Add("@category_id", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Value;
            cmd.Parameters.Add("@sub_category", SqlDbType.VarChar).Value = txt_category.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other_sort", SqlDbType.VarChar).Value = "";
            cmd.Parameters.Add("@other1", SqlDbType.VarChar).Value = "";
            cmd.ExecuteNonQuery();
            result = "Sub Category added successfully..";
            txt_category.Text = string.Empty;
        }
        catch (Exception ex)
        {
            result = "Sub Category Added Faild ! Please Try Again.";
        }
        finally
        {
            con.Close();
        }
        Label1.Text = result;
    }
}