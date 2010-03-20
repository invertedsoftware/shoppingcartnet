using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class MyAccount_AccountInfo : BasePage
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //Load a customer
        if (!Page.IsPostBack)
            BindForm();
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        SaveAccountInfo();
    }

    public void BindForm()
    {
        try
        {
            Customer = Customers.GetCustomer(GetLoggedCustomerID());
            if (Customer == null)
            {
                MessageLabel.Text = "This member is not a customer.";
                SaveButton.Enabled = false;
                return;
            }
            ComapnyTextBox.Text = Customer.Company;
            FirstNameTextBox.Text = Customer.FirstName;
            LastNameTextBox.Text = Customer.LastName;
            AddressControl1.Address = Customer.Address;
            AddressControl1.City = Customer.City;
            AddressControl1.CountryID = Customer.CountryID;
            AddressControl1.StateID = Customer.StateID;
            AddressControl1.ProvinceID = Customer.ProvinceID;
            AddressControl1.Zipcode = Customer.Zipcode;
            DayPhoneTextBox.Text = Customer.DayPhone;
            EveningPhoneTextBox.Text = Customer.EveningPhone;
            CellPhoneTextBox.Text = Customer.CellPhone;
            FaxTextBox.Text = Customer.Fax;
        }
        catch (Exception e)
        {
            MessageLabel.Text = "Error retrieving account details " + e.Message;
        }
    }

    public void SaveAccountInfo()
    {
        try
        {
            Customer = Customers.GetCustomer(GetLoggedCustomerID());
            Customer.Company = ComapnyTextBox.Text;
            Customer.FirstName = FirstNameTextBox.Text;
            Customer.LastName = LastNameTextBox.Text;
            Customer.Address = AddressControl1.Address;
            Customer.City = AddressControl1.City;
            Customer.StateID = AddressControl1.StateID;
            Customer.ProvinceID = AddressControl1.ProvinceID;
            Customer.CountryID = AddressControl1.CountryID;
            Customer.Zipcode = AddressControl1.Zipcode;
            Customer.DayPhone = DayPhoneTextBox.Text;
            Customer.EveningPhone = EveningPhoneTextBox.Text;
            Customer.CellPhone = CellPhoneTextBox.Text;
            Customer.Fax = FaxTextBox.Text;
            Customers.UpdateCustomer(Customer);
            MessageLabel.Text = "Account Updated";
        }
        catch (Exception e)
        {
            MessageLabel.Text = "Error Updating account " + e.Message;
        }
    }

    public Customer Customer { get; set; }
}
