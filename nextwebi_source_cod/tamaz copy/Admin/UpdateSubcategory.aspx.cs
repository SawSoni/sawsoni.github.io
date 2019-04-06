using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_UpdateSubcategory : System.Web.UI.Page
{
    static int subCategoryFlag = 0;
    string subCategory = string.Empty;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCategory();
        }
    }
    protected void btn_pupdate_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update product_details set sub_category='" + txt_subcategory.Text + "'  where product_id='" + ddl_product.SelectedItem.Value + "'", con);
            cmd.ExecuteNonQuery();
            lbl_success.Text = "Sub Category updated successfully !!";
            txt_subcategory.Text = string.Empty;
        }
        catch (Exception es)
        {
            lbl_success.Text = es.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,category FROM category", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "category";
                ddl_category.DataValueField = "id";
                ddl_category.DataBind();
            }

            ddl_category.Items.Insert(0, new ListItem("Select Category", "Select Category"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }
    public string GetSubCategory()
    {
        if (subCategoryFlag == 1)
        {
            subCategory = ddl_subcategory.SelectedItem.Text;
        }
        else
        {
            subCategory = "";
        }
        return subCategory;
    }
    protected void PopulateSubCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT id,sub_category FROM sub_category where category_id='" + ddl_category.SelectedItem.Value + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_subcategory.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_subcategory.DataSource = ds.Tables[0];
                ddl_subcategory.DataTextField = "sub_category";
                ddl_subcategory.DataValueField = "id";
                ddl_subcategory.DataBind();
                ddl_subcategory.Visible = true;
                subCategoryFlag = 1;
            }
            else
            {
                ddl_subcategory.Visible = false;
                subCategoryFlag = 0;
            }
            ddl_subcategory.Items.Insert(0, new ListItem("Select Sub Category", "Select Sub Category"));

        }
        catch (Exception es)
        {
            ddl_subcategory.Visible = false;
            subCategoryFlag = 1;
        }
        finally
        {
            con.Close();
        }
    }
    protected void PopulateProduct()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT product_name,product_id FROM product_details where category='" + ddl_category.SelectedItem.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_product.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_product.DataSource = ds.Tables[0];
                ddl_product.DataTextField = "product_name";
                ddl_product.DataValueField = "product_id";
                ddl_product.DataBind();
            }

            ddl_product.Items.Insert(0, new ListItem("Select Product", "Select Product"));

        }
        catch (Exception es)
        {

        }
        finally
        {
            con.Close();
        }
    }
    protected void PopulateProductDetails()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT sub_category FROM product_details where product_id='" + ddl_product.SelectedItem.Value + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    txt_subcategory.Text = Convert.ToString(row["sub_category"]);
                    
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
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateSubCategory();
        if (subCategoryFlag == 0)
        {
            PopulateProduct();
        }
    }
    protected void ddl_subcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateProduct();
    }
    protected void ddl_product_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateProductDetails();
    }
}