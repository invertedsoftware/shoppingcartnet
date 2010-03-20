using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.Common.Security;
using InvertedSoftware.ShoppingCart.DataLayer.Cache;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class Checkout : BasePage
{
    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        AddShipping();
        AddTaxes();
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Customer customer = GetLoggedCustomer();
            if (customer != null)
            {
                LoadCustomer(customer);
                EmailTextBox.Enabled = false;
            }
        }
    }

    protected void ShippingCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (ShippingCheckBox.Checked)
        {
            ShippingAddressControl.Address = BillingAddressControl.Address;
            ShippingAddressControl.City = BillingAddressControl.City;
            ShippingAddressControl.CountryID = BillingAddressControl.CountryID;
            ShippingAddressControl.StateID = BillingAddressControl.StateID;
            ShippingAddressControl.ProvinceID = BillingAddressControl.ProvinceID;
            ShippingAddressControl.Zipcode = BillingAddressControl.Zipcode;
            ShippingAddressControl.Enabled = false;
        }
        else
            ShippingAddressControl.Enabled = true;
    }

    protected void BuyButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        try
        {
            Customer customer = GetLoggedCustomer();
            if (customer == null)
                customer = AddCustomer();
            Order order = AddOrder(customer);
            //Take credit card payment
            if (ChargeCreditCard(order.OrderNumber))
            {
                //Clear the cart and redirect to Receipt.aspx
                Cart = null;
                Response.Redirect("Receipt.aspx?CustomerID=" + WebUtility.EncodeParamForQueryString(customer.CustomerID.ToString()) + "&OrderID=" + WebUtility.EncodeParamForQueryString(order.OrderID.ToString()));
            }
            else
            {
                //Log in the customer and set the transaction to error
                FormsAuthentication.SetAuthCookie(customer.Email, true);
                Orders.UpdateOrderStatus(order.OrderID, (int)OrderStatusEnum.PaymentError);
            }
        }
        catch (Exception ex)
        {
            MessageLabel.Text = "Transaction error: " + ex.Message;
        }
    }

    protected void EmailCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //If the customer is not logged on check to see if the email address already exists
        if (GetLoggedCustomerID() == -1)
        {
            if (Customers.IsEmailExists(args.Value) || Membership.GetUser(args.Value) != null)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        else
        {
            args.IsValid = true;
        }
    }

    protected void ShippingLookupDataDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    } 
    #endregion

    private void LoadCustomer(Customer customer)
    {
        ComapnyTextBox.Text = customer.Company;
        FirstNameTextBox.Text = customer.FirstName;
        LastNameTextBox.Text = customer.LastName;
        BillingAddressControl.Address = customer.Address;
        BillingAddressControl.City = customer.City;
        BillingAddressControl.CountryID = customer.CountryID;
        BillingAddressControl.StateID = customer.StateID;
        BillingAddressControl.ProvinceID = customer.ProvinceID;
        BillingAddressControl.Zipcode = customer.Zipcode;
        DayPhoneTextBox.Text = customer.DayPhone;
        EveningPhoneTextBox.Text = customer.EveningPhone;
        CellPhoneTextBox.Text = customer.CellPhone;
        FaxTextBox.Text = customer.Fax;
        EmailTextBox.Text = customer.Email;
    }

    private Customer AddCustomer()
    {
        PasswordGenerator gen = new PasswordGenerator() { ConsecutiveCharacters = true, ExcludeSymbols = false, Maximum = 9, Minimum = 6, RepeatCharacters = true };
        string password = gen.Generate();
        MembershipUser user = Membership.CreateUser(EmailTextBox.Text, password, EmailTextBox.Text);
        user.IsApproved = true;
        Roles.AddUserToRole(user.UserName, "Customer");

        Customer customer = new Customer()
        {
            Address = BillingAddressControl.Address,
            CellPhone = CellPhoneTextBox.Text,
            City = BillingAddressControl.City,
            Company = ComapnyTextBox.Text,
            CountryID = BillingAddressControl.CountryID,
            DateCreated = DateTime.Now,
            DateUpdated = DateTime.Now,
            DayPhone = DayPhoneTextBox.Text,
            Email = EmailTextBox.Text,
            EveningPhone = EveningPhoneTextBox.Text,
            Fax = FaxTextBox.Text,
            StateID = BillingAddressControl.StateID,
            FirstName = FirstNameTextBox.Text,
            LastName = LastNameTextBox.Text,
            ProvinceID = BillingAddressControl.ProvinceID,
            Zipcode = BillingAddressControl.Zipcode,
            MemberID = new Guid(user.ProviderUserKey.ToString()), 
            Active = true
        };

        customer.CustomerID = Customers.AddCustomer(customer);
        SendNewCustomerEmail(password);
        return customer;
    }

    private Order AddOrder(Customer customer)
    {
        PasswordGenerator gen = new PasswordGenerator() { ConsecutiveCharacters = true, ExcludeSymbols = true, Maximum = 25, Minimum = 25, RepeatCharacters = true };
        string orderNo = gen.Generate();

        Order order = new Order() { CustomerID = customer.CustomerID, 
            OrderNumber = orderNo, 
            DatePlaced = DateTime.Now,
            OrderStatusID = (int)OrderStatusEnum.Accepted,
            Tax = Cart.Tax,
            Shipping = Cart.Shipping,
            Total = Cart.Total,
            OrderDate = DateTime.Now,
            Active = true, 
            ShippingProviderID = Convert.ToInt32(ShippingLookupDataDropDownList.SelectedValue),
            Comments = CommentsTextBox.Text };

        if (ShippingCheckBox.Checked)
        {
            order.Address = BillingAddressControl.Address;
            order.City = BillingAddressControl.City;
            order.CountryID = BillingAddressControl.CountryID;
            order.StateID = BillingAddressControl.StateID;
            order.ProvinceID = BillingAddressControl.ProvinceID;
            order.Zipcode = BillingAddressControl.Zipcode;
        }
        else
        {
            order.Address = ShippingAddressControl.Address;
            order.City = ShippingAddressControl.City;
            order.CountryID = ShippingAddressControl.CountryID;
            order.StateID = ShippingAddressControl.StateID;
            order.ProvinceID = ShippingAddressControl.ProvinceID;
            order.Zipcode = ShippingAddressControl.Zipcode;
        }
        AddOrderItems(order);

        order.OrderID = Orders.AddOrder(order);
        SendNewCustomerOrderEmail(orderNo);
        EmailManager.SendNewStoreOrderEmail(order, customer);
        return order;
    }

    private void AddOrderItems(Order order)
    {
        order.OrderItems = new List<OrderItem>();
        foreach (CartItem item in Cart.CartItems)
        {
            OrderItem orderItem = new OrderItem() { ProductID = item.ProductID, PricePerUnit = item.PricePerUnit, Discount = 0, OrderDate = DateTime.Now, Quantity = item.Quantity, Shipping = 0, TotalPrice = item.Subtotal, ProductName = item.ProductName, CatalogNumber = item.CatalogNumber };

            foreach (ProductOption option in item.ProductOptions)
                orderItem.OptionList.Add(new OrderProductOption() { ProductOptionID = option.ProductOptionID });
            foreach (CustomField field in item.CustomFields)
                orderItem.OrderProductCustomFieldList.Add(new OrderProductCustomField() { Active = true, CustomFieldID = field.CustomFieldID, OrderProductCustomFieldValue = field.CustomFieldValue, CustomFieldName = field.CustomFieldName });
            order.OrderItems.Add(orderItem);
        }
    }

    private void AddShipping()
    {
        int shippingProviderID = 0;
        if (!int.TryParse(ShippingLookupDataDropDownList.SelectedValue, out shippingProviderID))
            return;
        //calculate the shipping
        try
        {
            //Flat shipping
            decimal shipping = Orders.GetShippingCosts(shippingProviderID);
            //Add per product shipping
            foreach (CartItem item in Cart.CartItems)
            {
                shipping += Orders.GetProductShippingCosts(BillingAddressControl.CountryID, BillingAddressControl.StateID, BillingAddressControl.ProvinceID, item.ProductID, shippingProviderID) * item.Quantity;
            }
            Cart.Shipping = shipping;
            Cart.Total = Cart.Subtotal + Cart.Tax + Cart.Shipping;
        }
        catch (Exception ex)
        {
            MessageLabel.Text = "Problem calculating shipping cost: " + ex.Message;
        }
    }

    private void AddTaxes()
    {
        Cart.Tax = OrderManager.GetTaxes(BillingAddressControl.CountryID, BillingAddressControl.StateID, BillingAddressControl.ProvinceID, Cart.Subtotal);
        Cart.Total = Cart.Subtotal + Cart.Shipping + Cart.Tax;
    }

    private void SendNewCustomerEmail(string password)
    {
        Dictionary<string, string> replacmentValues = new Dictionary<string, string>();
        replacmentValues.Add("FirstName", FirstNameTextBox.Text);
        replacmentValues.Add("StoreName", ConfigurationManager.AppSettings["StoreName"]);
        replacmentValues.Add("StoreURL", ConfigurationManager.AppSettings["StoreURL"]);
        replacmentValues.Add("Email", EmailTextBox.Text);
        replacmentValues.Add("Password", password);

        string emailBody = EmailManager.GetEmailString(replacmentValues, EmailType.NewCustomerEmail);
        Email.SendSimpleEmail(ConfigurationManager.AppSettings["StoreName"] + " Sales",
            ConfigurationManager.AppSettings["SalesTeamEmail"], new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(EmailTextBox.Text) },
            "Welcome new customer",
            emailBody,
            true);
    }

    private void SendNewCustomerOrderEmail(string orderNo)
    {
        Dictionary<string, string> replacmentValues = new Dictionary<string, string>();
        replacmentValues.Add("FirstName", FirstNameTextBox.Text);
        replacmentValues.Add("OrderNumber", orderNo);
        replacmentValues.Add("StoreName", ConfigurationManager.AppSettings["StoreName"]);
        replacmentValues.Add("StoreURL", ConfigurationManager.AppSettings["StoreURL"]);

        string emailBody = EmailManager.GetEmailString(replacmentValues, EmailType.NewSaleCustomerEmail);
        Email.SendSimpleEmail(ConfigurationManager.AppSettings["StoreName"] + " Sales",
            ConfigurationManager.AppSettings["SalesTeamEmail"], new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(EmailTextBox.Text) },
            "New Order Confirmation",
            emailBody,
            true);
    }

    private bool ChargeCreditCard(string orderNumber)
    {
        bool cardCharged = false;
        OrderManager orderManager = new OrderManager();
        CacheManager cache = new CacheManager();

        string buyerStateOrProvince = string.Empty;
        if (BillingAddressControl.StateID.HasValue)
            buyerStateOrProvince = Payment.GetStateCode(BillingAddressControl.StateID.Value);
        if (BillingAddressControl.ProvinceID.HasValue)
            buyerStateOrProvince = Payment.GetProvinceCode(BillingAddressControl.ProvinceID.Value);

        string response = orderManager.TakePayment(orderNumber,
            Cart.Total.ToString("F"),
        FirstNameTextBox.Text,
        LastNameTextBox.Text,
        BillingAddressControl.Address,
        BillingAddressControl.City,
        buyerStateOrProvince,
        Payment.GetCountryCode(BillingAddressControl.CountryID),
        cache.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByValue(BillingAddressControl.CountryID.ToString()).Text,
        BillingAddressControl.Zipcode,
        PaymentControl1.CardType,
        PaymentControl1.CardNumber,
        PaymentControl1.CCV,
        PaymentControl1.ExpMonth,
        PaymentControl1.ExpYear);

        if (response.Equals("OK"))
            return true;
        else
        {
            MessageLabel.Text = "Billing Error Accured. Please <a href='Contact.aspx'>contact customer support</a>. Error description " + response;
        }

        return cardCharged;
    }

   
}
