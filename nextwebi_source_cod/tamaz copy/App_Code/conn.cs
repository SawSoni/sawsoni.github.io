using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

/// <summary>
/// Summary description for Conn
/// </summary>
public class Conn : System.Web.UI.Page
{
    public static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    public static SqlCommand cmd;
    public static SqlDataAdapter sDa;
    public Conn()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool Insert(string query)
    {
        bool result = false;
        try
        {
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            result = true;
        }
        catch
        {
            result = false;
        }
        finally
        {
            con.Close();
        }
        return result;
    }
    public static bool Update(string query)
    {
        bool result = false;
        try
        {
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            result = true;
        }
        catch
        {
            result = false;
        }
        finally
        {
            con.Close();
        }
        return result;
    }
    public static DataSet Read(string query)
    {
        DataSet ds = new DataSet();
        ds.Clear();
        try
        {
            con.Open();
            cmd = new SqlCommand(query, con);
            sDa = new SqlDataAdapter(cmd);
            sDa.Fill(ds);
        }
        catch
        {
        }
        finally
        {
        }
        return ds;
    }
    public  string getUrl(string productName)
    {
        string url = GetRouteUrl("Product", new { ProductName = seourl(productName) });
        return url;
    }
    private  string seourl(string url)
    {
        string[] strArr = url.Split(' ');
        string resulturl = string.Empty;
        for (int i = 0; i < strArr.Length; i++)
        {
            if (resulturl == "")
            {
                resulturl = strArr[i];
            }
            else
            {
                resulturl = resulturl + "-" + strArr[i];
            }
        }
        return resulturl;
    }
}