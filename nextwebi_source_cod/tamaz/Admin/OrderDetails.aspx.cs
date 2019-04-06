using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_OrderDetails : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select pd.small_image,pd.product_name,oi.item_count,total_price,sm.supplier_company,sm.supplier_guid from orders_item oi inner join product_details pd on oi.product_id=pd.product_id inner join supplier_master sm on pd.supplier_guid=sm.supplier_guid where oi.order_id='" + Convert.ToString(Request.QueryString["id"]) + "' select b.buyer_id,b.name,b.mobile,b.city,b.pincode,b.address,b.landmark,b.state,b.country,b.other1,o.payment_mode,o.order_status,o.order_price,o.verified_mobile from buyers b inner join orders o on b.other2=o.order_id where o.order_id='" + Convert.ToString(Request.QueryString["id"]) + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                foreach (DataRow row in ds.Tables[1].Rows)
                {
                    sp_email.InnerHtml = Convert.ToString(row["buyer_id"]);
                    sp_name.InnerHtml = Convert.ToString(row["name"]);
                    sp_mobile.InnerHtml = Convert.ToString(row["mobile"]);
                    sp_city.InnerHtml = Convert.ToString(row["city"]);
                    sp_pincode.InnerHtml = Convert.ToString(row["pincode"]);
                    sp_address.InnerHtml = Convert.ToString(row["address"]);
                    sp_landmark.InnerHtml = Convert.ToString(row["landmark"]);
                    sp_state.InnerHtml = Convert.ToString(row["state"]);
                    sp_country.InnerHtml = Convert.ToString(row["country"]);
                    sp_orderedon.InnerHtml = Convert.ToString(row["other1"]);
                    sp_pm.InnerHtml = Convert.ToString(row["payment_mode"]);
                    sp_os.InnerHtml = Convert.ToString(row["order_status"]);
                    sp_ta.InnerHtml = Convert.ToString(row["order_price"]);
                    if (Convert.ToString(row["verified_mobile"]) == "Yes")
                    {
                        sp_ver.InnerHtml = "Verified";
                    }
                    else
                    {
                        sp_nver.InnerHtml = "Not Verified";
                    }
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