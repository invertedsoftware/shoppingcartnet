using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Tax
    {
        public int TaxID { get; set; }
        public string TaxName { get; set; }
        public bool Fixed { get; set; }
        public decimal Amount { get; set; }
        public bool IsAfterShipping { get; set; }
        public int CountryID { get; set; }
        public int? StateID { get; set; }
        public int? ProvinceID { get; set; }
        public bool Active { get; set; }
    }
}
