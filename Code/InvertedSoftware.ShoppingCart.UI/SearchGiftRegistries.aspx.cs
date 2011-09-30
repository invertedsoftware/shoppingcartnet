using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class SearchGiftRegistries : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if(!Page.IsValid)
            return;
        GiftRegistry = GiftRegistries.GetGiftRegistry(0, 0, EmailTextBox.Text, true);
        GiftRegistryListView.DataSource = GiftRegistry.Products;
        GiftRegistryListView.DataBind();
    }

    public GiftRegistry GiftRegistry { get; set; }
}