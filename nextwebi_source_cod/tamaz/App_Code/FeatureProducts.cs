using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for FeatureProducts
/// </summary>
public class FeatureProducts
{
    public long id { get; set; }
    public string name { get; set; }
    public string guid { get; set; }
    public string image { get; set; }
    public string price { get; set; }
    public string discount { get; set; }
    public int rating { get; set; }
    public string finalPrice { get; set; }
    public string hotSelling { get; set; }
    public string url { get; set; }

}
public class FeatureProductList
{
    public List<FeatureProducts> fp { get; set; }
    public long id { get; set; }
}
public class SearchListPara
{
    public string value { get; set; }
    public string label { get; set; }
    public string desc { get; set; }
    public string icon { get; set; }
}
public class Product
{
    public string name { get; set; }
    public string id { get; set; }
}
public class ProductOrderDetails
{
    public string name { get; set; }
    public string id { get; set; }
    public string image { get; set; }
}
public class LatestPrice
{
    public string reqGuid { get; set; }
    public string productGuid { get; set; }
    public string quantity { get; set; }
    public string message { get; set; }
    public string postedOn { get; set; }
    public string ip { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
}
public class QuickQuery
{
    public string name { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public string message { get; set; }
    public string status { get; set; }
    public string queryGuid { get; set; }
    public string website { get; set; }
    public string ip { get; set; }
    public string type { get; set; }
    public string product { get; set; }
    public string localPin { get; set; }
    public string globalPin { get; set; }
    public string postedOn { get; set; }
}
public class QueryEmail
{
    public string fromEmail { get; set; }
    public string fromName { get; set; }
    public string toEmail { get; set; }
    public string ccEmail { get; set; }
    public string replyTo { get; set; }
    public string replyName{get;set;}
    public string body { get; set; }
    public string subject { get; set; }
    public string uid { get; set; }
    public string pwd { get; set; }
}
public class EmailSubscription
{
    public string email { get; set; }
    public string status { get; set; }
    public string time { get; set; }
}
public class WhatsappSubscription
{
    public string mobile { get; set; }
    public string status { get; set; }
    public string time { get; set; }
}
public class vendor
{
    public string vendorGuid { get; set; }
    public string name { get; set; }
    public string company { get; set; }
    public string category { get; set; }
    public string email { get; set; }
    public string emailVerification { get; set; }
    public string mobile { get; set; }
    public string mobileVerification { get; set; }
    public string landline { get; set; }
    public string country { get; set; }
    public string state { get; set; }
    public string city { get; set; }
    public string address { get; set; }
    public string fileAddress { get; set; }
    public string time { get; set; }
}
public class status
{
    public int val { get; set; }
    public string message { get; set; }
    public DataSet data { get; set; }
}

public class consulting1
{
    public string consultingGuid { get; set; }
    public string name { get; set; }
    public string mobile { get; set; }
    public string email { get; set; }
    public string requirement { get; set; }
    public string country { get; set; }
    public string state { get; set; }
    public string city { get; set; }
    public string address { get; set; }
    public string time { get; set; }


}