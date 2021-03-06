﻿using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using AuthorizeNet;

using InvertedSoftware.ShoppingCart.Common;

namespace InvertedSoftware.ShoppingCart.Intergration
{
    public class AuthorizeNetGateway : IPaymentGateway
    {
        public string Pay(string orderNumber, string paymentAmount, string buyerLastName, string buyerFirstName, string buyerAddress, string buyerCity, string buyerStateOrProvince, string buyerCountryCode, string buyerCountryName, string buyerZipCode, string creditCardType, string creditCardNumber, string CVV2, string expMonth, string expYear)
        {
            var request = new AuthorizationRequest(creditCardNumber, expMonth + expYear, Convert.ToDecimal(paymentAmount), orderNumber);
            request.AddCardCode(CVV2);
            request.AddCustomer(orderNumber, buyerFirstName, buyerLastName, buyerAddress, buyerStateOrProvince, buyerZipCode);
            request.AddInvoice(orderNumber);
            var gate = new Gateway(StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetAPILoginID), StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetTransactionKey), bool.Parse(StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetTestMode)));
            var response = gate.Send(request);

            if (response.Approved)
                return "OK";
            else
                return response.Message;
            
        }
    }
}
