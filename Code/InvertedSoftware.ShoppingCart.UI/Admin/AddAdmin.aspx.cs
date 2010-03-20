using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.Cache;

public partial class Admin_AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //Add the user to the admin group and create an empty customer record
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Admin");
        CacheManager cache = new CacheManager();
        Customer customer = new Customer()
        {
            MemberID = new Guid(Membership.GetUser(CreateUserWizard1.UserName).ProviderUserKey.ToString()),
            CountryID = Convert.ToInt32(cache.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByText("UNITED STATES")),
            Email = CreateUserWizard1.Email,
            DateCreated = DateTime.Now,
            DateUpdated = DateTime.Now,
            Active = true
        };
        customer.CustomerID = Customers.AddCustomer(customer);
    }
}
