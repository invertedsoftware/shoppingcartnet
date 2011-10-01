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
    string registry = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        registry = WebUtility.LoadStringFromQueryString("Registry", 200, true);
        if (!string.IsNullOrWhiteSpace(registry))
        {
            EmailTextBox.Text = registry;
            BindRegistry();
        }
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if(!Page.IsValid)
            return;
        BindRegistry();
    }

    private void BindRegistry()
    {
        GiftRegistry = GiftRegistries.GetGiftRegistry(0, 0, EmailTextBox.Text, true);
        if (GiftRegistry.IsPublic || GetLoggedCustomerID() > -1)
        {
            GiftRegistryListView.DataSource = GiftRegistry.Products;
            GiftRegistryListView.DataBind();
        }
        else if (!GiftRegistry.IsPublic)
            PrivateListLiteral.Visible = true;
    }

    public GiftRegistry GiftRegistry { get; set; }
}