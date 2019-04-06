using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Backend
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Backend : System.Web.Services.WebService
{

    public Backend()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    [WebMethod(EnableSession = true)]
    public string productget(string pid, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
        string presult = string.Empty;
        if (apiKey == key)
        {
            int count = 1;
            int status = 0;
            try
            {

                con2.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_name,small_image,final_price,price,discount_price FROM product_details where product_id='" + pid + "'", con2);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds.Clear();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        productInfo pi = new productInfo();
                        //if (Convert.ToString(row["final_price"]).ToLower() == "contact for price")
                        //{
                        //    price = "contact for price";

                        //}
                        //else
                        //{
                        //    price = pi.UnitPrice("INR", long.Parse(Convert.ToString(row["final_price"]))).ToString();
                        //}

                        //System.Windows.Forms.MessageBox.Show(ds.Tables[0].Rows[0][0].ToString());
                        presult = presult + row["product_name"].ToString() + "," + row["small_image"].ToString() + "," + Convert.ToString(row["final_price"]);
                        //string strsess = string.Empty;
                        try
                        {
                            string[] str = Convert.ToString(Session["user"]).Split('|');
                            for (int i = 1; i < (str.Length); i++)
                            {
                                string[] str1 = str[i].Split(',');
                                if (str1[0].Trim() == pid.Trim())
                                {
                                    status = 1;
                                    Session["user"] = "";
                                    count = int.Parse(str1[1]) + 1;
                                    for (int j = 1; j < (str.Length); j++)
                                    {
                                        if (j != i)
                                        {
                                            Session["user"] = Convert.ToString(Session["user"]) + "|" + str[j];
                                        }
                                    }
                                    break;
                                }
                            }
                        }
                        catch
                        {
                        }

                        if (status == 1)
                        {
                            if (ds.Tables[0].Rows[0][2].ToString().ToLower() == "contact for price")
                            {
                                Session["user"] = Convert.ToString(Session["user"]) + "|" + pid + "," + count + "," + row["product_name"].ToString() + "," + row["small_image"].ToString() + "," + row["final_price"].ToString();
                            }
                            else
                            {
                                Session["user"] = Convert.ToString(Session["user"]) + "|" + pid + "," + count + "," + row["product_name"].ToString() + "," + row["small_image"].ToString() + "," + (int.Parse(row["final_price"].ToString()) * count).ToString(); ;
                            }
                        }
                        else
                        {
                            Session["user"] = Convert.ToString(Session["user"]) + "|" + pid + "," + count + "," + presult;
                        }
                        //string str = Session["user"].ToString();
                    }
                }
            }
            catch (Exception es)
            {

            }
            finally
            {
                con2.Close();
            }
        }
        return presult + "!" + Convert.ToString(Session["user"]);
    }
    [WebMethod(EnableSession = true)]
    public long UnitPrice(string currency, long amount, string apiKey)
    {
        long result = 0;
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
        if (apiKey == key)
        {
            try
            {
                con.Open();
                DataSet ds = new DataSet();
                ds.Clear();
                SqlCommand cmd = new SqlCommand("select currency_value from currency where currency='" + currency + "'", con);
                SqlDataAdapter sDa = new SqlDataAdapter(cmd);
                sDa.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (Convert.ToString(row["currency_value"]).ToLower() != "contact for price")
                        {
                            result = int.Parse(Convert.ToString(row["currency_value"])) * amount;
                        }
                        else
                        {
                            result = 0;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }
        return result;
    }
    [WebMethod(EnableSession = true)]
    public string productget2(string pid, int count, string apiKey)
    {
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
        string presult = string.Empty;
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            int status = 0;
            try
            {

                con2.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_name,small_image,final_price,price,discount_price FROM product_details where product_id='" + pid + "'", con2);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds.Clear();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0] != "")
                {
                    //System.Windows.Forms.MessageBox.Show(ds.Tables[0].Rows[0][0].ToString());
                    if (ds.Tables[0].Rows[0]["final_price"].ToString().ToLower() != "contact for price")
                    {
                        presult = presult + ds.Tables[0].Rows[0]["product_name"].ToString() + "," + ds.Tables[0].Rows[0]["small_image"].ToString() + "," + (int.Parse(ds.Tables[0].Rows[0]["final_price"].ToString()) * count).ToString();
                    }
                    else
                    {
                        presult = presult + ds.Tables[0].Rows[0]["product_name"].ToString() + "," + ds.Tables[0].Rows[0]["small_image"].ToString() + ", NAN";
                    }
                    //string strsess = string.Empty;
                    try
                    {
                        string[] str = Convert.ToString(Session["user"]).Split('|');
                        for (int i = 1; i < (str.Length); i++)
                        {
                            string[] str1 = str[i].Split(',');
                            if (str1[0].Trim() == pid.Trim())
                            {
                                status = 1;
                                Session["user"] = "";
                                count = int.Parse(str1[1]) + count;
                                for (int j = 1; j < (str.Length); j++)
                                {
                                    if (j != i)
                                    {
                                        Session["user"] = Convert.ToString(Session["user"]) + "|" + str[j];
                                    }
                                }
                                break;
                            }
                        }
                    }
                    catch
                    {

                    }

                    if (status == 1)
                    {
                        Session["user"] = Convert.ToString(Session["user"]) + "|" + pid + "," + count + "," + ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString() + "," + (int.Parse(ds.Tables[0].Rows[0][2].ToString()) * count).ToString(); ;
                    }
                    else
                    {
                        Session["user"] = Convert.ToString(Session["user"]) + "|" + pid + "," + count + "," + presult;
                    }
                    //string str = Session["user"].ToString();
                }
            }
            catch (Exception es)
            {

            }
            finally
            {
                con2.Close();
            }
        }
        return presult + "!" + Convert.ToString(Session["user"]);

    }
    [WebMethod(EnableSession = true)]
    public string productget1(string apiKey)
    {
        string result = "";
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            result = "!" + Convert.ToString(Session["user"]);
        }
        return result;
    }
    [WebMethod(EnableSession = true)]
    public string getIndex(string apiKey)
    {
        string result = "";
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            result = (string)Session["index"];
        }
        return result;
    }
    [WebMethod(EnableSession = true)]
    public string LoginDetails(string apiKey)
    {
        string abc = string.Empty;
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            if (Session["customer_id"] == null)
            {
                abc = "a";
            }
            else
            {
                abc = (string)Session["customer_id"];
            }
        }

        return abc;
    }
    [WebMethod(EnableSession = true)]
    public string IsLogin(string apiKey)
    {
        string abc = string.Empty;
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            if (Session["customer_id"] == null)
            {
                abc = "a";
            }
            else
            {
                abc = (string)Session["customer_id"];
            }
        }

        return abc;
    }
    [WebMethod(EnableSession = true)]
    public void LogOut(string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            Session.Abandon();
            Session.Clear();
        }

        //return abc;
    }
    [WebMethod(EnableSession = true)]
    public string ClearCart(string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        { Session["user"] = ""; }
        return "!" + Convert.ToString(Session["user"]);
    }
    [WebMethod(EnableSession = true)]
    public string productremove(string pid, string apiKey)
    {
        string presult = string.Empty;
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            int count = 1;
            try
            {

                string[] str = Convert.ToString(Session["user"]).Split('|');
                for (int i = 1; i <= (str.Length); i++)
                {
                    string[] str1 = str[i].Split(',');
                    if (str1[0].Trim() == pid.Trim())
                    {
                        Session["user"] = "";
                        count = int.Parse(str1[1]) + 1;
                        for (int j = 1; j <= (str.Length); j++)
                        {
                            if (j != i)
                            {
                                Session["user"] = Convert.ToString(Session["user"]) + "|" + str[j];
                            }
                        }
                        break;
                    }
                }


            }
            catch (Exception es)
            {

            }
            finally
            {

            }
        }
        return "!" + Convert.ToString(Session["user"]);
    }
    public DateTime ISTINIDAtime()
    {
        DateTime utcNow = DateTime.UtcNow;
        TimeZoneInfo destinationTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        return TimeZoneInfo.ConvertTimeFromUtc(utcNow, destinationTimeZone);
    }
    public void WriteLog(string logData)
    {
        string path = HttpContext.Current.Server.MapPath("~/Log/Log.txt");
        StringBuilder builder = new StringBuilder();
        builder.Append(logData);
        using (StreamReader reader = new StreamReader(path))
        {
            builder.Append("\n" + reader.ReadToEnd());
        }
        using (StreamWriter writer = new StreamWriter(path))
        {
            writer.Write(builder.ToString());
        }
    }
    [WebMethod(EnableSession = true)]
    public FeatureProductList PopulateFeature(int lastIdVal, string apiKey)
    {
        //WriteLog("[" + ISTINIDAtime().ToString() + "-   "+lastIdVal+"]  ---------------------------------------------------------------------------------------------------------- ");
        FeatureProductList fpl = new FeatureProductList();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (lastIdVal == int.Parse(Convert.ToString(Session["index"])) || int.Parse(Convert.ToString(Session["index"])) == 0)
        {

            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            string ipStr = ip.Replace("::ffff:", "");
            string ipStr1 = ipStr.Replace(".", "");
            string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
            if (apiKey == key)
            {
                string isfeatured = string.Empty;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
                try
                {
                    long lastId = lastIdVal;//long.Parse(lastIdVal1);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT top 9 id,product_id,product_name,big_image,price,discount_price,product_rating,final_price,hotselling,home_display_order FROM product_details where isfeatured = 'Yes' and cast(home_display_order as int)>'" + lastIdVal + "' order by  cast(home_display_order as int) ASC ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    List<FeatureProducts> fpList = new List<FeatureProducts>();
                    if (ds.Tables.Count > 0)
                    {
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            FeatureProducts fp = new FeatureProducts();
                            string url = "Product/" + seourl(Convert.ToString(row["product_name"]));
                            productInfo pi = new productInfo();
                            if (Convert.ToString(row["final_price"]).ToLower() == "contact for price")
                            {
                                fp.finalPrice = "contact for price";

                            }
                            else
                            {
                                fp.finalPrice = pi.UnitPrice("INR", long.Parse(Convert.ToString(row["final_price"]))).ToString();
                            }
                            fp.name = Convert.ToString(row["product_name"]);
                            fp.id = long.Parse(Convert.ToString(row["id"]));
                            fp.guid = Convert.ToString(row["product_id"]);
                            fp.image = "http://bunnybash.in/" + Convert.ToString(row["big_image"]);
                            fp.rating = int.Parse(Convert.ToString(row["product_rating"]));
                            fp.hotSelling = Convert.ToString(row["hotselling"]);
                            fp.url = url;
                            fpList.Add(fp);
                            if (lastId < int.Parse(Convert.ToString(row["home_display_order"])))
                            {
                                lastId = int.Parse(Convert.ToString(row["home_display_order"]));
                            }
                        }
                    }
                    fpl.fp = fpList;
                    fpl.id = lastId;
                    Session["index"] = lastId.ToString();
                    //WriteLog("[" + ISTINIDAtime().ToString() + "]  Last Id- " + lastId);

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

        return fpl;
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
    [WebMethod(EnableSession = true)]
    public FeatureProductList PCP(string val, string cat, int lastIdVal, string apiKey)
    {
        cat = cat.Trim();
        FeatureProductList fpl = new FeatureProductList();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                long lastId = lastIdVal;
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT top 9 id,product_id,product_name,big_image,price,discount_price,product_rating,final_price,hotselling FROM product_details where category='" + cat + "' and id>'" + lastIdVal + "' order by id ASC ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                List<FeatureProducts> fpList = new List<FeatureProducts>();
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        FeatureProducts fp = new FeatureProducts();
                        string url = "Product/" + seourl(Convert.ToString(row["product_name"]));

                        fp.name = Convert.ToString(row["product_name"]);
                        fp.id = long.Parse(Convert.ToString(row["id"]));
                        fp.guid = Convert.ToString(row["product_id"]);
                        fp.finalPrice = Convert.ToString(row["final_price"]);
                        fp.image = Convert.ToString(row["big_image"]);
                        fp.rating = int.Parse(Convert.ToString(row["product_rating"]));
                        fp.hotSelling = Convert.ToString(row["hotselling"]);
                        fp.url = url;
                        fpList.Add(fp);
                        lastId = fp.id;
                    }
                }
                fpl.fp = fpList;
                fpl.id = lastId;

            }
            catch (Exception es)
            {

            }
            finally
            {
                con.Close();
            }

        }
        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public FeatureProductList PSCP(string val, string cat, int lastIdVal, string apiKey)
    {
        cat = cat.Trim();
        FeatureProductList fpl = new FeatureProductList();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                long lastId = lastIdVal;
                con.Open();
                // SqlCommand cmd = new SqlCommand("SELECT top 90 id,product_id,product_name,big_image,price,discount_price,product_rating,final_price,hotselling FROM product_details where sub_category='" + cat + "' and id>'" + lastIdVal + "' order by id ASC ", con);
                SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where sub_category='" + cat + "' order by id ASC ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                List<FeatureProducts> fpList = new List<FeatureProducts>();
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        FeatureProducts fp = new FeatureProducts();
                        string url = "Product/" + seourl(Convert.ToString(row["product_name"]));

                        fp.name = Convert.ToString(row["product_name"]);
                        fp.id = long.Parse(Convert.ToString(row["id"]));
                        fp.guid = Convert.ToString(row["product_id"]);
                        fp.finalPrice = Convert.ToString(row["final_price"]);
                        fp.image = Convert.ToString(row["big_image"]);
                        fp.rating = int.Parse(Convert.ToString(row["product_rating"]));
                        fp.hotSelling = Convert.ToString(row["sort_desc"]);
                        fp.url = url;
                        fpList.Add(fp);
                        //  lastId = fp.id;


                    }
                }
                fpl.fp = fpList;
                //fpl.id = lastId;

            }
            catch (Exception es)
            {

            }
            finally
            {
                con.Close();
            }
        }

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public List<SearchListPara> Acomp(string type, string para, string apiKey)
    {
        List<SearchListPara> slp = new List<SearchListPara>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT top 50  product_id,product_name,small_image,category,sub_category FROM product_details where category like '%" + para + "%' or sub_category like '%" + para + "%' or product_name like '%" + para + "%'  order by id ASC ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        SearchListPara fp = new SearchListPara();
                        fp.value = Convert.ToString(row["product_id"]);
                        fp.desc = Convert.ToString(row["category"]) + " , " + Convert.ToString(row["sub_category"]);
                        fp.label = Convert.ToString(row["product_name"]);
                        fp.icon = Convert.ToString(row["small_image"]);
                        slp.Add(fp);
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

        return slp;
    }
    [WebMethod(EnableSession = true)]
    public List<string> GetTags(string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT tags from tags order by tags ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        fpl.Add(Convert.ToString(row["tags"]));

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

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public List<string> GetPrevTags(string productId, string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT tags from add_tags where product_id='" + productId + "' order by tags ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {

                        fpl.Add(Convert.ToString(row["tags"]));

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

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public List<Product> PProduct(string apiKey)
    {
        List<Product> fpl = new List<Product>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_id,product_name from product_details order by product_name ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        pr.id = Convert.ToString(row["product_id"]);
                        pr.name = Convert.ToString(row["product_name"]);
                        fpl.Add(pr);

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

        return fpl;
    }


    [WebMethod(EnableSession = true)]
    public List<Product> PProductBrand(string apiKey)
    {
        List<Product> fpl = new List<Product>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_id,product_name from product_details order by product_name ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        Product pr = new Product();
                        pr.id = Convert.ToString(row["product_id"]);
                        pr.name = Convert.ToString(row["product_name"]);
                        fpl.Add(pr);

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

        return fpl;
    }


    [WebMethod(EnableSession = true)]
    public int AssignTags(string productId, string tags, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into add_tags(tags,product_id,added_by,added_on) values('" + tags + "','" + productId + "','" + Convert.ToString(Session["admin_id"]) + "','" + DateTime.Now.ToString() + "')", con);
                cmd.ExecuteNonQuery();
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }
    [WebMethod(EnableSession = true)]
    public List<string> GetCategoryInOrder(string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM category order by cast(other as int) ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        fpl.Add(Convert.ToString(row["category"]));

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

        return fpl;
    }



    [WebMethod(EnableSession = true)]
    public List<string> productInOrder(string subcategory, string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where sub_category='" + subcategory + "' order by cast(other_sort as int)  ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        fpl.Add(Convert.ToString(row["product_name"]));

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

        return fpl;
    }





    [WebMethod(EnableSession = true)]
    public List<string> BrandInOrder(string category, string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();// order by cast(other_sort as int)  ASC
                SqlCommand cmd = new SqlCommand("SELECT * FROM product_by_brand where brand_guid='" + category + "'  order by cast(other_sort as int)  ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        SqlCommand cmd1 = new SqlCommand("Select * from product_details where product_id='" + dr["product_id"] + "'", con);
                        SqlDataAdapter ad = new SqlDataAdapter(cmd1);
                        DataTable dt1 = new DataTable();
                        ad.Fill(dt1);
                        if (dt1.Rows.Count > 0)
                        {
                            fpl.Add(Convert.ToString(dt1.Rows[0]["product_name"]));
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

        return fpl;
    }



    [WebMethod(EnableSession = true)]
    public List<string> SubproductInOrder(string subcategory, string apiKey)
    {
        List<string> fpl = new List<string>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from category where category='" + subcategory + "'", con);
                SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                ad1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    SqlCommand cmd = new SqlCommand("SELECT *, (Select Count(category) from sub_category where category_id='" + dt1.Rows[0]["id"].ToString() + "') as Exp1 FROM sub_category where category_id='" + dt1.Rows[0]["id"].ToString() + "' order by cast(other_sort as int)  ASC", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            string cat_count = "", strProCount = GetCount(row["sub_category"].ToString());
                            fpl.Add(Convert.ToString(row["sub_category"]));

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

        return fpl;
    }

    public static string GetCount(string sub_cat)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
        string ss = "0";
        try
        {
            SqlCommand cmd = new SqlCommand("Select Count(id) as exp1 from product_details where sub_category='" + sub_cat + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            ss = ds.Rows[0]["exp1"].ToString();
        }
        catch (Exception exx)
        { }
        return ss;
    }



    [WebMethod(EnableSession = true)]
    public int ArrengeCategory(string category, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string[] str = category.Split(',');
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                for (int i = 0; i < str.Length; i++)
                {
                    SqlCommand cmd = new SqlCommand("update category set other='" + i + "' where category='" + str[i] + "'", con);
                    cmd.ExecuteNonQuery();
                }
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }


    [WebMethod(EnableSession = true)]
    public int ARRANGEProduct(string category, string apiKey, string subcategory)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string[] str = category.Split(',');
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                for (int i = 0; i < str.Length; i++)
                {
                    SqlCommand cmd = new SqlCommand("update product_details set other_sort='" + i + "' where product_name='" + str[i] + "' and sub_category='" + subcategory + "'", con);
                    cmd.ExecuteNonQuery();
                }
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }



    [WebMethod(EnableSession = true)]
    public int ARRANGEProductBrand(string category, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string[] str = category.Split(',');
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                for (int i = 0; i < str.Length; i++)
                {
                    SqlCommand cmd = new SqlCommand("update product_by_brand set other_sort='" + i + "' where product_name='" + str[i] + "'", con);
                    cmd.ExecuteNonQuery();
                }
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }

    [WebMethod(EnableSession = true)]
    public List<ProductOrderDetails> GetProductInOrder(string apiKey)
    {
        List<ProductOrderDetails> fpl = new List<ProductOrderDetails>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_id,product_name,small_image FROM product_details where isfeatured = 'Yes'  order by cast(home_display_order as int) ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        ProductOrderDetails pod = new ProductOrderDetails();
                        pod.id = Convert.ToString(row["product_id"]);
                        pod.name = Convert.ToString(row["product_name"]);
                        pod.image = Convert.ToString(row["small_image"]);
                        fpl.Add(pod);
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

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public int ArrengeProduct(string product, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string[] str = product.Split(',');
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                for (int i = 0; i < str.Length; i++)
                {
                    SqlCommand cmd = new SqlCommand("update product_details set home_display_order='" + (i + 1) + "' where product_id='" + str[i] + "'", con);
                    cmd.ExecuteNonQuery();
                }
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }
    [WebMethod(EnableSession = true)]
    public FeatureProductList PopulateFeatureCat(int lastIdVal, string apiKey, string category)
    {
        category = category.Trim();
        //WriteLog("[" + ISTINIDAtime().ToString() + "-   "+lastIdVal+"]  ---------------------------------------------------------------------------------------------------------- ");
        FeatureProductList fpl = new FeatureProductList();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (lastIdVal == int.Parse(Convert.ToString(Session["index"])) || int.Parse(Convert.ToString(Session["index"])) == 0)
        {

            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            string ipStr = ip.Replace("::ffff:", "");
            string ipStr1 = ipStr.Replace(".", "");
            string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
            if (apiKey == key)
            {
                string isfeatured = string.Empty;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
                try
                {
                    long lastId = lastIdVal;//long.Parse(lastIdVal1);
                    con.Open();
                    //top 9 id,product_id,product_name,big_image,price,discount_price,product_rating,final_price,hotselling,category_order_value
                    SqlCommand cmd = new SqlCommand("SELECT * FROM product_details where cast(category_order_value as int)>'" + lastIdVal + "' and category='" + category + "' order by  cast(category_order_value as int) ASC ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    List<FeatureProducts> fpList = new List<FeatureProducts>();
                    if (ds.Tables.Count > 0)
                    {
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            FeatureProducts fp = new FeatureProducts();
                            string url = "../Product/" + seourl(Convert.ToString(row["product_name"]));
                            productInfo pi = new productInfo();
                            if (Convert.ToString(row["final_price"]).ToLower() == "contact for price")
                            {
                                fp.finalPrice = "contact for price";

                            }
                            else
                            {
                                fp.finalPrice = pi.UnitPrice("INR", long.Parse(Convert.ToString(row["final_price"]))).ToString();
                            }
                            fp.name = Convert.ToString(row["product_name"]);
                            fp.id = long.Parse(Convert.ToString(row["id"]));
                            fp.guid = Convert.ToString(row["product_id"]);
                            fp.image = "http://tamazglobal.com/" + Convert.ToString(row["big_image"]);
                            fp.rating = int.Parse(Convert.ToString(row["product_rating"]));
                            fp.hotSelling = Convert.ToString(row["hotselling"]);
                            fp.url = url;
                            fpList.Add(fp);
                            if (lastId < int.Parse(Convert.ToString(row["category_order_value"])))
                            {
                                lastId = int.Parse(Convert.ToString(row["category_order_value"]));
                            }
                        }
                    }
                    fpl.fp = fpList;
                    fpl.id = lastId;
                    Session["index"] = lastId.ToString();
                    //WriteLog("[" + ISTINIDAtime().ToString() + "]  Last Id- " + lastId);

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

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public List<ProductOrderDetails> CWGetProductInOrder(string apiKey, string category)
    {
        List<ProductOrderDetails> fpl = new List<ProductOrderDetails>();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT product_id,product_name,small_image FROM product_details where category='" + category + "'  order by cast(category_order_value as int) ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        ProductOrderDetails pod = new ProductOrderDetails();
                        pod.id = Convert.ToString(row["product_id"]);
                        pod.name = Convert.ToString(row["product_name"]);
                        pod.image = Convert.ToString(row["small_image"]);
                        fpl.Add(pod);
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

        return fpl;
    }
    [WebMethod(EnableSession = true)]
    public int CWArrengeProduct(string product, string apiKey)
    {
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            string[] str = product.Split(',');
            string isfeatured = string.Empty;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                for (int i = 0; i < str.Length; i++)
                {
                    SqlCommand cmd = new SqlCommand("update product_details set category_order_value='" + (i + 1) + "' where product_id='" + str[i] + "'", con);
                    cmd.ExecuteNonQuery();
                }
                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }
    [WebMethod(EnableSession = true)]
    public int GLPSignIn(string productGuid, string quantity, string message, string name, string email, string mobile, string apiKey)
    {
        productInfo obj = new productInfo();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into get_latest_price(req_guid,product_guid,quantity,message,posted_on,ip,name,email,mobile,status) values('" + Guid.NewGuid().ToString() + "','" + productGuid + "','" + quantity + "','" + message + "','" + obj.ISTINIDAtime().ToString() + "','" + ipStr + "','" + name + "','" + email + "','" + mobile + "','Open')", con);
                cmd.ExecuteNonQuery();
                status = 0;

            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }
    [WebMethod(EnableSession = true)]
    public int GLPSignUP(string productGuid, string email, string password, string quantity, string message, string name, string mobile, string apiKey)
    {
        productInfo obj = new productInfo();
        String ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int status = 1;
        if (string.IsNullOrEmpty(ip))
        {
            ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        string ipStr = ip.Replace("::ffff:", "");
        string ipStr1 = ipStr.Replace(".", "");
        string key = "9e7031e1-6052-4955-8dcf-574021f3efc2-a1203f88-03dc-43f3-ad9b-90e8d1113c80" + ipStr1;
        if (apiKey == key)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con2"].ToString());
            try
            {
                con.Open();
                string user_guid = Guid.NewGuid().ToString();
                SqlCommand cmd = new SqlCommand("insert into customer_detail(customer_id,customer_name,password,email,mobile) values('" + user_guid + "','" + name + "','" + password + "','" + email + "','" + mobile + "')", con);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("insert into get_latest_price(user_guid,product_guid,quantity,message,posted_on,ip) values('" + user_guid + "','" + productGuid + "','" + quantity + "','" + message + "','" + obj.ISTINIDAtime().ToString() + "','" + ipStr + "')", con);
                cmd.ExecuteNonQuery();

                status = 0;
            }
            catch (Exception es)
            {
                status = 1;
            }
            finally
            {
                con.Close();
            }
        }

        return status;
    }
}
