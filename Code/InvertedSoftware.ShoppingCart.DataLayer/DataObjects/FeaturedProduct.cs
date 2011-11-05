using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class FeaturedProduct : ProductDisplay
    {
        public int FeaturedProductID { get; set; }
        public int CategoryID { get; set; }
    }
}
