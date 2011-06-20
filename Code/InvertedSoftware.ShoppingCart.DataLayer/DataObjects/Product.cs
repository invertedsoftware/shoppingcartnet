using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Product
    {
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
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
        public decimal Price { get; set; }
        public decimal SalePrice { get; set; }
        public decimal Weight { get; set; }
        public decimal ShippingWeight { get; set; }
        public decimal Height { get; set; }
        public decimal ShippingHeight { get; set; }
        public decimal Length { get; set; }
        public decimal ShippingLength { get; set; }
        public decimal Width { get; set; }
        public decimal ShippingWidth { get; set; }
        public bool IsDownloadable { get; set; }
        public bool IsDownloadKeyRequired { get; set; }
        public bool IsDownloadKeyUnique { get; set; }
        public string DownloadURL { get; set; }
        public bool IsReviewEnabled { get; set; }
        public int TotalReviewCount { get; set; }
        public decimal RatingScore { get; set; }
        public bool Active { get; set; }
    }
}
