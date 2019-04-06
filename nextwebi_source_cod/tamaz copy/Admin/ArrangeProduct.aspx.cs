using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Admin_ArrangeProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            //ddl_category.Items.Clear();
            //DropDownList1.Items.Clear();
            PopulateCategory();
            DropDownList1.Visible = false;
            lbl_product.Visible = false;
        }
    }
    protected void PopulateCategory()
    {
        //try
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("SELECT distinct category FROM product_details", con);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    this.ddl_category.Items.Clear();
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        ddl_category.DataSource = ds.Tables[0];
        //        ddl_category.DataTextField = "category";
        //        ddl_category.DataValueField = "category";
        //        ddl_category.DataBind();
        //    }

        //    ddl_category.Items.Insert(0, new ListItem("Select Category", "Select Category"));

        //}
        //catch (Exception es)
        //{

        //}
        //finally
        //{
        //    con.Close();
        //}
    }
    protected void PopulateProduct()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT product_name,product_id FROM product_details where category='" + ddl_category.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.DropDownList1.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataTextField = "product_name";
                DropDownList1.DataValueField = "product_id";
                DropDownList1.DataBind();
            }

            DropDownList1.Items.Insert(0, new ListItem("Select Product", "Select Product"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //PopulateProduct();
            //DropDownList1.Visible = true;
            //lbl_product.Visible = true;

        }
        catch (Exception es)
        {

        }
        finally
        {
            
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where product_id = @product_id", con);
            //cmd.Parameters.AddWithValue("@product_id", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Value;
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //DataTable oDt = new DataTable();
            //oDt = ds.Tables[0];

            //foreach (DataRow oRow in oDt.Rows)
            //{

            //    txt_discount_price.Text = Convert.ToString(oRow["discount_price"]);
            //    txt_final_price.Text = Convert.ToString(oRow["final_price"]);
            //    txt_full_desc.Content = Convert.ToString(oRow["full_desc"]);
            //    txt_meta_desc.Text = Convert.ToString(oRow["meta_desc"]);
            //    txt_meta_key.Text = Convert.ToString(oRow["meta_keyword"]);
            //    txt_meta_title.Text = Convert.ToString(oRow["page_title"]);
            //    txt_price.Text = Convert.ToString(oRow["price"]);
            //    txt_productname.Text = Convert.ToString(oRow["product_name"]);
            //    txt_sort_desc.Text = Convert.ToString(oRow["sort_desc"]);


            //    //other details
            //    if (Convert.ToString(oRow["isfeatured"]) == "Yes")
            //    {
            //        chk_featured.Checked = true;
            //    }
            //    //img_product_big.ImageUrl = "../" + Convert.ToString(oRow["big_image"]);
            //    img_product_small.ImageUrl = "../" + Convert.ToString(oRow["small_image"]);
            //}

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
            //PopulateProduct();
            //DropDownList1.Visible = true;
        }
    }
}