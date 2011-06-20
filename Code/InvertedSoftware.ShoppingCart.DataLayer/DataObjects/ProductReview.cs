using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class ProductReview
    {
        public int ProductReviewID { get; set; }
        public string ReviewText { get; set; }
        public DateTime? ReviewDate { get; set; }
        public DateTime? OrderDate { get; set; }
        public List<KeyValuePair<string, int>> Ratings { get; set; }
        
        public ProductReview()
        {
            Ratings = new List<KeyValuePair<string, int>>();
        }
    }
}
