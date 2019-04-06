using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_product_by_brand : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCategory();
            GetBrands();
        }
    }

    public void GetCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,category FROM category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);


            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "category";
                ddl_category.DataValueField = "id";
                ddl_category.DataBind();
            }

            ddl_category.Items.Insert(0, new ListItem("Select Category", "0"));


        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }

    public void GetProduct()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT product_id,product_name FROM product_details where sub_category='" + ddl_sub_category.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);
            this.lstProduct.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                lstProduct.DataSource = ds.Tables[0];
                lstProduct.DataTextField = "product_name";
                lstProduct.DataValueField = "product_id";
                lstProduct.DataBind();
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

    public void GetBrands()
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT brand_guid,brand_name FROM brands", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);


            this.ddl_brand.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_brand.DataSource = ds.Tables[0];
                ddl_brand.DataTextField = "brand_name";
                ddl_brand.DataValueField = "brand_guid";
                ddl_brand.DataBind();
            }

            ddl_brand.Items.Insert(0, new ListItem("Select Brand", "0"));


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
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,sub_category FROM sub_category where category='" + ddl_category.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);
            this.ddl_sub_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_sub_category.DataSource = ds.Tables[0];
                ddl_sub_category.DataTextField = "sub_category";
                ddl_sub_category.DataValueField = "id";
                ddl_sub_category.DataBind();
            }

            ddl_sub_category.Items.Insert(0, new ListItem("Select Sub Category", "0"));


        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }

    protected void ddl_sub_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetProduct();
    }
    protected void btn_next_multi_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (ListItem li in lstProduct.Items)
            {
                if (li.Selected)
                {
                    lstBrand.Items.Add(new ListItem(li.Text, li.Value));
                }
            }
            foreach (ListItem li in lstBrand.Items)
            {
                lstProduct.Items.Remove(new ListItem(li.Text, li.Value));
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btn_prev_multi_Click(object sender, EventArgs e)
    {
        foreach (ListItem li in lstBrand.Items)
        {
            if (li.Selected)
            {
                lstProduct.Items.Add(new ListItem(li.Text, li.Value));
            }
        }
        foreach (ListItem li in lstProduct.Items)
        {
            lstBrand.Items.Remove(new ListItem(li.Text, li.Value));
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            productInfo pi = new productInfo();
            string dt = pi.ISTINIDAtime().ToString();

            SqlCommand cmdDelete = new SqlCommand("Delete FROM product_by_brand where brand_name = '" + ddl_brand.SelectedItem.Text + "'", con);
            con.Open();
            cmdDelete.ExecuteNonQuery();
            con.Close();

            int exex = 0;


            foreach (ListItem li in lstBrand.Items)
            {

                SqlCommand cmd = new SqlCommand("insert into product_by_brand (brand_guid,brand_name, category, sub_category, product_name, product_id, add_date) values(@brand_guid,@brand_name, @category, @sub_category, @product_name, @product_id, @add_date)", con);
                cmd.Parameters.Add("@category", SqlDbType.VarChar).Value = ddl_category.SelectedItem.Text;
                cmd.Parameters.Add("@brand_guid", SqlDbType.VarChar).Value = ddl_brand.SelectedValue.ToString();
                cmd.Parameters.Add("@brand_name", SqlDbType.VarChar).Value = ddl_brand.SelectedItem.Text;
                cmd.Parameters.Add("@sub_category", SqlDbType.VarChar).Value = ddl_sub_category.SelectedItem.Text;
                cmd.Parameters.Add("@product_name", SqlDbType.VarChar).Value = li.Text;
                cmd.Parameters.Add("@product_id", SqlDbType.VarChar).Value = li.Value;
                cmd.Parameters.Add("@add_date", SqlDbType.VarChar).Value = dt;
                con.Open();
                exex = cmd.ExecuteNonQuery();
                con.Close();


            }


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void ddl_brand_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT product_id,product_name FROM product_by_brand where brand_name='" + ddl_brand.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds.Clear();
            da.Fill(ds);
            this.lstBrand.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                lstBrand.DataSource = ds.Tables[0];
                lstBrand.DataTextField = "product_name";
                lstBrand.DataValueField = "product_id";
                lstBrand.DataBind();
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