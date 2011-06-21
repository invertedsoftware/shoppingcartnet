using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Category
    {
        public int CategoryID { get; set; }
        public int? ParentCategoryID { get; set; }
        public string CategoryName { get; set; }
        public bool Active { get; set; }
    }
}
