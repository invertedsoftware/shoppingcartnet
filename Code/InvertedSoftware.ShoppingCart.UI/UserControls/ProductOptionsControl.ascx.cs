using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class UserControls_ProductOptionsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    public void BindGroups()
    {
        //Get groups
        GroupsRepeater.DataSource = productOptions.GroupBy(a => a.ProductOptionGroup);
        GroupsRepeater.DataBind();
    }

    private int productID;
    private List<ProductOption> productOptions;

    public int ProductID {
        get
        {
            return productID;
        }
        set
        {
            productID = value;
            productOptions = Products.GetProductOptions(productID);
            if (!Page.IsPostBack)
                BindGroups();
        }
    }

    public List<ProductOption> SelectedOptions
    {
        get
        {
            List<ProductOption> selectedOptions = new List<ProductOption>();
            RepeaterItemCollection items = GroupsRepeater.Items;
            foreach (RepeaterItem item in items)
            {
                DropDownList OptionDropDownList = item.FindControl("OptionDropDownList") as DropDownList;
                if (OptionDropDownList == null)
                    continue;
                selectedOptions.Add(productOptions.Where(a=>a.ProductOptionID == Convert.ToInt32(OptionDropDownList.SelectedValue)).First());
            }
            return selectedOptions;
        }
    }
  
    protected void GroupsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //Bind Options for Group
        Label GroupLabel = e.Item.FindControl("GroupLabel") as Label;
        DropDownList OptionDropDownList = e.Item.FindControl("OptionDropDownList") as DropDownList;
        if (GroupLabel == null || OptionDropDownList == null)
            return;
        var options = productOptions.Where(a => a.ProductOptionGroup.Equals(GroupLabel.Text));
        foreach (var option in options)
        {
            if (option.PriceChange >= 0)
                OptionDropDownList.Items.Add(new ListItem(option.ProductOptionName + " (Add " + option.PriceChange.ToString("c") + ")", option.ProductOptionID.ToString()));
            else
                OptionDropDownList.Items.Add(new ListItem(option.ProductOptionName + " (Reduce " + (-option.PriceChange).ToString("c") + ")", option.ProductOptionID.ToString()));
        }
    }
}
