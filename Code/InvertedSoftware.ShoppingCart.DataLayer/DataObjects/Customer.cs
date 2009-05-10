using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public Guid MemberID { get; set; }
        public string Company { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public int? StateID { get; set; }
        public int? ProvinceID { get; set; }
        public int CountryID { get; set; }
        public string Zipcode { get; set; }
        public string DayPhone { get; set; }
        public string EveningPhone { get; set; }
        public string CellPhone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateUpdated { get; set; }
        public bool Active { get; set; }
    }
}
