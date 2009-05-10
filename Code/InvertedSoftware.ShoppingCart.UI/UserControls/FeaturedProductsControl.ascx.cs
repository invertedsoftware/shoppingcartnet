using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_FeaturedProductsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ProductsSummaryRepeater_PreRender(object sender, EventArgs e)
    {
        if (ProductsSummaryRepeater.Items.Count == 0)
            ProductsSummaryRepeater.Visible = false;
    }
}
