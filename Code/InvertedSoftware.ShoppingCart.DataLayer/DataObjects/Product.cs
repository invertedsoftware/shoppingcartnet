using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Product
    {
        [CrudField(UsedFor=CrudFieldType.Delete|CrudFieldType.Read|CrudFieldType.Update)]
        public int ProductID { get; set; }
        public string CatalogNumber { get; set; }
        public string ProductName { get; set; }
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read)]
        public string Description { get; set; }
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read)]
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
