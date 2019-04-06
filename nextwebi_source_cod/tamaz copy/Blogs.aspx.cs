using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Blogs : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
    string strBlog = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("select  * from blogs order by id desc", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string[] strArr = ds.Tables[0].Rows[i]["cont"].ToString().Split(' ');
            string strCont = string.Empty;
            for (int j = 0; j < ((strArr.Length < 30) ? strArr.Length : 30); j++)
            {
                strCont = strCont + " " + strArr[j];
            }
            //string[] strTitleArr = ds.Tables[0].Rows[i]["title"].ToString().Split(' ');
            //string strTitle = string.Empty;
            //for (int k = 0; k < strTitleArr.Length; k++)
            //{
            //    strTitle = strTitle + "-" + strTitleArr[k];
            //}
            string url = GetRouteUrl("Blogs", new { BlogName = seourl(ds.Tables[0].Rows[i]["title"].ToString()) });
            strBlog = strBlog + "<div class='beta-blog beta-blog-a'  style='margin-top:50px'><div class='row'><div class='beta-blog-header'><div class='media'><div class='pull-left'><span class='beta-blog-type pull-left'><img src='images/calendar-icon.png'></span><span class='beta-blog-date pull-left'><span class='beta-blog-month'>" + DateTime.Parse(ds.Tables[0].Rows[i]["datetime"].ToString()).ToString("MMM") + "</span><span class='beta-blog-day'>" + DateTime.Parse(ds.Tables[0].Rows[i]["datetime"].ToString()).ToString("dd") + "</span></span><div class='clearfix'></div></div><div class='media-body'><h4 class='beta-blog-title' style='margin-top:0px;'><a href='" + url + "'>" + ds.Tables[0].Rows[i]["title"].ToString() + "</a></h4><p>Posted By: <a href='#'>" + ds.Tables[0].Rows[i]["postedby"].ToString() + "</a></p></div></div></div></div><div class='row beta-blog-content' style='background:#f5f5f5;'><div class='col-sm-5' style='padding-left:0px !important;'><a href='" + url + "'><img  style='width:100%;height:228px;' src='" + ds.Tables[0].Rows[i]["other1"].ToString() + "' alt=''></a></div><div class='col-sm-7' style='padding:10px 0px;'>" + strCont + "<br/><br/><br><a href='" + url + "' class='button' style='background:#EA3994;border-color:#EA3994;color:#fff;'>Read More <i class='fa fa-chevron-right'></i></a></div></div></div>";
            //"<a href='" + url + "'><h1>" + ds.Tables[0].Rows[i]["title"].ToString() + "</h1></a><p><span style='color:#9D81B6'>POSTED BY  </span><span style='color:#F15A23'>" + ds.Tables[0].Rows[i]["postedby"].ToString().ToUpper() + "</span><span style='color:#9D81B6;'>  ON </span> <span style='color:#F15A23'>" + ds.Tables[0].Rows[i]["datetime"].ToString() + "</span></p><div style='width:90%;heigt:200px;'><img src='" + ds.Tables[0].Rows[i]["other1"].ToString() + "' style='padding:2px;border:1px solid #ccc; width:90%; height:200px;' /></div><div style='padding-bottom:20px; border-bottom:1px solid #ccc;'><p>" + strCont + "</p><a href='" + url + "' style='color:#F15A23'>Continue Reading</a><br /></div><br/>";
        }
        blogContent.InnerHtml = strBlog;

    }
    private string seourl(string url)
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