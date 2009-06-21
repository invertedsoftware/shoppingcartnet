using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.BusinessLayer;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class Product : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RelatedProductsControl1.ProductID = CartProduct.ProductID.ToString();
        ProductOptionsControl1.ProductID = CartProduct.ProductID;
        CustomFieldsControl1.ProductID = CartProduct.ProductID;
    }

    InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product cartProduct;

    public InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product CartProduct
    {
        get
        {
            if (cartProduct == null)
            {
                string productName = Request.QueryString["Product"];
                if (!string.IsNullOrEmpty(productName))
                {
                    Products products = new Products();
                    cartProduct = products.GetProduct(productName);
                }
                if (cartProduct == null)
                    Response.Redirect("/Default.aspx");
            }
            return cartProduct;
        }
        set
        {
            cartProduct = value;
        }
    }

    private List<string> productImages = null;

    public List<string> ProductImages
    {
        get
        {
            if (productImages == null)
            {
                Products products = new Products();
                productImages = products.GetProductImages(CartProduct.ProductID, true);
            }
            return productImages;
        }
    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        DeleteSavedCart();
        CartManager manager = new CartManager(this.Cart);
        manager.Add(new CartItem() { CatalogNumber = CartProduct.CatalogNumber, PricePerUnit = CartProduct.price, ProductID = CartProduct.ProductID, ProductName = CartProduct.ProductName, Quantity = Convert.ToInt32(QtyTextBox.Text), ProductOptions = ProductOptionsControl1.SelectedOptions, CustomFields = CustomFieldsControl1.CustomFields });
        this.Cart = manager.ShoppingCart;
        Response.Redirect("ShoppingCart.aspx");
    }

    public void DeleteSavedCart()
    {
        if (HttpContext.Current.Profile["ShoppingCart"] != null)
        {
            Profile.ShoppingCart = null;
            Profile.Save();
        }
    }


}
