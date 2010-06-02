using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

public partial class UserControls_CustomFieldsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindCustomFields()
    {
        //Get groups
        CustomFieldsRepeater.DataSource = customFields;
        CustomFieldsRepeater.DataBind();
    }

    private int productID;
    private List<CustomField> customFields;

    public int ProductID
    {
        get
        {
            return productID;
        }
        set
        {
            productID = value;
            customFields = Products.GetCustomFields(productID);
            BindCustomFields();
        }
    }

    public List<CustomField> CustomFields
    {
        get
        {
            RepeaterItemCollection items = CustomFieldsRepeater.Items;
            foreach (RepeaterItem item in items)
            {
                Label FieldNameLabel = item.FindControl("FieldNameLabel") as Label;
                Control CustomFieldControl = item.FindControl("CustomField").FindControl("CustomFieldControl");
                if (FieldNameLabel == null || CustomFieldControl == null)
                    continue;
                if (CustomFieldControl is TextBox)
                    customFields.Where(a => a.CustomFieldName.Equals(FieldNameLabel.Text)).FirstOrDefault().CustomFieldValue = ((TextBox)CustomFieldControl).Text;
                else if(CustomFieldControl is CheckBox)
                    customFields.Where(a => a.CustomFieldName.Equals(FieldNameLabel.Text)).FirstOrDefault().CustomFieldValue = ((CheckBox)CustomFieldControl).Checked.ToString();
            }
            return customFields;
        }
    }

    protected void CustomFieldsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HtmlTableCell CustomFieldCell = e.Item.FindControl("CustomField") as HtmlTableCell;
        if (CustomFieldCell == null)
            return;
        CustomField field = e.Item.DataItem as CustomField;
        if (field == null)
            return;
        switch (field.CustomFieldTypeName)
        {
            case "TextBox":
                TextBox CustomFieldTextBox = new TextBox();
                CustomFieldTextBox.ID = "CustomFieldControl";
                CustomFieldCell.Controls.Add(CustomFieldTextBox);
                if (field.IsRequired)
                {
                    RequiredFieldValidator CustomFieldTextBoxRequiredFieldValidator = new RequiredFieldValidator();
                    CustomFieldTextBoxRequiredFieldValidator.ControlToValidate = "CustomFieldControl";
                    CustomFieldTextBoxRequiredFieldValidator.ErrorMessage = "Required";
                    //CustomFieldTextBoxRequiredFieldValidator
                    CustomFieldCell.Controls.Add(CustomFieldTextBoxRequiredFieldValidator);
                }
                break;
            case "CheckBox":
                CheckBox CustomFieldCheckBox = new CheckBox();
                CustomFieldCheckBox.ID = "CustomFieldControl";
                CustomFieldCell.Controls.Add(CustomFieldCheckBox);
                break;
            default:
                TextBox DefaultCustomFieldTextBox = new TextBox();
                DefaultCustomFieldTextBox.ID = "CustomFieldControl";
                CustomFieldCell.Controls.Add(DefaultCustomFieldTextBox);
                break;
        }
    }
}
