using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;
using InvertedSoftware.ShoppingCart.Common;


public partial class Search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindProducts();
            Page.Title = StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName);
        }
    }

    public void BindMenu()
    {

    }

    public void BindProducts()
    {
        int pageNumber = WebUtility.LoadInt32FromQueryString("Page");
        if (pageNumber == -1) pageNumber = 0;
        string keyword = WebUtility.LoadStringFromQueryString("Keyword", 200, true);
        string tag = WebUtility.LoadStringFromQueryString("Tag", 200, true);
        if (string.IsNullOrEmpty(keyword) && string.IsNullOrEmpty(tag))
            Response.Redirect("Default.aspx");

        ProductsGrid.PageNumber = pageNumber;
        ProductsGrid.PageSize = 4;
        ProductsGrid.Columns = 3;
        Products products = new Products();
        if (!string.IsNullOrEmpty(keyword))
            ProductsGrid.DataSource = products.SearchProducts(keyword, pageNumber, ProductsGrid.PageSize);
        else if (!string.IsNullOrEmpty(tag))
            ProductsGrid.DataSource = products.GetProductsByTags(tag, pageNumber, ProductsGrid.PageSize);
        ProductsGrid.TotalRecords = products.ProductCount;
        ProductsGrid.DataBind();
    }
}
