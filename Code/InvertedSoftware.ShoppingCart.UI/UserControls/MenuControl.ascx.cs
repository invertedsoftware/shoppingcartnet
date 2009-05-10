using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;

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
        MenuItem Categories = new MenuItem("Shop");
        CacheManager cache = new CacheManager();
        ListItemCollection categoryCollection = cache.GetCachedCategories(null);
        foreach (ListItem item in categoryCollection)
        {
            Categories.ChildItems.Add(new MenuItem(item.Text, item.Value, null, "../Category.aspx?Category=" + HttpUtility.UrlEncode(item.Text) + "&CategoryID=" + item.Value));
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
