using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public enum OrderStatusEnum
    {
        Accepted = 1,
        Verifyed = 2,
        Shipped = 3,
        PaymentError = 4
    }

    public class Order
    {
        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public int OrderStatusID { get; set; }
        public int ShippingProviderID { get; set; }
        public string ShippingNumber { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public int? StateID { get; set; }
        public int? ProvinceID { get; set; }
        public int CountryID { get; set; }
        public string Zipcode { get; set; }
        public string Comments { get; set; }
        public DateTime? DatePlaced { get; set; }
        public DateTime? DateShipped { get; set; }
        public decimal Total { get; set; }
        public decimal Shipping { get; set; }
        public decimal Tax { get; set; }
        public bool Active { get; set; }

        public List<OrderItem> OrderItems { get; set; }
    }
}
