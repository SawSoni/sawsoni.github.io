using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_SupplierDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateSupplier();
    }
    protected void PopulateSupplier()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from supplier_master where supplier_guid='"+Convert.ToString(Request.QueryString["id"])+"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    sp_name.InnerHtml = Convert.ToString(row["supplier_name"]);
                    sp_company.InnerHtml = Convert.ToString(row["supplier_company"]);
                    sp_mobile.InnerHtml = Convert.ToString(row["contact_number"]);
                    sp_email.InnerHtml = Convert.ToString(row["email"]);
                    sp_address.InnerHtml = Convert.ToString(row["address"]);
                    sp_tl.InnerHtml = Convert.ToString(row["trust_level"]);
                    sp_country.InnerHtml = Convert.ToString(row["country"]);
                    sp_addedby.InnerHtml = Convert.ToString(row["other"]);
                    sp_addedon.InnerHtml = Convert.ToString(row["added_on"]);
                    sp_website.InnerHtml = Convert.ToString(row["website"]);
                }
            }

        }
        catch (Exception es)
        {
            
        }
        finally
        {
            con.Close();
        }
    }
}