using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_add_new_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack == false)
        {

        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        addnewcategory();
    }
    
    protected void addnewcategory()
    {
        try
        {
            SqlCommand cmd;
            con.Open();

            cmd = new SqlCommand("insert into category(category,other) values(@category,@other)", con);
            cmd.Parameters.Add("@category", SqlDbType.VarChar).Value = txt_category.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = "50"; ;

            cmd.ExecuteNonQuery();
            Label1.Text = "New Category added successfully..";
            con.Close();
            txt_category.Text = "";
            //Response.Redirect("add_new_category.aspx");

        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
}