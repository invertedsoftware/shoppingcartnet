using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

public partial class UserControls_MenuControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindMenu();
    }
    
    private void BindMenu()
    {
        SiteMenu.Items.Add(new MenuItem("Home", "Home", null, "../Default.aspx"));
        //Get list of pages and dynamic categories
        MenuItem Categories = new MenuItem("Shop", "Shop", null, "../Default.aspx");
        var categories = CacheManager.GetCachedCategories().Where(c=> !c.ParentCategoryID.HasValue);
        foreach (Category category in categories)
        {
            Categories.ChildItems.Add(new MenuItem(category.CategoryName, category.CategoryID.ToString(), null, "../Category.aspx?Category=" + HttpUtility.UrlEncode(category.CategoryName) + "&CategoryID=" + category.CategoryID));
        }
        SiteMenu.Items.Add(Categories);

        //Add all pages here
        SiteMenu.Items.Add(new MenuItem("FAQ", "FAQ", null, "../FAQ.aspx"));
        SiteMenu.Items.Add(new MenuItem("Support", "Customer Support", null, "../Support.aspx"));
        SiteMenu.Items.Add(new MenuItem("Contact Us", "Contact", null, "../Contact.aspx"));
        SiteMenu.Items.Add(new MenuItem("Company", "Company", null, "../Company.aspx"));
        SiteMenu.Items.Add(new MenuItem("My Account", "My Account", null, "../MyAccount/Default.aspx"));
        SiteMenu.Items.Add(new MenuItem("View My Cart", "My Account", null, "../ShoppingCart.aspx"));
    }
}
