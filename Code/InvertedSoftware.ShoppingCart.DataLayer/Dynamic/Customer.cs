using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.ComponentModel.DataAnnotations;

using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    [MetadataType(typeof(CustomerMetadata))]
    public partial class Customer
    {
        partial void OnEmailChanging(string value)
        {
            //Looks like a dynamic data bug. This is firing twice
            string customerEmail = Customers.GetCustomerEmail(Convert.ToInt32(HttpContext.Current.Request.QueryString["CustomerID"]));
            if (customerEmail == value)
                return;
            if (!Regex.IsMatch(value,
                     @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"))
                throw new ValidationException("Email is not on in the correct format");

            if (Customers.IsEmailExists(value))
                throw new ValidationException("Email is already in use");

            // Since we cannot change the user name the user will still have to log in using the old email.
            // Orders will default to the new email.
            string userName = Membership.GetUserNameByEmail(customerEmail);
            if (string.IsNullOrEmpty(userName))
                return;
            MembershipUser user = Membership.GetUser(userName);
            if (user != null)
            {
                user.Email = value;
                Membership.UpdateUser(user);
            }
            else
            {
                throw new ValidationException("Member user name is no longer equals its email");
            }
        }

        partial void OnActiveChanging(bool value)
        {
            //Also update the membership table
            Guid memberID = Customers.GetCustomerMemberID(Convert.ToInt32(HttpContext.Current.Request.QueryString["CustomerID"]));

            MembershipUser user = Membership.GetUser(memberID);
            user.IsApproved = value;
            if (user.IsLockedOut && value)
                user.UnlockUser();
            Membership.UpdateUser(user);
        }
    }

    public class CustomerMetadata
    {
        [ScaffoldColumn(false)]
        public Object MemberID { get; set; }
        [Required()]
        public Object Email { get; set; }
    }
}
