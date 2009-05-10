using System;
using System.Configuration;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.Common;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        try
        {
            StringBuilder sb = new StringBuilder();
            // Build the email body
            sb.Append("Name: " + NameTextBox.Text + "<br>");
            sb.Append("Email: " + EmailTextBox.Text + "<br>");
            sb.Append("Phone: " + PhoneTextBox.Text + "<br>");
            sb.Append("Subject: " + SubjectDropDownList.SelectedValue + "<br>");
            sb.Append("Order Number: " + OrderNumberTextBox.Text + "<br>");
            sb.Append("Comments: " + CommentsTextBox.Text + "<br>");
            sb.Append("Where did you hear about us? " + AboutTextBox.Text + "<br>");

            Email.SendSimpleEmail(NameTextBox.Text, 
                EmailTextBox.Text,
                new List<System.Net.Mail.MailAddress>() { new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings["ContactEmail"]) },
                "Contact Form - " + SubjectDropDownList.SelectedValue, 
                sb.ToString(), 
                true);

            MessageLabel.Text = "Your inquiry has been sent to us. Please allow for two business days to respond.";
            SubmitButton.Enabled = false;
        }
        catch (Exception ex)
        {
            MessageLabel.Text = "Error sending email: " + ex.Message;
        }
    }
}
