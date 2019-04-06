using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_ApproveReview : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateReview();
        }
    }
    public void PopulateReview()
    {
         try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM reviews where id="+Request.QueryString["id"].ToString()+"  ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(Convert.ToString(ds.Tables[0].Rows[0][0])!="")
            {
                ProductName.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["product_name"]);
                UserName.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["username"]);
                DateVal.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["posted_date"]);
                ddl_rating.SelectedIndex =int.Parse( Convert.ToString(ds.Tables[0].Rows[0]["rating"]));
                Status.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["status"]);
                txt_review.Text = Convert.ToString(ds.Tables[0].Rows[0]["your_review"]);
            }
            else
            {
                btn_approve.Enabled = false;
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

    protected void btn_approve_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update  reviews set status='Approved' where id=" + Request.QueryString["id"].ToString() + "  ", con);
            cmd.ExecuteNonQuery();
            Label1.Text = "Review Approved !!";
        }
        catch (Exception es)
        {
            Label1.Text = "Failed ! Please try again ..";
        }
        finally
        {
            con.Close();
        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update  reviews set rating='"+ddl_rating.SelectedItem.Text+"', your_review='"+txt_review.Text+"' where id=" + Request.QueryString["id"].ToString() , con);
            cmd.ExecuteNonQuery();
            Label1.Text = "Review Updated !!";
        }
        catch (Exception es)
        {
            Label1.Text = "Failed ! Please try again ..";
        }
        finally
        {
            con.Close();
        }
    }
}