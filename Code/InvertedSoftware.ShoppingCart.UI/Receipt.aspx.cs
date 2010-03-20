using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class Receipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CustomerID = WebUtility.GetDecodedIntFromQueryString("CustomerID");
        OrderID = WebUtility.GetDecodedIntFromQueryString("OrderID");
        if (CustomerID > -1 && OrderID > -1)
        {
            Order = Orders.GetOrder(OrderID);
            if (Order.CustomerID != CustomerID)
                Response.Redirect("Default.aspx");
            else
            {
                Customer = Customers.GetCustomer(CustomerID);
            }
        }
    }

    #region Properties
    public int CustomerID { get; set; }
    public int OrderID { get; set; }
    public Order Order { get; set; }
    public Customer Customer { get; set; }
    public string State
    {
        get
        {
            if (!Order.StateID.HasValue)
                return string.Empty;
            CacheManager cache = new CacheManager();
            return cache.GetCachedLookupTable(LookupDataEnum.GetStates).FindByValue(Order.StateID.Value.ToString()).Text;
        }
    }
    public string Province
    {
        get
        {
            if (!Order.ProvinceID.HasValue)
                return string.Empty;
            CacheManager cache = new CacheManager();
            return cache.GetCachedLookupTable(LookupDataEnum.GetProvinces).FindByValue(Order.ProvinceID.Value.ToString()).Text;
        }
    }
    public string Country
    {
        get
        {
            CacheManager cache = new CacheManager();
            return cache.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByValue(Order.CountryID.ToString()).Text;
        }
    }
    #endregion
}
