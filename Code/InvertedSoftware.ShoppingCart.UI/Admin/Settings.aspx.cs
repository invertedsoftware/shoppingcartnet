using System;
using System.Configuration;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class Admin_Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            LoadForm();
    }
    protected void EditButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        try
        {
            StoreConfiguration.UpdateValue(ConfigurationKey.StoreName, StoreName.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.StoreURL, StoreURL.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.SalesTeamEmail, SalesTeamEmail.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.NewOrdersEmail, NewOrdersEmail.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.ContactEmail, ContactEmail.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPIUsername, PayPalAPIUsername.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPIPassword, PayPalAPIPassword.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPISignature, PayPalAPISignature.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.GoogleCheckoutEnabled, GoogleCheckoutEnabled.Checked.ToString().ToLower());
            StoreConfiguration.UpdateValue(ConfigurationKey.GoogleMerchantID, GoogleMerchantID.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.GoogleMerchantkey, GoogleMerchantkey.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.GoogleImageButtonURL, GoogleImageButtonURL.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.GoogleCheckoutURL, GoogleCheckoutURL.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetTestMode, AuthorizeNetTestMode.Checked.ToString().ToLower());
            StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetAPILoginID, AuthorizeNetAPILoginID.Text);
            StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetTransactionKey, AuthorizeNetTransactionKey.Text);

            StoreConfigurations.SaveAll();
            ErrorLiteral.Text = "Configuration Saved";
        }
        catch (Exception ex)
        {
            ErrorLiteral.Text = "ERROR Saving configuration: " + ex.Message;
        }
    }

    private void LoadForm()
    {
        StoreName.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName);
        StoreURL.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL);
        SalesTeamEmail.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.SalesTeamEmail);
        NewOrdersEmail.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.NewOrdersEmail);
        ContactEmail.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.ContactEmail);
        PayPalAPIUsername.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPIUsername);
        PayPalAPIPassword.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPIPassword);
        PayPalAPISignature.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.PayPalAPISignature);
        GoogleCheckoutEnabled.Checked = Convert.ToBoolean(StoreConfiguration.GetConfigurationValue(ConfigurationKey.GoogleCheckoutEnabled));
        GoogleMerchantID.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.GoogleMerchantID);
        GoogleMerchantkey.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.GoogleMerchantkey);
        GoogleImageButtonURL.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.GoogleImageButtonURL);
        GoogleCheckoutURL.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.GoogleCheckoutURL);
        AuthorizeNetTestMode.Checked = Convert.ToBoolean(StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetTestMode));
        AuthorizeNetAPILoginID.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetAPILoginID);
        AuthorizeNetTransactionKey.Text = StoreConfiguration.GetConfigurationValue(ConfigurationKey.AuthorizeNetTransactionKey);
    }
}
