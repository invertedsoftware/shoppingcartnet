using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderProductCustomField
    {
        public int OrderProductCustomFieldID { get; set; }
        public int OrderProductID { get; set; }
        public int CustomFieldID { get; set; }
        public string CustomFieldName { get; set; }
        public string OrderProductCustomFieldValue { get; set; }
        public bool Active { get; set; }
    }
}
