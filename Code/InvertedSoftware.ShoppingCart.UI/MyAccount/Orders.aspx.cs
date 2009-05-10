using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class MyAccount_Orders : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            OrdersObjectDataSource.SelectParameters["CustomerID"].DefaultValue = GetLoggedCustomerID().ToString();
    }
}
