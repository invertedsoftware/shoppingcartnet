using System;
using System.Web;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.Intergration.PaypalAPIServiceReference;
using InvertedSoftware.ShoppingCart.Common;



namespace InvertedSoftware.ShoppingCart.Intergration
{
    public class PayPalGateway : IPaymentGateway
    {
        public string Pay(string orderNumber, string paymentAmount, string buyerLastName, string buyerFirstName, string buyerAddress, string buyerCity, string buyerStateOrProvince, string buyerCountryCode, string buyerCountryName, string buyerZipCode, string creditCardType, string creditCardNumber, string CVV2, string expMonth, string expYear)
        {
            DoDirectPaymentRequestDetailsType requestDetails = new DoDirectPaymentRequestDetailsType();
            requestDetails.CreditCard = new CreditCardDetailsType();
            requestDetails.CreditCard.CardOwner = new PayerInfoType();
            requestDetails.CreditCard.CardOwner.Address = new AddressType();
            requestDetails.PaymentDetails = new PaymentDetailsType();
            requestDetails.PaymentDetails.OrderTotal = new BasicAmountType();
            requestDetails.CreditCard.CardOwner.PayerName = new PersonNameType();


            //Request
            requestDetails.PaymentAction = PaymentActionCodeType.Sale;
            requestDetails.IPAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            
            //Payment
            requestDetails.PaymentDetails.OrderTotal.currencyID = CurrencyCodeType.USD;
            requestDetails.PaymentDetails.OrderTotal.Value = paymentAmount;
            
            //Credit card
            requestDetails.CreditCard.CreditCardNumber = creditCardNumber;
            requestDetails.CreditCard.CreditCardType = (CreditCardTypeType)Enum.Parse(typeof(CreditCardTypeType), creditCardType, true);
            requestDetails.CreditCard.ExpMonth = Convert.ToInt32(expMonth);
            requestDetails.CreditCard.ExpYear = Convert.ToInt32(expYear);
            requestDetails.CreditCard.CVV2 = CVV2;
            requestDetails.CreditCard.CreditCardTypeSpecified = true;
            requestDetails.CreditCard.ExpMonthSpecified = true;
            requestDetails.CreditCard.ExpYearSpecified = true;

            //Card Owner
            requestDetails.CreditCard.CardOwner.PayerName.FirstName = buyerFirstName;
            requestDetails.CreditCard.CardOwner.PayerName.LastName = buyerLastName;
            requestDetails.CreditCard.CardOwner.Address.Street1 = buyerAddress;
            requestDetails.CreditCard.CardOwner.Address.CityName = buyerCity;
            requestDetails.CreditCard.CardOwner.Address.StateOrProvince = buyerStateOrProvince;
            requestDetails.CreditCard.CardOwner.Address.CountryName = buyerCountryName;
            requestDetails.CreditCard.CardOwner.Address.Country = (CountryCodeType)Enum.Parse(typeof(CountryCodeType), buyerCountryCode, true);
            requestDetails.CreditCard.CardOwner.Address.PostalCode = buyerZipCode;
            requestDetails.CreditCard.CardOwner.Address.CountrySpecified = true;
            requestDetails.CreditCard.CardOwner.PayerCountry = (CountryCodeType)Enum.Parse(typeof(CountryCodeType), buyerCountryCode, true);
            requestDetails.CreditCard.CardOwner.PayerCountrySpecified = true;

            DoDirectPaymentReq request = new DoDirectPaymentReq();
            request.DoDirectPaymentRequest = new DoDirectPaymentRequestType();
            request.DoDirectPaymentRequest.DoDirectPaymentRequestDetails = requestDetails;
            request.DoDirectPaymentRequest.Version = "51.0";

            //Headers
            PaypalAPIServiceReference.CustomSecurityHeaderType headers = new CustomSecurityHeaderType();
            headers.Credentials = new UserIdPasswordType();
            headers.Credentials.Username = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPIUsername);
            headers.Credentials.Password = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPIPassword);
            headers.Credentials.Signature = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPISignature);
            
            PaypalAPIServiceReference.PayPalAPIAAInterfaceClient client = new PayPalAPIAAInterfaceClient();
            client.Open();
            DoDirectPaymentResponseType response = client.DoDirectPayment(ref headers, request);
            if (response.Ack == AckCodeType.Success || response.Ack == AckCodeType.SuccessWithWarning)
                return "OK";
            string status = response.Errors[0].LongMessage;
            client.Close();
            return status;
        }
    }
}
