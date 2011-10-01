using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class MyAccount_GiftRegistry : BasePage
{
    private GiftRegistry giftRegistry = null;

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
        giftRegistry = GiftRegistries.GetGiftRegistry(0, GetLoggedCustomerID(), string.Empty, true);
        GiftRegistryListView.DataSource = giftRegistry.Products;
        GiftRegistryListView.DataBind();
        if (giftRegistry.IsPublic)
            VisibilityRadioButtonList.SelectedValue = "true";
        else
            VisibilityRadioButtonList.SelectedValue = "false";
    }

    protected void VisibilityRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (giftRegistry == null)
            giftRegistry = GiftRegistries.GetGiftRegistry(0, GetLoggedCustomerID(), string.Empty, true);

        // Create a registry if it doesnt exist
        if (giftRegistry.GiftRegistryID == 0)
        {
            giftRegistry = new GiftRegistry() { CustomerID = GetLoggedCustomerID(), DateCreated = DateTime.Now, Active = true };
            giftRegistry.GiftRegistryID = GiftRegistries.AddGiftRegistry(giftRegistry);
        }
        GiftRegistries.UpdateGiftRegistryPublic(giftRegistry.GiftRegistryID, Convert.ToBoolean(VisibilityRadioButtonList.SelectedValue));
    }
}