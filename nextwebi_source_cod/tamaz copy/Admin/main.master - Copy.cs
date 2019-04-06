using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        Response.Cookies["apiKey"].Value = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (Session["admin_id"] != null)
        {
            if (Convert.ToString(Session["admin_id"]).ToLower() == "praveen")
            {
                panchor.Attributes.Add("class", "hide");
                //price.Visible = false;
            }
            lbl_admin.Text = Session["admin_id"].ToString();
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void lnklogout_Command(object sender, CommandEventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}
