using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class UserControls_AddressControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string Address
    {
        get
        {
            return AddressTextBox.Text;
        }
        set
        {
            AddressTextBox.Text = value;
        }
    }

    public string City
    {
        get
        {
            return CityTextBox.Text;
        }
        set
        {
            CityTextBox.Text = value;
        }
    }

    public int? StateID
    {
        get
        {
            if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "UNITED STATES")
            {
                int stateID = 0;
                int.TryParse(StateProvinceLookupDataDropDownList.SelectedValue, out stateID);
                return stateID;
            }
            else
                return null;
        }
        set
        {
            if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "UNITED STATES")
            {
                if (value.HasValue && value.Value != 0)
                    StateProvinceLookupDataDropDownList.SelectedValue = value.Value.ToString();
                else
                    StateProvinceLookupDataDropDownList.SelectedValue = string.Empty;
            }
        }
    }

    public int? ProvinceID
    {
        get
        {
            if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "CANADA")
            {
                int provinceID = 0;
                int.TryParse(StateProvinceLookupDataDropDownList.SelectedValue, out provinceID);
                return provinceID;
            }
            else
                return null;
        }
        set
        {
            if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "CANADA")
            {
                if (value.HasValue && value.Value != 0)
                    StateProvinceLookupDataDropDownList.SelectedValue = value.Value.ToString();
                else
                    StateProvinceLookupDataDropDownList.SelectedValue = string.Empty;
            }

        }
    }

    public int CountryID
    {
        get
        {
            int countryID = 0;
            int.TryParse(CountryLookupDataDropDownList.SelectedValue, out countryID);
            return countryID;
        }
        set
        {
            if (CountryLookupDataDropDownList.Items.FindByValue(value.ToString()) != null)
            {
                CountryLookupDataDropDownList.SelectedValue = value.ToString();
                CountryLookupDataDropDownList_SelectedIndexChanged(null, null);
            }
        }
    }

    public string Zipcode
    {
        get
        {
            return ZipcodeTextBox.Text;
        }
        set
        {
            ZipcodeTextBox.Text = value;
        }
    }

    public bool Enabled
    {
        set
        {
            AddressTextBox.Enabled = value;
            CityTextBox.Enabled = value;
            StateProvinceLookupDataDropDownList.Enabled = value;
            CountryLookupDataDropDownList.Enabled = value;
            ZipcodeTextBox.Enabled = value;
            AddressRequiredFieldValidator.Enabled = value;
            CityRequiredFieldValidator.Enabled = value;
            CountryRequiredFieldValidator.Enabled = value;
            ZipcodeRequiredFieldValidator.Enabled = value;
        }
    }

    protected void CountryLookupDataDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "UNITED STATES")
        {
            StateProvinceLookupDataDropDownList.LookupType = LookupDataEnum.GetStates;
            StateProvinceLookupDataDropDownList.DataBind();
            StateProvinceTr.Visible = true;
        }
        else if (CountryLookupDataDropDownList.SelectedItem != null && CountryLookupDataDropDownList.SelectedItem.Text == "CANADA")
        {
            StateProvinceLookupDataDropDownList.LookupType = LookupDataEnum.GetProvinces;
            StateProvinceLookupDataDropDownList.DataBind();
            StateProvinceTr.Visible = true;
        }
        else
        {
            StateProvinceLookupDataDropDownList.LookupType = LookupDataEnum.NoBinding;
            StateProvinceTr.Visible = false;
        }
    }
}
