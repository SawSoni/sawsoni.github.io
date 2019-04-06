using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class BlogDesc : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    string blogs = string.Empty;
    string strBlog = string.Empty;
    public string title = string.Empty;
    //public string strUrl = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        blogs = urlval(Convert.ToString(RouteData.Values["BlogName"]));
        loadContent();
    }
    private void loadContent()
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("select * from blogs where title='" + blogs + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            //string[] strArr = ds.Tables[0].Rows[i]["cont"].ToString().Split(' ');
            //string strCont = string.Empty;
            //for (int j = 0; j < ((strArr.Length < 100) ? strArr.Length : 100); j++)
            //{
            //    strCont = strCont + " " + strArr[j];
            //}
            //string[] strTitleArr = ds.Tables[0].Rows[i]["title"].ToString().Split(' ');
            //string strTitle = string.Empty;
            //for (int k = 0; k < strTitleArr.Length; k++)
            //{
            //    strTitle = strTitle + "-" + strTitleArr[k];
            //}
            title = ds.Tables[0].Rows[i]["title"].ToString();
            strBlog = strBlog + "<h1>" + ds.Tables[0].Rows[i]["title"].ToString() + "</h1><br /><p><span style='color:#9D81B6'>POSTED BY  </span><span style='color:#F15A23'>" + ds.Tables[0].Rows[i]["postedby"].ToString().ToUpper() + "</span><span style='color:#9D81B6;'>  ON </span> <span style='color:#F15A23'>" + ds.Tables[0].Rows[i]["datetime"].ToString() + "</span></p><div><img src='../" + ds.Tables[0].Rows[i]["other1"].ToString() + "' style='padding:2px;border:1px solid #ccc; width:100%; height:400px;' /></div><br /><div ><p>" + ds.Tables[0].Rows[i]["cont"].ToString() + "</p></div>";
            Page.Title = Convert.ToString(ds.Tables[0].Rows[0]["other2"]);
            HtmlMeta metakey = new HtmlMeta();
            metakey.Name = "Keywords";
            metakey.Content = Convert.ToString(ds.Tables[0].Rows[0]["other3"]);
            MetaPlaceHolder.Controls.Add(metakey);
        }
        blogContent.InnerHtml = strBlog;
    }
    private string urlval(string url)
    {
        string[] strArr = url.Split('-');
        string resulturl = string.Empty;
        for (int i = 0; i < strArr.Length; i++)
        {
            if (resulturl == "")
            {
                resulturl = strArr[i];
            }
            else
            {
                resulturl = resulturl + " " + strArr[i];
            }
        }
        return resulturl;
    }
}