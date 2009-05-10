using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class RelatedProduct
    {
        public int RelatedProductID { get; set; }
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
        public bool Active { get; set; }
    }
}
