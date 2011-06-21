using System;
using System.Configuration;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
            AppSettingsSection appSettings = (AppSettingsSection)configuration.GetSection("appSettings");

            if (appSettings == null)
                return;

            appSettings.Settings["StoreName"].Value = StoreName.Text;
            appSettings.Settings["StoreURL"].Value = StoreURL.Text;
            appSettings.Settings["SalesTeamEmail"].Value = SalesTeamEmail.Text;
            appSettings.Settings["NewOrdersEmail"].Value = NewOrdersEmail.Text;
            appSettings.Settings["ContactEmail"].Value = ContactEmail.Text;
            appSettings.Settings["PayPalAPIUsername"].Value = PayPalAPIUsername.Text;
            appSettings.Settings["PayPalAPIPassword"].Value = PayPalAPIPassword.Text;
            appSettings.Settings["PayPalAPISignature"].Value = PayPalAPISignature.Text;
            appSettings.Settings["GoogleCheckoutEnabled"].Value = GoogleCheckoutEnabled.Checked.ToString().ToLower();
            appSettings.Settings["GoogleMerchantID"].Value = GoogleMerchantID.Text;
            appSettings.Settings["GoogleMerchantkey"].Value = GoogleMerchantkey.Text;
            appSettings.Settings["GoogleImageButtonURL"].Value = GoogleImageButtonURL.Text;
            appSettings.Settings["GoogleCheckoutURL"].Value = GoogleCheckoutURL.Text;
            appSettings.Settings["AuthorizeNetTestMode"].Value = AuthorizeNetTestMode.Checked.ToString().ToLower();
            appSettings.Settings["AuthorizeNetAPILoginID"].Value = AuthorizeNetAPILoginID.Text;
            appSettings.Settings["AuthorizeNetTransactionKey"].Value = AuthorizeNetTransactionKey.Text;
            configuration.Save();
            ErrorLiteral.Text = "Configuration Saved";
        }
        catch (Exception ex)
        {
            ErrorLiteral.Text = "ERROR Saving configuration: " + ex.Message;
        }

    }

    private void LoadForm()
    {
        StoreName.Text = ConfigurationManager.AppSettings["StoreName"];
        StoreURL.Text = ConfigurationManager.AppSettings["StoreURL"];
        SalesTeamEmail.Text = ConfigurationManager.AppSettings["SalesTeamEmail"];
        NewOrdersEmail.Text = ConfigurationManager.AppSettings["NewOrdersEmail"];
        ContactEmail.Text = ConfigurationManager.AppSettings["ContactEmail"];
        PayPalAPIUsername.Text = ConfigurationManager.AppSettings["PayPalAPIUsername"];
        PayPalAPIPassword.Text = ConfigurationManager.AppSettings["PayPalAPIPassword"];
        PayPalAPISignature.Text = ConfigurationManager.AppSettings["PayPalAPISignature"];
        GoogleCheckoutEnabled.Checked = Convert.ToBoolean(ConfigurationManager.AppSettings["GoogleCheckoutEnabled"]);
        GoogleMerchantID.Text = ConfigurationManager.AppSettings["GoogleMerchantID"];
        GoogleMerchantkey.Text = ConfigurationManager.AppSettings["GoogleMerchantkey"];
        GoogleImageButtonURL.Text = ConfigurationManager.AppSettings["GoogleImageButtonURL"];
        GoogleCheckoutURL.Text = ConfigurationManager.AppSettings["GoogleCheckoutURL"];
        AuthorizeNetTestMode.Checked = Convert.ToBoolean(ConfigurationManager.AppSettings["AuthorizeNetTestMode"]);
        AuthorizeNetAPILoginID.Text = ConfigurationManager.AppSettings["AuthorizeNetAPILoginID"];
        AuthorizeNetTransactionKey.Text = ConfigurationManager.AppSettings["AuthorizeNetTransactionKey"];
    }
}
