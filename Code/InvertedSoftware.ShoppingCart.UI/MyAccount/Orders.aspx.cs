using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class MyAccount_Orders : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            OrdersObjectDataSource.SelectParameters["CustomerID"].DefaultValue = GetLoggedCustomerID().ToString();
    }

    public string GetDownloadText(object downloadURL, object downloadKey)
    {
        if (downloadURL == null)
            return string.Empty;

        string downloadURLText = Convert.ToString(downloadURL);
        string downloadKeyText = Convert.ToString(downloadKey);
        string downloadText = string.Empty;
        if (!string.IsNullOrWhiteSpace(downloadURLText))
            downloadText += @"<br><a href=""" + downloadURLText + @""" target=""_blank"">Download</a>";
        if (!string.IsNullOrWhiteSpace(downloadKeyText))
            downloadText += @"<br>Key:" + downloadKeyText;

        return downloadText;
    }
}
