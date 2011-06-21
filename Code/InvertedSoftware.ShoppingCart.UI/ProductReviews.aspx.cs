using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;

public partial class ProductReviews : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProductReviewsControl1.Visible = CartProduct.IsReviewEnabled;
        ProductReviewsControl1.ProductID = CartProduct.ProductID;
    }

    InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product cartProduct;

    public InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product CartProduct
    {
        get
        {
            if (cartProduct == null)
            {
                int productID = WebUtility.GetDecodedIntFromQueryString("ProductID");
                if (productID > 0)
                {
                    if (bool.Parse(ConfigurationManager.AppSettings["IsProductCacheEnabled"]))
                        cartProduct = CacheManager.GetProduct(productID);
                    else
                        cartProduct = Products.GetProduct(productID);
                }
            }
            return cartProduct;
        }
        set
        {
            cartProduct = value;
        }
    }
}