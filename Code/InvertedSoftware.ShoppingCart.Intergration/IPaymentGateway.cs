using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.Intergration
{
    public interface IPaymentGateway
    {
        string Pay(string orderNumber, string paymentAmount, string buyerFirstName, string buyerLastName, string buyerAddress, string buyerCity, string buyerStateOrProvince, string buyerCountryCode, string buyerCountryName, string buyerZipCode, string creditCardType, string creditCardNumber, string CVV2, string expMonth, string expYear);
    }
}
