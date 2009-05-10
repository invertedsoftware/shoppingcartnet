using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class ProductOption
    {
        public int ProductOptionID { get; set; }
        public string ProductOptionName { get; set; }
        public string ProductOptionGroup { get; set; }
        public int ProductID { get; set; }
        public decimal PriceChange { get; set; }
        public bool Active { get; set; }
    }
}
