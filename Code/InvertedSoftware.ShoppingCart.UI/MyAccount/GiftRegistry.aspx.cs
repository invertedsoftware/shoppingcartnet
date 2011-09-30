using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class MyAccount_GiftRegistry : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindRegistry();
    }
    protected void GiftRegistryListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            GiftRegistries.RemoveGiftRegistryProduct(GetLoggedCustomerID(), Convert.ToInt32(e.CommandArgument));
            BindRegistry();
        }
    }

    private void BindRegistry()
    {
        GiftRegistryListView.DataSource = GiftRegistries.GetGiftRegistry(0, GetLoggedCustomerID(), string.Empty, true).Products;
        GiftRegistryListView.DataBind();
    }
}