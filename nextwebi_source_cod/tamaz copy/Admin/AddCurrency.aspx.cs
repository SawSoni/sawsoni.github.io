using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_AddCurrency : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_currency_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into currency(currency,currency_value,date_time,updated_by) values('"+txt_currency.Text+"','"+txt_value.Text+"','"+DateTime.Now.ToString()+"','"+Convert.ToString(Session["admin_id"])+"')", con);
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            txt_currency.Text = string.Empty;
            txt_value.Text = string.Empty;
            Label1.Text = "Currency Added Successfully !!";
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