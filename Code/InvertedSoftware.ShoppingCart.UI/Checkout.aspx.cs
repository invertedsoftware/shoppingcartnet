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
            // If there are only Downloadable items in the cart no need for shipping
            CartManager manager = new CartManager(this.Cart);
            if (manager.IsCartDownloadable())
            {
                ShippingPanel.Visible = false;
                ShippingRequiredFieldValidator.Enabled = false;
                NoShippingLiteral.Text = "Download Only";
                NoShippingLiteral.Visible = true;
            }
            else if (manager.IsCartFreeShipping())
            {
                ShippingPanel.Visible = false;
                ShippingRequiredFieldValidator.Enabled = false;
                NoShippingLiteral.Text = "Free Shipping";
                NoShippingLiteral.Visible = true;
            }
            Customer customer = GetLoggedCustomer();
            if (customer != null)
            {
                LoadCustomer(customer);
                EmailTextBox.Enabled = false;
            }
            // If this is a purchase for a gift registry, no need for a shipping address
            if (this.Cart.GiftRegistryID > 0)
                ShippingCheckBox.Text = "Ship to Address in Gift Registry";
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
                //Expire any coupons, clear the cart and redirect to Receipt.aspx
                Cart.CartCoupons.Where(c => c.IsCouponUnique).All((c) => { Coupons.DeactivateCoupon(c.CouponID); return true; });
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
            Active = true
        };

        return CustomerManager.AddCustomer(customer);
    }

    private Order AddOrder(Customer customer)
    {
        PasswordGenerator gen = new PasswordGenerator() { ConsecutiveCharacters = true, ExcludeSymbols = true, Maximum = 25, Minimum = 25, RepeatCharacters = true };
        string orderNo = gen.Generate();

        Order order = new Order()
        {
            CustomerID = customer.CustomerID,
            OrderNumber = orderNo,
            DatePlaced = DateTime.Now,
            OrderStatusID = (int)OrderStatusEnum.Accepted,
            Tax = Cart.Tax,
            Shipping = Cart.Shipping,
            Total = Cart.Total,
            OrderDate = DateTime.Now,
            Active = true,
            Comments = CommentsTextBox.Text
        };
        if (Cart.GiftRegistryID > 0)
            order.Comments = "This is a Gift Registry Order " + order.Comments;
        if (ShippingLookupDataDropDownList.Visible)
            order.ShippingProviderID = Convert.ToInt32(ShippingLookupDataDropDownList.SelectedValue);

        if (ShippingCheckBox.Checked && Cart.GiftRegistryID == 0)
        {
            order.Address = BillingAddressControl.Address;
            order.City = BillingAddressControl.City;
            order.CountryID = BillingAddressControl.CountryID;
            order.StateID = BillingAddressControl.StateID;
            order.ProvinceID = BillingAddressControl.ProvinceID;
            order.Zipcode = BillingAddressControl.Zipcode;
        }
        else if (ShippingCheckBox.Checked && Cart.GiftRegistryID > 0)
        {
            // Get the address of the Gift Registry
            int customerID = GiftRegistries.GetGiftRegistry(Cart.GiftRegistryID, 0, string.Empty, false).CustomerID;
            Customer registryCustomer = Customers.GetCustomer(customerID);
            order.Address = registryCustomer.Address;
            order.City = registryCustomer.City;
            order.CountryID = registryCustomer.CountryID;
            order.StateID = registryCustomer.StateID;
            order.ProvinceID = registryCustomer.ProvinceID;
            order.Zipcode = registryCustomer.Zipcode;
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
            OrderItem orderItem = new OrderItem()
            {
                ProductID = item.ProductID,
                PricePerUnit = item.PricePerUnit,
                Discount = 0,
                OrderDate = DateTime.Now,
                Quantity = item.Quantity,
                Shipping = 0,
                TotalPrice = item.Subtotal,
                ProductName = item.ProductName,
                CatalogNumber = item.CatalogNumber,
                Active = true
            };

            // For downloadable products get a key if needed
            if (item.IsDownloadable)
            {
                orderItem.DownloadURL = item.DownloadURL;
                if (item.IsDownloadKeyRequired)
                    orderItem.DownloadKey = Products.GetNextProductKey(item.ProductID, item.IsDownloadKeyUnique);
            }
            // Deactivate item in gift registry
            if (Cart.GiftRegistryID > 0 && item.GiftRegistryProductID > 0)
                GiftRegistries.UpdateRegistryProductActive(Cart.GiftRegistryID, item.GiftRegistryProductID, false);

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
        Cart.Tax = OrderManager.GetTaxes(BillingAddressControl.CountryID, BillingAddressControl.StateID, BillingAddressControl.ProvinceID, Cart.Subtotal, Cart.Shipping);
        Cart.Total = Cart.Subtotal + Cart.Shipping + Cart.Tax;
    }

    private void SendNewCustomerOrderEmail(string orderNo)
    {
        Dictionary<string, string> replacmentValues = new Dictionary<string, string>();
        replacmentValues.Add("FirstName", FirstNameTextBox.Text);
        replacmentValues.Add("OrderNumber", orderNo);
        replacmentValues.Add("StoreName", StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName));
        replacmentValues.Add("StoreURL", StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL));

        string emailBody = EmailManager.GetEmailString(replacmentValues, EmailType.NewSaleCustomerEmail);
        Email.SendSimpleEmail(StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreName) + " Sales",
            StoreConfiguration.GetConfigurationValue(ConfigurationKey.SalesTeamEmail), new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(EmailTextBox.Text) },
            "New Order Confirmation",
            emailBody,
            true);
    }

    private bool ChargeCreditCard(string orderNumber)
    {
        bool cardCharged = false;
        try
        {
            OrderManager orderManager = new OrderManager();

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
            CacheManager.GetCachedLookupTable(LookupDataEnum.GetCountries).FindByValue(BillingAddressControl.CountryID.ToString()).Text,
            BillingAddressControl.Zipcode,
            PaymentControl1.CardType,
            PaymentControl1.CardNumber,
            PaymentControl1.CCV,
            PaymentControl1.ExpMonth,
            PaymentControl1.ExpYear);

            if (response.Equals("OK"))
            {
                RemoveFromInventory();
                return true;
            }
            else
            {
                MessageLabel.Text = "Billing Error Accured. Please <a href='Contact.aspx'>contact customer support</a>. Error description " + response;
            }
        }
        catch (Exception e)
        {
             MessageLabel.Text = "Billing Error Accured. Please <a href='Contact.aspx'>contact customer support</a>. Error description " + e.Message;
        }

        return cardCharged;
    }

    private void RemoveFromInventory()
    {
        foreach (CartItem item in Cart.CartItems)
        {
            if (item.ProductOptions.Count == 0)
                InvertedSoftware.ShoppingCart.DataLayer.Database.Inventory.UpdateProductInventory(item.ProductID, new List<int>(), item.Quantity);
            else
                InvertedSoftware.ShoppingCart.DataLayer.Database.Inventory.UpdateProductInventory(item.ProductID, item.ProductOptions.Select(o => o.ProductOptionID).ToList(), item.Quantity);
        }
    }
}
