using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class UserControls_CartSummaryControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindControls();
    }

    public void bindControls()
    {
        Cart cart = ((BasePage)this.Page).Cart;
        if (cart != null)
        {
            CartSummaryRepeater.Visible = true;
            CartSummaryRepeater.DataSource = cart.CartItems;
            CartSummaryRepeater.DataBind();
        }
        else
        {
            CartSummaryRepeater.Visible = false;
            CartSummaryRepeater.DataSource = null;
        }

    }
}
