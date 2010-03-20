using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class UserControls_ProductsGridControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Navigation Properties
    public int TotalRecords { get; set; }
    public int PageNumber { get; set; }
    public int PageSize { get; set; }

    public int PageCount
    {
        get
        {
            if (TotalRecords <= 0 || PageSize <= 0)
                return 1;
            else
                return ((TotalRecords + PageSize) - 1) / PageSize;
        }
    }
    #endregion

    #region Layout Properties
    public int Columns { get; set; } 
    #endregion

    public List<Product> DataSource
    {
        set { ProductsRepeater.DataSource = value; }
    }
    public override void DataBind()
    {
        ProductsRepeater.DataBind();
        if (PageCount > 1)
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "NumericPaging", "showPager(" + PageNumber + ", " + PageSize + ", " + TotalRecords + ", " + PageCount + ");", true);
    }

    #region Events
    protected void ProductsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            DeleteSavedCart();
            HiddenField ProductIDHiddenField = (HiddenField)((RepeaterItem)e.Item).FindControl("ProductIDHiddenField");
            int productID = 0;
            if (!int.TryParse(ProductIDHiddenField.Value, out productID))
                return;
            CartManager manager = new CartManager(((BasePage)Page).Cart);
            manager.Add(productID);
            ((BasePage)Page).Cart = manager.ShoppingCart;
            Response.Redirect("ShoppingCart.aspx");
        }
        else if (e.CommandName == "Customize")
        {
            Label ProductNameLabel = e.Item.FindControl("ProductNameLabel") as Label;
            Response.Redirect("Product.aspx?Product=" + HttpUtility.UrlEncode(ProductNameLabel.Text));
        }
    }
    protected void ProductsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Separator)
            if (((e.Item.ItemIndex + 1) * 2 % Columns) != 0)
                e.Item.Visible = false;

        Button AddButton = e.Item.FindControl("AddButton") as Button;
        HiddenField ProductIDHiddenField = e.Item.FindControl("ProductIDHiddenField") as HiddenField;
        if (AddButton == null || ProductIDHiddenField == null)
            return;
        if (Products.IsProductOptionsExist(Convert.ToInt32(ProductIDHiddenField.Value)))
        {
            AddButton.Text = "Customize";
            AddButton.CommandName = "Customize";
        }
    }
    #endregion

    public void DeleteSavedCart()
    {
        if (HttpContext.Current.Profile["ShoppingCart"] != null)
        {
            Profile.ShoppingCart = null;
            Profile.Save();
        }
    }
}
