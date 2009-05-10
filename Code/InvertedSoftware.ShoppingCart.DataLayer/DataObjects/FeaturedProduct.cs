using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class FeaturedProduct
    {
        public int FeaturedProductID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string thumbnail = "default.jpg";
        public string Thumbnail
        {
            get
            {
                return thumbnail;
            }
            set
            {
                if (!string.IsNullOrEmpty(value))
                    thumbnail = value;
            }
        }
        public int CategoryID { get; set; }
        public bool Active { get; set; }
    }
}
