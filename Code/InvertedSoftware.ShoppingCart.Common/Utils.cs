using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;

using InvertedSoftware.ShoppingCart.Common.Security;

namespace InvertedSoftware.ShoppingCart.Common
{
    public enum Month
    {
        January = 1,
        February = 2,
        March = 3,
        April = 4,
        May = 5,
        June = 6,
        July = 7,
        August = 8,
        September = 9,
        October = 10,
        November = 11,
        December = 12
    }

    public static class Utils
    {
        public static readonly string ENCODING_SALT = ConfigurationManager.AppSettings["ENCODING_SALT"];
        public static readonly string ENCODING_VECTOR = ConfigurationManager.AppSettings["ENCODING_VECTOR"];
        public static bool IS_CONFIGURED = false;

        public static string GetEncodedString(string textToEncode)
        {
            string encodedText = string.Empty;
            // Before encrypting data, we will append plain text to a random
            // salt value, which will be between 4 and 8 bytes long (implicitly
            // used defaults).
            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(Utils.ENCODING_SALT, Utils.ENCODING_VECTOR);

            // Encrypt the same plain text data 10 time (using the same key,
            // initialization vector, etc) and see the resulting cipher text;
            // encrypted values will be different.
            try
            {
                encodedText = rijndaelKey.Encrypt(textToEncode);
            }
            catch (Exception e) { encodedText = textToEncode; }
            return encodedText;
        }

        public static string GetDecodedString(string textToDecode)
        {
            string decodedText = string.Empty;
            // Before encrypting data, we will append plain text to a random
            // salt value, which will be between 4 and 8 bytes long (implicitly
            // used defaults).
            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(Utils.ENCODING_SALT, Utils.ENCODING_VECTOR);

            // Encrypt the same plain text data 10 time (using the same key,
            // initialization vector, etc) and see the resulting cipher text;
            // encrypted values will be different.
            try
            {
                decodedText = rijndaelKey.Decrypt(textToDecode);
            }
            catch (Exception e) { decodedText = textToDecode; }
            return decodedText;
        }

        public static int GetDecodedInt(string textToDecode)
        {
            int decodedInt = -1;
            string decodedText = GetDecodedString(textToDecode);
            int.TryParse(decodedText, out decodedInt);
            return decodedInt;
        }

        public static string PostToURL(string url, string postData, string userName, string password)
        {
            string responseString = string.Empty;
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] requestData = encoding.GetBytes(postData);

            try
            {
                using (WebClient webClient = new WebClient())
                {
                    webClient.Headers.Add("Content-Type", "application/xml; charset=UTF-8");
                    webClient.Headers.Add("Authorization", string.Format("Basic {0}", GetAuthorization(userName, password)));
                    byte[] responseData = webClient.UploadData(url, "POST", requestData);
                    responseString = Encoding.UTF8.GetString(responseData);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error posting to URL " + url, e);
            }

            return responseString;
        }

        private static string GetAuthorization(string User, string Password)
        {
            UTF8Encoding utf8encoder = new UTF8Encoding(false, true);
            return Convert.ToBase64String(utf8encoder.GetBytes(
              string.Format("{0}:{1}", User, Password)));
        }
    }
}
