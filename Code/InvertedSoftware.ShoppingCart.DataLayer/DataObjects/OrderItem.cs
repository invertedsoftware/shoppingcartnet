using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderItem
    {
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public int OrderProductID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public string ProductName { get; set; }
        [CrudField(UsedFor = CrudFieldType.Delete | CrudFieldType.Read | CrudFieldType.Update)]
        public string CatalogNumber { get; set; }
        public int Quantity { get; set; }
        public decimal PricePerUnit { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal Discount { get; set; }
        public decimal Shipping { get; set; }
        public string DownloadKey { get; set; }
        public string DownloadURL { get; set; }
        public DateTime OrderDate { get; set; }
        public bool Active { get; set; }

        public List<OrderProductOption> OptionList { get; set; }
        public List<OrderProductCustomField> OrderProductCustomFieldList { get; set; }

        public OrderItem()
        {
            OptionList = new List<OrderProductOption>();
            OrderProductCustomFieldList = new List<OrderProductCustomField>();
        }
    }
}
