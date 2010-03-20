using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderProductCustomField
    {
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public int OrderProductCustomFieldID { get; set; }
        public int OrderProductID { get; set; }
        public int CustomFieldID { get; set; }
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public string CustomFieldName { get; set; }
        public string OrderProductCustomFieldValue { get; set; }
        public bool Active { get; set; }
    }
}
