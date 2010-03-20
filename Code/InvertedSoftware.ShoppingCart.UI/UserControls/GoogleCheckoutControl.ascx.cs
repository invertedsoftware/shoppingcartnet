using System;
using System.IO;
using System.Text;
using System.Configuration;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;
using InvertedSoftware.ShoppingCart.Intergration;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.Cache;

public partial class UserControls_GoogleCheckoutControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            GoogleImageButton.ImageUrl = String.Format(ConfigurationManager.AppSettings["GoogleImageButtonURL"], ConfigurationManager.AppSettings["GoogleMerchantID"]);
    }

    public string GetGoogleCartCode()
    {
        StringBuilder cartXML = new StringBuilder();

        Cart cart = ((BasePage)this.Page).Cart;
        CheckoutShoppingCart googleCart = new CheckoutShoppingCart();
        googleCart.shoppingcart = new ShoppingCart();
        googleCart.shoppingcart.items = new Item[cart.CartItems.Count];

        for (int i = 0; i < googleCart.shoppingcart.items.Length; i++)
        {
            googleCart.shoppingcart.items[i] = new Item();
            googleCart.shoppingcart.items[i].merchantitemid = cart.CartItems.ElementAt(i).CatalogNumber;
            googleCart.shoppingcart.items[i].quantity = cart.CartItems.ElementAt(i).Quantity;
            googleCart.shoppingcart.items[i].unitprice = new Money() { Value = cart.CartItems.ElementAt(i).PricePerUnit, currency = "USD" };
            googleCart.shoppingcart.items[i].itemname = cart.CartItems.ElementAt(i).ProductName;
            foreach (ProductOption option in cart.CartItems.ElementAt(i).ProductOptions)
            {
                googleCart.shoppingcart.items[i].itemname += " " + option.ProductOptionName;
                googleCart.shoppingcart.items[i].unitprice.Value += option.PriceChange;
            }
            foreach (CustomField field in cart.CartItems.ElementAt(i).CustomFields)
                googleCart.shoppingcart.items[i].itemname += " " + field.CustomFieldName + ": " + field.CustomFieldValue;
            googleCart.shoppingcart.items[i].itemdescription = cart.CartItems.ElementAt(i).ProductName;
        }
        googleCart.checkoutflowsupport = new CheckoutShoppingCartCheckoutflowsupport();
        googleCart.checkoutflowsupport.Item = new MerchantCheckoutFlowSupport();
        googleCart.checkoutflowsupport.Item.shippingmethods = GetGoogleShippingMethods();

        XmlWriter writer = XmlWriter.Create(cartXML);
        XmlSerializer serializer = new XmlSerializer(typeof(CheckoutShoppingCart));
        serializer.Serialize(writer, googleCart);
        writer.Close();

        return cartXML.ToString();
    }

    private MerchantCheckoutFlowSupportShippingmethods GetGoogleShippingMethods()
    {
        CacheManager cache = new CacheManager();
        ListItemCollection shippingCollection = cache.GetCachedLookupTable(LookupDataEnum.GetShippingPoviders);
  
        MerchantCheckoutFlowSupportShippingmethods shipping = new MerchantCheckoutFlowSupportShippingmethods();
        shipping.Items = new object[shippingCollection.Count];
        int currentItem = 0;
        foreach (ListItem item in shippingCollection)
        {
            if (string.IsNullOrEmpty(item.Value))
                continue;
            FlatRateShipping rate = new FlatRateShipping();
            rate.name = item.Text;
            rate.price = new FlatRateShippingPrice() { currency = "USD", Value = Orders.GetShippingCosts(Convert.ToInt32(item.Value)) };
            shipping.Items[currentItem] = rate;
            currentItem++;
        }
        
        return shipping;
    }

    protected void GoogleImageButton_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string orderXML = GetGoogleCartCode();
            string googleResponse = Utils.PostToURL(String.Format(ConfigurationManager.AppSettings["GoogleCheckoutURL"], ConfigurationManager.AppSettings["GoogleMerchantID"]), orderXML, ConfigurationManager.AppSettings["GoogleMerchantID"], ConfigurationManager.AppSettings["GoogleMerchantkey"]);
            TextReader reader = new StringReader(googleResponse);
            XmlSerializer serializer = new XmlSerializer(typeof(CheckoutRedirect));
            CheckoutRedirect redirect = (CheckoutRedirect)serializer.Deserialize(reader);
            Response.Redirect(redirect.redirecturl);
        }
        catch (Exception ex)
        {
            MessageLabel.Text = "Problem using Google Checkout.";
        }
    }
}
