using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TagsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TagsRepeater_PreRender(object sender, EventArgs e)
    {
        if (TagsRepeater.Items.Count == 0)
            TagsRepeater.Visible = false;
    }
}
