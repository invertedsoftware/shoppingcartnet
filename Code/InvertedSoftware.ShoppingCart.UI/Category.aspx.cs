﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class Category : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindProducts();
    }

    public void BindMenu()
    {
       
    }

    public void BindProducts()
    {
        int pageNumber = WebUtility.LoadInt32FromQueryString("Page");
        if (pageNumber == -1) pageNumber = 0;
        int categoryID = WebUtility.LoadInt32FromQueryString("CategoryID");
        if (categoryID == -1) categoryID = 1;
        
        ProductsGrid.PageNumber = pageNumber;
        ProductsGrid.PageSize = 4;
        ProductsGrid.Columns = 3;
        Products products = new Products();
        ProductsGrid.DataSource = products.GetProducts(categoryID, pageNumber, ProductsGrid.PageSize);
        ProductsGrid.TotalRecords = products.ProductCount;
        ProductsGrid.DataBind();
    }
}