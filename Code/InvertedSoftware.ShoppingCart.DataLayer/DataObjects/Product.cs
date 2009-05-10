using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Product
    {
        public int ProductID { get; set; }
        public string CatalogNumber { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
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

        public string imageURL = "default.jpg";
        public string ImageURL
        {
            get
            {
                return imageURL;
            }
            set
            {
                if (!string.IsNullOrEmpty(value))
                    imageURL = value;
            }
        }
        public decimal price { get; set; }
        public bool Active { get; set; }
    }
}
