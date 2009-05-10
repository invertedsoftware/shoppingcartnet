using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_PaymentControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string CardName
    {
        get
        {
            return CardNameTextBox.Text;
        }
        set
        {
            CardNameTextBox.Text = value;
        }
    }

    public string CardType
    {
        get
        {
            return CardTypeDropDownList.SelectedValue;
        }
        set
        {
            CardTypeDropDownList.SelectedValue = value;
        }
    }

    public string CardNumber
    {
        get
        {
            return CardNumberTextBox.Text;
        }
        set
        {
            CardNumberTextBox.Text = value;
        }
    }

    public string ExpMonth
    {
        get
        {
            return MonthDropDownList.SelectedValue;
        }
        set
        {
            MonthDropDownList.SelectedValue = value;
        }
    }

    public string ExpYear
    {
        get
        {
            return YearDropDownList.SelectedValue;
        }
        set
        {
            YearDropDownList.SelectedValue = value;
        }
    }

    public string CCV
    {
        get
        {
            return CVVTextBox.Text;
        }
        set
        {
            CVVTextBox.Text = value;
        }
    }

    protected void YearMonthCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (MonthDropDownList.SelectedIndex > 0 && YearDropDownList.SelectedIndex > 0)
        {
            DateTime cardExpDate = DateTime.Parse(MonthDropDownList.SelectedValue + "/1/" + YearDropDownList.SelectedValue);

            if (DateTime.Compare(DateTime.Now, cardExpDate) < 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    }
}
