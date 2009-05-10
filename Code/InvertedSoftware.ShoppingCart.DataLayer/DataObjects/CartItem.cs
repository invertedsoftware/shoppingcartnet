using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class CartItem
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string CatalogNumber { get; set; }
        public int Quantity { get; set; }
        public decimal PricePerUnit { get; set; }
        public decimal Subtotal { get; set; }
        public List<ProductOption> ProductOptions { get; set; }
        public List<CustomField> CustomFields { get; set; }

        public CartItem()
        {
            ProductOptions = new List<ProductOption>();
            CustomFields = new List<CustomField>();
        }
    }
}
