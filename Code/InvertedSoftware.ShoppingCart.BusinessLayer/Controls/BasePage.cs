﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.BusinessLayer.Controls
{
    public class BasePage : Page
    {
        private int customerID = -1;
        private Customer customer = null;

        public int GetLoggedCustomerID()
        {
            if (customerID > -1) return customerID;
            MembershipUser currentUser = Membership.GetUser();
            if (currentUser != null)
                customerID = Customers.GetCustomerID(new Guid(currentUser.ProviderUserKey.ToString()));

            return customerID;
        }

        public int GetLoggedCustomerID(string userName)
        {
            if (customerID > -1) return customerID;
            MembershipUser currentUser = Membership.GetUser(userName);
            if (currentUser != null)
            {
                customerID = Customers.GetCustomerID(new Guid(currentUser.ProviderUserKey.ToString()));
            }

            return customerID;
        }

        public Customer GetLoggedCustomer()
        {
            if (customer == null)
            {
                MembershipUser currentUser = Membership.GetUser();
                if (currentUser != null)
                    customer = Customers.GetCustomer(new Guid(currentUser.ProviderUserKey.ToString()));
            }
            return customer;
        }

        public string GetLoggedUserID()
        {
            MembershipUser currentUser = Membership.GetUser();
            if (currentUser != null)
                return currentUser.ProviderUserKey.ToString();
            return string.Empty;
        }

        public string GetLoggedUserName()
        {
            MembershipUser currentUser = Membership.GetUser();
            if (currentUser != null)
                return currentUser.UserName;
            return string.Empty;
        }

        private DataLayer.DataObjects.Cart cart = null;

        public DataLayer.DataObjects.Cart Cart
        {
            get
            {   // If there is a saved cart, remove expired coupons and show it
                if (HttpContext.Current.Profile["ShoppingCart"] != null &&
                    ((DataLayer.DataObjects.Cart)HttpContext.Current.Profile["ShoppingCart"]).CartItems.Count > 0)
                {
                    cart = (DataLayer.DataObjects.Cart)HttpContext.Current.Profile["ShoppingCart"];
                    cart.CartCoupons.RemoveWhere(c => c.ExpirationDate.HasValue && c.ExpirationDate.Value.CompareTo(DateTime.Now) > 0);
                    Session["ShoppingCart"] = cart;
                    return cart;
                }

                if (Session["ShoppingCart"] == null)
                    Session["ShoppingCart"] = new DataLayer.DataObjects.Cart();
                cart = (DataLayer.DataObjects.Cart)Session["ShoppingCart"];

                return cart;
            }
            set
            {
                Session["ShoppingCart"] = value;
            }
        }
    }
}
