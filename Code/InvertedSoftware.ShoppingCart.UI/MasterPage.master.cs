using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            Page.Title = ConfigurationManager.AppSettings["StoreName"];
    }


    protected void SearchTextBox_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/Search.aspx?Keyword=" + HttpUtility.UrlEncode(SearchTextBox.Text));
    }
}
