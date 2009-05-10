using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Image
    {
        public int ImageID { get; set; }
        public int ParentID { get; set; }
        public int ProductID { get; set; }
        public int SortOrder { get; set; }
        public string ImageName { get; set; }
        public string ImageURL { get; set; }
        public bool Active { get; set; }
    }
}
