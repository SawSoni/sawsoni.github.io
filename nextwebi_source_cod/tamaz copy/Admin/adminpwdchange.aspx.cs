using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_adminpwdchange : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_change_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_newpassword.Text == txt_retypepassword.Text)
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("update Admin_Login set admin_pwd = @admin_pwd where admin_id=@admin_id", con);
                cmd1.Parameters.AddWithValue("@admin_id", SqlDbType.VarChar).Value = Session["admin_id"].ToString();
                cmd1.Parameters.AddWithValue("@admin_pwd", SqlDbType.VarChar).Value = txt_retypepassword.Text;
                cmd1.ExecuteNonQuery();
                lbl_message.Text = "Password Changed Successfully...";
                lbl_message.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "";
                Label1.Text = "";
                con.Close();
            }
            else
            {
                lbl_message.Text = "Retype password not matched";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void txt_oldpassword_TextChanged(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand("select * from Admin_Login where admin_id = @admin_id and admin_pwd = @admin_pwd", con);
            cmd.Parameters.AddWithValue("@admin_id", SqlDbType.VarChar).Value = Session["admin_id"].ToString();
            cmd.Parameters.AddWithValue("@admin_pwd", SqlDbType.VarChar).Value = txt_oldpassword.Text;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Password matched with database";
                txt_oldpassword.Attributes.Add("value", txt_oldpassword.Text);
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = "Password not matched with database";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            dr.Close();
        }
        catch (Exception ex)
        {

        }
        con.Close();
    }
}