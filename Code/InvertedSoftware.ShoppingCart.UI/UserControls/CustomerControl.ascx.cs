using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_CustomerControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string Company
    {
        get
        {
            return CompanyTextBox.Text;
        }
        set
        {
            CompanyTextBox.Text = value;
        }
    }

    public string FirstName
    {
        get
        {
            return FirstNameTextBox.Text;
        }
        set
        {
            FirstNameTextBox.Text = value;
        }
    }

    public string LastName
    {
        get
        {
            return LastNameTextBox.Text;
        }
        set
        {
            LastNameTextBox.Text = value;
        }
    }

    public string Address
    {
        get
        {
            return AddressControl.Address;
        }
        set
        {
            AddressControl.Address = value;
        }
    }

    public string City
    {
        get
        {
            return AddressControl.City;
        }
        set
        {
            AddressControl.City = value;
        }
    }

    public int? StateID
    {
        get
        {
            return AddressControl.StateID;
        }
        set
        {
            AddressControl.StateID = value;
        }
    }

    public int CountryID
    {
        get
        {
            return AddressControl.CountryID;
        }
        set
        {
            AddressControl.CountryID = value;
        }
    }

    public string Zipcode
    {
        get
        {
            return AddressControl.Zipcode;
        }
        set
        {
            AddressControl.Zipcode = value;
        }
    }

    public string DayPhone
    {
        get
        {
            return DayPhoneTextBox.Text;
        }
        set
        {
            DayPhoneTextBox.Text = value;
        }
    }

    public string EveningPhone
    {
        get
        {
            return EveningPhoneTextBox.Text;
        }
        set
        {
            EveningPhoneTextBox.Text = value;
        }
    }

    public string CellPhone
    {
        get
        {
            return CellPhoneTextBox.Text;
        }
        set
        {
            CellPhoneTextBox.Text = value;
        }
    }

    public string Fax
    {
        get
        {
            return FaxTextBox.Text;
        }
        set
        {
            FaxTextBox.Text = value;
        }
    }

    public string Email
    {
        get
        {
            return EmailTextBox.Text;
        }
        set
        {
            EmailTextBox.Text = value;
        }
    }
}
