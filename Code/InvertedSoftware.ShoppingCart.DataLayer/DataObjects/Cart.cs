using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Cart
    {
        public HashSet<CartItem> CartItems { get; set; }
        public HashSet<Coupon> CartCoupons { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Discounts { get; set; }
        public decimal Shipping { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }
        /// <summary>
        /// If this is a purchase for a gift registry,
        /// deactivate the products in the registry and set the shipping address to the ouner of the registry
        /// </summary>
        public int GiftRegistryID { get; set; }

        public Cart()
        {
            CartItems = new HashSet<CartItem>();
            CartCoupons = new HashSet<Coupon>();
        }
    }
}
