using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Concurrent;

namespace InvertedSoftware.ShoppingCart.Common
{
    public enum ConfigurationKey
    {
        StoreName,
        StoreURL,
        SalesTeamEmail,
        NewOrdersEmail,
        ContactEmail,
        PayPalAPIUsername,
        PayPalAPIPassword,
        PayPalAPISignature,
        GoogleCheckoutEnabled,
        GoogleMerchantID,
        GoogleMerchantkey,
        GoogleImageButtonURL,
        GoogleCheckoutURL,
        AuthorizeNetTestMode,
        AuthorizeNetAPILoginID,
        AuthorizeNetTransactionKey,
        SetupRan
    }

    public static class StoreConfiguration
    {
        private static ConcurrentDictionary<string, string> configurationValues = new ConcurrentDictionary<string, string>();

        public static string GetConfigurationValue(ConfigurationKey configurationKey)
        {
            string configValue = string.Empty;
            configurationValues.TryGetValue(configurationKey.ToString(), out configValue);
            return configValue;
        }

        public static void UpdateValue(ConfigurationKey configurationKey, string configurationValue)
        {
            configurationValues.AddOrUpdate(configurationKey.ToString(), configurationValue, (key, existingVal) => { return configurationValue; });
        }
    }
}
