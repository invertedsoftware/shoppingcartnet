using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

public partial class UserControls_ProductBreadcrumbControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BreadcrumbRepeater.DataSource = Categories.GetProductCategories(ProductID);
            BreadcrumbRepeater.DataBind();
        }
    }

    public List<Category> GetParentCategories(int categoryID)
    {
        if (categoryID == 0)
            return null;
        List<Category> categories = new List<Category>();
        categories.Add(CacheManager.GetCachedCategories().FirstOrDefault(c => c.CategoryID == categoryID));
        categories = LoadParentCategories(categoryID, categories);
        return categories;
    }

    private List<Category> LoadParentCategories(int categoryID, List<Category> categories)
    {
        var parents = CacheManager.GetCachedCategories().Where(c => c.ParentCategoryID == categoryID);
        categories.AddRange(parents);
        foreach (Category item in parents)
            LoadParentCategories(item.CategoryID, categories);
        return categories;
    }

    public int ProductID { get; set; }
}