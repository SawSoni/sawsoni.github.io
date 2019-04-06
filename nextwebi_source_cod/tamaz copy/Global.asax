<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterProducts(RouteTable.Routes);
    }
    void RegisterProducts(RouteCollection routes)
    {
        //routes.Ignore("{resource}.axd/{*pathInfo}");
        routes.Clear();
        routes.MapPageRoute("Product", "Product/{ProductName}", "~/Product.aspx");
        routes.MapPageRoute("SubCategory", "SubCategory/{SubCategoryName}", "~/SubCategory.aspx");
        routes.MapPageRoute("Category", "Category/{CategoryName}", "~/Category.aspx");
        routes.MapPageRoute("Blogs", "Blogs/{BlogName}", "~/BlogDesc.aspx");
        routes.MapPageRoute("Brands", "TopBrands/{BrandName}", "~/products-by-brands.aspx");
        //routes.MapPageRoute("CategoryDefault", "", "~/Category/Default.aspx");

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
	
       void Application_BeginRequest(object sender, EventArgs e)
   {
   String WebsiteURL = Request.Url.ToString().Split('?')[0];
       String[] SplitedURL = WebsiteURL.Split('/');
       String[] Temp = SplitedURL[SplitedURL.Length - 1].Split('.');

       // This is for aspx page
       if (!WebsiteURL.Contains(".aspx") && Temp.Length == 1 && !WebsiteURL.Contains(".asmx"))
       {
           if (!string.IsNullOrEmpty(Temp[0].Trim()))
           {		   
               string ss = Temp[0].Split('?')[0];			   
               if (ss != "Admin" && ss != "admin")
                   Context.RewritePath(Temp[0] + ".aspx");
           }
       }
   }
</script>
