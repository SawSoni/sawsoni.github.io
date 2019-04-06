using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {

        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        try
        {
            con.Open();
            SqlDataReader dr;

            SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login WHERE admin_id=@admin_id AND admin_pwd=@admin_pwd  ", con);
            cmd.Parameters.Add("@admin_id", SqlDbType.VarChar).Value = username.Text;
            cmd.Parameters.Add("@admin_pwd", SqlDbType.VarChar).Value = upassword.Text;

            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.Session["admin_id"] = username.Text;
                this.Response.Redirect("dashboard.aspx");
            }
            else
            {
                this.Label1.Text = "username or password is wrong.. !!";
            }
        }
        catch (Exception es)
        {
            Label1.Text = es.Message;
        }
        finally
        {
            con.Close();
        }
    }
}