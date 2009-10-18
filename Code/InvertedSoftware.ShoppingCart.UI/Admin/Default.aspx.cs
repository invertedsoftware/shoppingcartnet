using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Web.UI.DataVisualization.Charting;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.Dynamic;


public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        System.Collections.IList visibleTables = MetaModel.Default.VisibleTables;
        if (visibleTables.Count == 0) {
            throw new InvalidOperationException("There are no accessible tables. Make sure that at least one data model is registered in Global.asax and scaffolding is enabled or implement custom pages.");
        }
        Menu1.DataSource = visibleTables;
        Menu1.DataBind();
        if (!Page.IsPostBack)
        {
            BindYearsDropDown();
            BindSalesChart(DateTime.Now.Year);
        }
    }

    public void BindYearsDropDown()
    {
        for(int i = DateTime.Now.Year - 20;i < DateTime.Now.Year + 20;i++)
            YearsDropDownList.Items.Add(new ListItem(i.ToString(), i.ToString()));
        YearsDropDownList.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
    }

    public void BindSalesChart(int year)
    {
        using (CartDataClassesDataContext context = new CartDataClassesDataContext())
        {
            var sales = from o in context.Orders
                        where o.DatePlaced.Value.Year == year
                        group o by o.DatePlaced.Value.Month into g
                        select new {Month = g, Orders = g.Count()};

            foreach (var sale in sales)
                SalesChart.Series["Series1"].Points.AddXY(Enum.Parse(typeof(Month), sale.Month.FirstOrDefault().DatePlaced.Value.Month.ToString()).ToString(), (double)sale.Orders);
        }
    }

    protected void YearsDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSalesChart(Convert.ToInt32(YearsDropDownList.SelectedValue));
    }
}
