using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_AddTags : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_tags_Click(object sender, EventArgs e)
    {
        AddTags();
        GridView1.DataBind();
    }
    protected void AddTags()
    {
        try
        {
            SqlCommand cmd;
            con.Open();

            cmd = new SqlCommand("insert into tags(tags,added_by,added_on) values(@tags,@added_by,@added_on)", con);
            cmd.Parameters.Add("@tags", SqlDbType.VarChar).Value = txt_tags.Text;
            cmd.Parameters.Add("@added_by", SqlDbType.VarChar).Value =Convert.ToString(Session["admin_id"]);
            cmd.Parameters.Add("@added_on", SqlDbType.VarChar).Value = DateTime.Now.ToString();
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Tag added successfully..";
            con.Close();
            txt_tags.Text = "";
            //Response.Redirect("add_new_category.aspx");

        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
}