using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class GiftRegistry
    {
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public int GiftRegistryID { get; set; }
        [CrudField(UsedFor = CrudFieldType.Create | CrudFieldType.Read | CrudFieldType.Update)]
        public int CustomerID { get; set; }
        [CrudField(UsedFor = CrudFieldType.Read)]
        public string FirstName { get; set; }
        [CrudField(UsedFor = CrudFieldType.Read)]
        public string LastName { get; set; }
        [CrudField(UsedFor = CrudFieldType.Read | CrudFieldType.Update)]
        public DateTime DateCreated { get; set; }
        [CrudField(UsedFor = CrudFieldType.Create | CrudFieldType.Read | CrudFieldType.Update)]
        public bool Active { get; set; }

        public List<GiftRegistryProduct> Products { get; set; }

        public GiftRegistry()
        {
            Products = new List<GiftRegistryProduct>();
        }
    }
}
