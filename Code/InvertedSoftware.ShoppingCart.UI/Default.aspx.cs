using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.Common;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //If store is not configurated, show configuration screen
        if (!Utils.IS_CONFIGURED && ConfigurationManager.AppSettings["SetupRan"] == "true")
            Utils.IS_CONFIGURED = true;
        else if (!Utils.IS_CONFIGURED)
            Response.Redirect("Setup/Default.aspx");
        if (!Page.IsPostBack)
            Page.Title = ConfigurationManager.AppSettings["StoreName"];
    }
}
