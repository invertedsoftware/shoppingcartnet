using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.BusinessLayer;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

using InvertedSoftware.ShoppingCart.DataLayer.Cache;

public partial class Product : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RelatedProductsControl1.ProductID = CartProduct.ProductID.ToString();
        ProductOptionsControl1.ProductID = CartProduct.ProductID;
        CustomFieldsControl1.ProductID = CartProduct.ProductID;
        if (!Page.IsPostBack)
            CheckProductInventory();
    }

    InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product cartProduct;

    public InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Product CartProduct
    {
        get
        {
            if (cartProduct == null)
            {
                // First look for a product ID
                int productID = WebUtility.GetDecodedIntFromQueryString("ProductID");
                if (productID > 0)
                {
                    if (bool.Parse(ConfigurationManager.AppSettings["IsProductCacheEnabled"]))
                        cartProduct = CacheManager.GetProduct(productID);
                    else
                        cartProduct = Products.GetProduct(productID);
                }
                else
                {
                    // Then fall back on product name
                    string productName = Request.QueryString["Product"];
                    if (string.IsNullOrEmpty(productName))
                        productName = Page.RouteData.Values["Product"] as string;

                    if (!string.IsNullOrEmpty(productName))
                    {
                        cartProduct = Products.GetProduct(productName);
                    }
                }
                if (cartProduct == null || cartProduct.ProductID == 0)
                    Response.Redirect("Default.aspx");
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
                productImages = Products.GetProductImages(CartProduct.ProductID, true);
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
        manager.Add(new CartItem()
        {
            CatalogNumber = CartProduct.CatalogNumber,
            PricePerUnit = CartProduct.SalePrice == 0 ? CartProduct.Price : CartProduct.SalePrice,
            ProductID = CartProduct.ProductID,
            ProductName = CartProduct.ProductName,
            IsDownloadable = CartProduct.IsDownloadable,
            DownloadURL = CartProduct.DownloadURL,
            IsDownloadKeyRequired = CartProduct.IsDownloadKeyRequired, 
            IsDownloadKeyUnique = CartProduct.IsDownloadKeyUnique,
            Quantity = Convert.ToInt32(QtyTextBox.Text),
            ProductOptions = ProductOptionsControl1.SelectedOptions,
            CustomFields = CustomFieldsControl1.CustomFields
        });
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

    /// <summary>
    /// For products with no options check inventory on load.
    /// </summary>
    public void CheckProductInventory()
    {
        if (ProductOptionsControl1.HasOptions)
            return;

        InventoryAction inventoryAction;
        InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Inventory inventory = InvertedSoftware.ShoppingCart.DataLayer.Database.Inventory.GetProductInventory(CartProduct.ProductID, new List<int>());
        Enum.TryParse(inventory.InventoryActionID.ToString(), out inventoryAction);
      
        if (inventoryAction == InventoryAction.StopSellingProduct && inventory.ProductAmountInStock == 0)
        {
            AddButton.Enabled = false;
            AddButton.Text = "Sorry Out of Stock.";
        }
        else if (inventoryAction == InventoryAction.ShowPreOrderProduct && inventory.ProductAmountInStock == 0)
        {
            AddButton.Text = "Currently out of stock. Click here to pre order.";
        }
    }

    public int GetCartProduct()
    {
        return 1;
    }
}
