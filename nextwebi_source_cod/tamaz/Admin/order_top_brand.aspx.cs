﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Design;

public partial class Admin_order_top_brand : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            PopulateCategory();
        }
    }
    protected void PopulateCategory()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct brand_guid, brand_name FROM brands", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            this.ddl_category.Items.Clear();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_category.DataSource = ds.Tables[0];
                ddl_category.DataTextField = "brand_name";
                ddl_category.DataValueField = "brand_guid";
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

    
}