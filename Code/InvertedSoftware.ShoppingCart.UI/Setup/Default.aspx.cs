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
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class Setup_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (StoreConfiguration.GetConfigurationValue(ConfigurationKey.SetupRan) == "true")
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
        StoreConfiguration.UpdateValue(ConfigurationKey.SetupRan, "true");
        StoreConfiguration.GetConfigurationValue(ConfigurationKey.SetupRan);
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
        StoreConfiguration.UpdateValue(ConfigurationKey.StoreName, ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("StoreName")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.StoreURL, ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("StoreURL")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.SalesTeamEmail, ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("SalesTeamEmail")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.NewOrdersEmail, ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("NewOrdersEmail")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.ContactEmail, ((TextBox)CreateUserWizard1.WizardSteps[1].Controls[0].FindControl("ContactEmail")).Text);

        StoreConfigurations.SaveAll();
    }

    public void SetPaymentConfiguration()
    {
        StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPIUsername, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPIUsername")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPIPassword, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPIPassword")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.PayPalAPISignature, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("PayPalAPISignature")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.GoogleCheckoutEnabled, ((CheckBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleCheckoutEnabled")).Checked.ToString().ToLower());
        StoreConfiguration.UpdateValue(ConfigurationKey.GoogleMerchantID, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleMerchantID")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.GoogleMerchantkey, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleMerchantkey")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.GoogleImageButtonURL, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("GoogleImageButtonURL")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetTestMode, ((CheckBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetTestMode")).Checked.ToString().ToLower());
        StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetAPILoginID, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetAPILoginID")).Text);
        StoreConfiguration.UpdateValue(ConfigurationKey.AuthorizeNetTransactionKey, ((TextBox)CreateUserWizard1.WizardSteps[2].Controls[0].FindControl("AuthorizeNetTransactionKey")).Text);
       
        StoreConfigurations.SaveAll();
    }
}
