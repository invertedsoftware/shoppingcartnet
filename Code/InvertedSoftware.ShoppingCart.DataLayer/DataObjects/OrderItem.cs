using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class OrderItem
    {
        public int OrderProductID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string CatalogNumber { get; set; }
        public int Quantity { get; set; }
        public decimal PricePerUnit { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal Discount { get; set; }
        public decimal Shipping { get; set; }
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
