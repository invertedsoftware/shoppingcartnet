using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderDisplay : Order
    {
        public string OrderStatusName { get; set; }
        public string ShippingProviderName { get; set; }
        public string StateName { get; set; }
        public string ProvinceName { get; set; }
        public string CountryName { get; set; }
    }
}
