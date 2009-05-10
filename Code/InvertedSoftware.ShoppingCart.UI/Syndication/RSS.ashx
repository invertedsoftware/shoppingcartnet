<%@ WebHandler Language="C#" Class="RSS" %>

using System;
using System.Web;
using System.Xml;
using System.ServiceModel.Syndication;

using InvertedSoftware.ShoppingCart.BusinessLayer;

public class RSS : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        int categoryID = WebUtility.LoadInt32FromQueryString("CategoryID");
        context.Response.ContentType = "text/xml";
        FeedItems feedItems = new FeedItems();
        XmlWriter rssWriter = XmlWriter.Create(context.Response.OutputStream);
        Atom10FeedFormatter rssFormatter = new Atom10FeedFormatter(feedItems.GetCategoryProducts(categoryID));
        rssFormatter.WriteTo(rssWriter);
        rssWriter.Close();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}