using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class GiftRegistryProduct
    {
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public int GiftRegistryProductID { get; set; }
        public int GiftRegistryID { get; set; }
        public int ProductID { get; set; }
        public bool Active { get; set; }
        [CrudField(UsedFor = CrudFieldType.Read)]
        public string ProductName { get; set; }
        private string thumbnail = "default.jpg";
        [CrudField(UsedFor = CrudFieldType.Read)]
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
    }
}
