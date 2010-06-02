using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Inventory
    {
        public int InventoryID { get; set; }
        public int InventoryActionID { get; set; }
        public int ProductID { get; set; }
        public int ProductAmountInStock { get; set; }
        public bool Active { get; set; }
    }
}
