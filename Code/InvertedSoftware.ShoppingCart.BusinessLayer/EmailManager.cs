using System;
using System.Web;
using System.Configuration;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Reflection;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.Cache;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public enum EmailType
    {
        NewCustomerEmail,
        NewSaleCustomerEmail,
        NewSaleStoreEmail,
    }

    public class EmailManager
    {
        public static string GetEmailString(object dataObject, EmailType EmailType)
        {
            string emailBody = File.ReadAllText(EmailType.ToString() + ".txt");
            Type type = dataObject.GetType();
            PropertyInfo[] props = type.GetProperties();

            for (int i = 0; i < props.Length; i++)
            {
                if (props[i].PropertyType.Namespace.Equals("System.Collections.Generic"))
                    continue;
                object fieldValue = type.InvokeMember(props[i].Name, BindingFlags.GetProperty, null, dataObject, null);
                if (fieldValue != null)
                    emailBody = emailBody.Replace("<@" + props[i].Name + "@>", fieldValue.ToString());
            }
            return emailBody;
        }

        public static string GetEmailString(Dictionary<string, string> replacmentValues, EmailType EmailType)
        {
            string emailBody = File.ReadAllText(HttpRuntime.AppDomainAppPath + @"\" + EmailType.ToString() + ".txt");
            foreach (KeyValuePair<string, string> kvp in replacmentValues)
                emailBody = emailBody.Replace("<@" + kvp.Key + "@>", kvp.Value);
            return emailBody;
        }

        public static string GetOrderItemsString(Order order)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<tr>");
            sb.Append("<td>Name</td>");
            sb.Append("<td>Catalog Number</td>");
            sb.Append("<td>Quantity</td>");
            sb.Append("<td>TotalPrice</td>");
            sb.Append("</tr>");
            foreach (OrderItem item in order.OrderItems)
            {
                sb.Append("<tr>");
                sb.Append("<td>" + item.ProductName);
                foreach(OrderProductOption option in item.OptionList)
                    sb.Append("<br>" + option.ProductOptionName);
                sb.Append("</td>");
                sb.Append("<td>" + item.CatalogNumber + "</td>");
                sb.Append("<td>" + item.Quantity + "</td>");
                sb.Append("<td>" + item.TotalPrice.ToString("c") + "</td>");
                sb.Append("</tr>");
                sb.Append("<tr><td colspan='4' align='left'>");
                foreach(OrderProductCustomField field in item.OrderProductCustomFieldList)
                    sb.Append(field.CustomFieldName + ": " + field.OrderProductCustomFieldValue);
                sb.Append("</td></tr>");

            }
            return sb.ToString();
        }

        public static void SendNewStoreOrderEmail(Order order, Customer customer)
        {
            Dictionary<string, string> replacmentValues = new Dictionary<string, string>();
            CacheManager cache = new CacheManager();
            //Customer
            replacmentValues.Add("Company", customer.Company);
            replacmentValues.Add("FirstName", customer.FirstName);
            replacmentValues.Add("LastName", customer.LastName);
            replacmentValues.Add("Address", customer.Address);
            replacmentValues.Add("City", customer.City);
            string state = string.Empty;
            if (customer.StateID.HasValue)
                state = cache.GetCachedLookupTable(LookupDataEnum.GetStates).FindByValue(customer.StateID.Value.ToString()).Text;
            replacmentValues.Add("State", state);
            string province = string.Empty;
            if (customer.ProvinceID.HasValue)
                province = cache.GetCachedLookupTable(LookupDataEnum.GetProvinces).FindByValue(customer.ProvinceID.Value.ToString()).Text;
            replacmentValues.Add("Province", province);
            replacmentValues.Add("Country", cache.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByValue(customer.CountryID.ToString()).Text);
            replacmentValues.Add("Zipcode", customer.Zipcode);
            replacmentValues.Add("Comments", order.Comments);
            replacmentValues.Add("DayPhone", customer.DayPhone);
            replacmentValues.Add("EveningPhone", customer.EveningPhone);
            replacmentValues.Add("CellPhone", customer.CellPhone);
            replacmentValues.Add("Fax", customer.Fax);
            replacmentValues.Add("Email", customer.Email);
            //Shipping
            replacmentValues.Add("ShippingAddress", order.Address);
            replacmentValues.Add("ShippingCity", order.City);
            if (order.StateID.HasValue)
                state = cache.GetCachedLookupTable(LookupDataEnum.GetStates).FindByValue(order.StateID.Value.ToString()).Text;
            replacmentValues.Add("ShippingState", state);
            if (order.ProvinceID.HasValue)
                province = cache.GetCachedLookupTable(LookupDataEnum.GetProvinces).FindByValue(order.ProvinceID.Value.ToString()).Text;
            replacmentValues.Add("ShippingProvince", province);
            replacmentValues.Add("ShippingCountry", cache.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByValue(order.CountryID.ToString()).Text);
            replacmentValues.Add("ShippingZipcode", order.Zipcode);
            //Order Info
            replacmentValues.Add("ShippingProvider", cache.GetCachedLookupTable(LookupDataEnum.GetShippingPoviders).FindByValue(order.ShippingProviderID.ToString()).Text);
            replacmentValues.Add("Shipping", order.Shipping.ToString("c"));
            replacmentValues.Add("Tax", order.Tax.ToString("c"));
            replacmentValues.Add("Total", order.Total.ToString("c"));
            //Items
            replacmentValues.Add("Cart", GetOrderItemsString(order));
            string emailBody = EmailManager.GetEmailString(replacmentValues, EmailType.NewSaleStoreEmail);
            Email.SendSimpleEmail(ConfigurationManager.AppSettings["StoreName"] + " Sales",
                ConfigurationManager.AppSettings["SalesTeamEmail"], new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings["NewOrdersEmail"]) },
                "New Order",
                emailBody,
                true);
        }

        public static void EmailCart(string cartLink, string emails)
        {
            List<System.Net.Mail.MailAddress> toEmails = new List<System.Net.Mail.MailAddress>();
            toEmails = emails.Split(',').Select(a => new System.Net.Mail.MailAddress(a.Trim())).ToList();

            Email.SendSimpleEmail(ConfigurationManager.AppSettings["StoreName"],
                ConfigurationManager.AppSettings["SalesTeamEmail"],
                toEmails,
                "Your shopping cart",
                "Your shopping cart has been emailed to you. to view it please click the link <a href='" + cartLink + "'>" + cartLink + "</a> or copy and past it into your browser",
                true);
        }
    }
}
