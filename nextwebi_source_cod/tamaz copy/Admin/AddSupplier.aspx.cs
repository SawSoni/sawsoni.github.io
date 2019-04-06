using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_AddSupplier : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        AddSupplier();
    }
    protected void AddSupplier()
    {
        try
        {
            SqlCommand cmd;
            con.Open();
            productInfo obj = new productInfo();
            cmd = new SqlCommand("insert into supplier_master(supplier_guid,supplier_name,supplier_company,contact_number,email,address,added_on,country,trust_level,website,rating,other) values(@supplier_guid,@supplier_name,@supplier_company,@contact_number,@email,@address,@added_on,@country,@trust_level,@website,@rating,@other)", con);
            cmd.Parameters.Add("@supplier_guid", SqlDbType.VarChar).Value = Guid.NewGuid().ToString();
            cmd.Parameters.Add("@supplier_name", SqlDbType.VarChar).Value = txt_name.Text;
            cmd.Parameters.Add("@supplier_company", SqlDbType.VarChar).Value = txt_company.Text;
            cmd.Parameters.Add("@contact_number", SqlDbType.VarChar).Value = txt_mobile.Text;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text;
            cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txt_address.Text;
            cmd.Parameters.Add("@added_on", SqlDbType.VarChar).Value = obj.ISTINIDAtime().ToString();
            cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = txt_country.Text;
            cmd.Parameters.Add("@trust_level", SqlDbType.VarChar).Value = txt_tl.Text;
            cmd.Parameters.Add("@website", SqlDbType.VarChar).Value = txt_website.Text;
            cmd.Parameters.Add("@rating", SqlDbType.VarChar).Value = txt_rating.Text;
            cmd.Parameters.Add("@other", SqlDbType.VarChar).Value = Convert.ToString(Session["admin_id"]);
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Supplier added successfully..";
            con.Close();
            txt_website.Text = string.Empty;
            txt_address.Text = string.Empty;
            txt_company.Text = string.Empty;
            txt_country.Text = string.Empty;
            txt_email.Text = string.Empty;
            txt_mobile.Text = string.Empty;
            txt_name.Text = string.Empty;
            txt_rating.Text = string.Empty;
            txt_website.Text = string.Empty;
            //Response.Redirect("add_new_category.aspx");

        }
        catch (Exception ex)
        {
            lbl_success.Text = ex.Message;
        }
    }
}