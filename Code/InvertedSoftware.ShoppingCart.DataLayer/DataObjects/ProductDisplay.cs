using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    [DataContract()]
    public class ProductDisplay
    {
        [DataMember()]
        public int ProductID { get; set; }
        [DataMember()]
        public string ProductName { get; set; }
        [DataMember()]
        private string thumbnail = "default.jpg";
        [DataMember()]
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
        [DataMember()]
        public bool Active { get; set; }
    }
}
