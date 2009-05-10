using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Cart
    {
        public HashSet<CartItem> CartItems { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Shipping { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }

        public Cart()
        {
            CartItems = new HashSet<CartItem>();
        }
    }
}
