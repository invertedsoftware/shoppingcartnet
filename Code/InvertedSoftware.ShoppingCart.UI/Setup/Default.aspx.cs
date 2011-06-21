using System;
using System.Configuration;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.Common;

public partial class Setup_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ConfigurationManager.AppSettings["SetupRan"] == "true")
        {
            Utils.IS_CONFIGURED = true;
            Response.Redirect("../Default.aspx");
        }

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //Create all of the roles if they dont exist and add the user to SuperAdmin group
        if (!Roles.RoleExists("SuperAdmin"))
            Roles.CreateRole("SuperAdmin");
        if (!Roles.RoleExists("Admin"))
            Roles.CreateRole("Admin");
        if (!Roles.RoleExists("Customer"))
            Roles.CreateRole("Customer");

        Roles.AddUserToRole(CreateUserWizard1.UserName, "SuperAdmin");
    }

    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
        AppSettingsSection appSettings = (AppSettingsSection)configuration.GetSection("appSettings");

        if (appSettings != null)
        {
            appSettings.Settings["SetupRan"].Value = "true";
            configuration.Save();
        }
        Response.Redirect("../admin");
    }
    protected void CreateUserWizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 1)
            SetBasicConfiguration();
    }

    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 2)
            SetPaymentConfiguration();
    }

    public void SetBasicConfiguration()
    {
        Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
        AppSettingsSection appSettings = (AppSettingsSection)configuration.GetSection("appSettings");

        if (appSettings != null)
        {
            appSettings.Settings["StoreName"].Value = ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("StoreName")).Text;
            appSettings.Settings["StoreURL"].Value = ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("StoreURL")).Text;
            appSettings.Settings["SalesTeamEmail"].Value = ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("SalesTeamEmail")).Text;
            appSettings.Settings["NewOrdersEmail"].Value = ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("NewOrdersEmail")).Text;
            appSettings.Settings["ContactEmail"].Value = ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("ContactEmail")).Text;
            configuration.Save();
        }
    }

    public void SetPaymentConfiguration()
    {
        Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
        AppSettingsSection appSettings = (AppSettingsSection)configuration.GetSection("appSettings");

        if (appSettings != null)
        {
            appSettings.Settings["PayPalAPIUsername"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPIUsername")).Text;
            appSettings.Settings["PayPalAPIPassword"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPIPassword")).Text;
            appSettings.Settings["PayPalAPISignature"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPISignature")).Text;
            appSettings.Settings["GoogleCheckoutEnabled"].Value = ((CheckBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleCheckoutEnabled")).Checked.ToString().ToLower();
            appSettings.Settings["GoogleMerchantID"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleMerchantID")).Text;
            appSettings.Settings["GoogleMerchantkey"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleMerchantkey")).Text;
            appSettings.Settings["GoogleImageButtonURL"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleImageButtonURL")).Text;
            appSettings.Settings["GoogleCheckoutURL"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleCheckoutURL")).Text;
            appSettings.Settings["AuthorizeNetTestMode"].Value = ((CheckBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetTestMode")).Checked.ToString().ToLower();
            appSettings.Settings["AuthorizeNetAPILoginID"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetAPILoginID")).Text;
            appSettings.Settings["AuthorizeNetTransactionKey"].Value = ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetTransactionKey")).Text;
            configuration.Save();
        }
    }
}
