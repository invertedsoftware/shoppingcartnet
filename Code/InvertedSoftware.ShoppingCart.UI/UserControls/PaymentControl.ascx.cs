using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

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

    protected void CardNumberCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (IsCreditCardValid(args.Value))
            args.IsValid = true;
        else
            args.IsValid = false;
    }

    /// <summary>
    /// Validates a credit card number using the standard Luhn/mod10 validation algorithm.
    /// </summary>
    /// <param name="cardNumber">Card number, with or without punctuation</param>
    /// <returns>True if card number appears valid, false if not
    /// </returns>
    public bool IsCreditCardValid(string cardNumber)
    {
        const string allowed = "0123456789";
        int i;

        StringBuilder cleanNumber = new StringBuilder();
        for (i = 0; i < cardNumber.Length; i++)
        {
            if (allowed.IndexOf(cardNumber.Substring(i, 1)) >= 0)
                cleanNumber.Append(cardNumber.Substring(i, 1));
        }
        if (cleanNumber.Length < 13 || cleanNumber.Length > 16)
            return false;

        for (i = cleanNumber.Length + 1; i <= 16; i++)
            cleanNumber.Insert(0, "0");

        int multiplier, digit, sum, total = 0;
        string number = cleanNumber.ToString();

        for (i = 1; i <= 16; i++)
        {
            multiplier = 1 + (i % 2);
            digit = int.Parse(number.Substring(i - 1, 1));
            sum = digit * multiplier;
            if (sum > 9)
                sum -= 9;
            total += sum;
        }
        return (total % 10 == 0);
    }

}
