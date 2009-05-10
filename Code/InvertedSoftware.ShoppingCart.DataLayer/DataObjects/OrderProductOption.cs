using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderProductOption
    {
        public int OrderProductOptionID { get; set; }
        public int OrderProductID { get; set; }
        public int ProductOptionID { get; set; }
        public string ProductOptionName { get; set; }
        public bool Active { get; set; }
    }
}
