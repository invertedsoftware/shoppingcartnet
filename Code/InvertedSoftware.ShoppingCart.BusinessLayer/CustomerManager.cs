using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.Common.Security;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public static class CustomerManager
    {
        public static Customer AddCustomer(Customer customer)
        {
            PasswordGenerator gen = new PasswordGenerator() { ConsecutiveCharacters = true, ExcludeSymbols = false, Maximum = 9, Minimum = 6, RepeatCharacters = true };
            string password = gen.Generate();
            MembershipUser user = Membership.CreateUser(customer.Email, password, customer.Email);
            user.IsApproved = true;
            customer.MemberID = new Guid(user.ProviderUserKey.ToString());
            Roles.AddUserToRole(user.UserName, "Customer");
            customer.CustomerID = Customers.AddCustomer(customer);
            SendNewCustomerEmail(password, customer.FirstName, customer.Email);
            return customer;
        }

        public static void SendNewCustomerEmail(string password, string firstName, string email)
        {
            Dictionary<string, string> replacmentValues = new Dictionary<string, string>();
            replacmentValues.Add("FirstName", firstName);
            replacmentValues.Add("StoreName", StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName));
            replacmentValues.Add("StoreURL", StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL));
            replacmentValues.Add("Email", email);
            replacmentValues.Add("Password", password);

            string emailBody = EmailManager.GetEmailString(replacmentValues, EmailType.NewCustomerEmail);
            Email.SendSimpleEmail(StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName) + " Sales",
                StoreConfiguration.GetConfigurationValue(ConfigurationKey.SalesTeamEmail), new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(email) },
                "Welcome new customer",
                emailBody,
                true);
        }
    }
}
