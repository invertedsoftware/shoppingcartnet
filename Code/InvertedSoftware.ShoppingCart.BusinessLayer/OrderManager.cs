﻿using System;
using System.Configuration;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.Intergration;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class OrderManager
    {
        public static decimal GetTaxes(int countryID, int? stateID, int? provinceID, decimal cartSubtotal, decimal cartShipping)
        {
            decimal taxes = 0;
            List<Tax> taxesList = Orders.GetTaxes(countryID, stateID, provinceID);
            decimal fixedAmount = taxesList.Where(t => t.Fixed).Sum(t => t.Amount);
            decimal percentBeforeShippingAmount = taxesList.Where(t => !t.Fixed && !t.IsAfterShipping).Sum(t => t.Amount) * cartSubtotal / 100;
            decimal percentAfterShippingAmount = taxesList.Where(t => !t.Fixed && t.IsAfterShipping).Sum(t => t.Amount) * (cartSubtotal + cartShipping) / 100;
            taxes = fixedAmount + percentBeforeShippingAmount + percentAfterShippingAmount;
            return taxes;
        }

        public string TakePayment(string orderNumber, string paymentAmount, string buyerFirstName, string buyerLastName, string buyerAddress, string buyerCity, string buyerStateOrProvince, string buyerCountryCode, string buyerCountryName, string buyerZipCode, string creditCardType, string creditCardNumber, string CVV2, string expMonth, string expYear)
        {
            IPaymentGateway gateway = (IPaymentGateway)Assembly.Load("InvertedSoftware.ShoppingCart.Intergration, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null").CreateInstance(ConfigurationManager.AppSettings["PaymentGateway"]);
            return gateway.Pay(orderNumber, paymentAmount, buyerFirstName, buyerLastName, buyerAddress, buyerCity, buyerStateOrProvince, buyerCountryCode, buyerCountryName, buyerZipCode, creditCardType, creditCardNumber, CVV2, expMonth, expYear);
        }
    }
}
