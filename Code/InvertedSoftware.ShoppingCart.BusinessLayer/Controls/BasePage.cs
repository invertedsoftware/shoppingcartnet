using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web.UI;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.BusinessLayer.Controls
{
    public class BasePage : Page
    {
        private int customerID = -1;

        public int GetLoggedCustomerID()
        {
            if (customerID > -1) return customerID;
            MembershipUser currentUser = Membership.GetUser();
            if (currentUser != null)
            {
                Customers customers = new Customers();
                customerID = customers.GetCustomerID(new Guid(currentUser.ProviderUserKey.ToString()));
            }

            return customerID;
        }

        public int GetLoggedCustomerID(string userName)
        {
            if (customerID > -1) return customerID;
            MembershipUser currentUser = Membership.GetUser(userName);
            if (currentUser != null)
            {
                Customers customers = new Customers();
                customerID = customers.GetCustomerID(new Guid(currentUser.ProviderUserKey.ToString()));
            }

            return customerID;
        }

        public Customer GetLoggedCustomer()
        {
            Customer customer = null;
            MembershipUser currentUser = Membership.GetUser();
            if (currentUser != null)
            {
                Customers customers = new Customers();
                customer = customers.GetCustomer(new Guid(currentUser.ProviderUserKey.ToString()));
            }
            return customer;
        }

        private DataLayer.DataObjects.Cart cart = null;

        public DataLayer.DataObjects.Cart Cart
        {
            get
            {
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
