<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ Register src="UserControls/AddressControl.ascx" tagname="AddressControl" tagprefix="uc1" %>

<%@ Register src="UserControls/PaymentControl.ascx" tagname="PaymentControl" tagprefix="uc2" %>

<%@ Register src="UserControls/CartSummaryControl.ascx" tagname="CartSummaryControl" tagprefix="uc3" %>

<%@ Register assembly="InvertedSoftware.ShoppingCart.BusinessLayer" namespace="InvertedSoftware.ShoppingCart.BusinessLayer.Controls" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
   Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
   Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
   
   function BeginRequestHandler(sender, args)
   {
        var postbackElem = args.get_postBackElement();
        postbackElem.disabled = true;
    }

    function EndRequestHandler(sender, args) {
        var label = $get('errorMessage');
        if (args.get_error() != undefined) {
            args.set_errorHandled(true);
            label.innerHTML = '<b>' + args.get_error().message + '</b>';
        }
        else {
            label.innerHTML = '';
        }
    }
    </script>
    
    <span id="errorMessage"></span>
    <asp:UpdatePanel ID="CheckoutUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:Label ID="MessageLabel" runat="server"></asp:Label><br /><br />
    <table cellpadding="2" cellspacing="3" border="0" width="80%">
<tr>
    <td>
        <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            Returning Customer? <a href="Login.aspx">Login here to your account</a>
        </AnonymousTemplate>
        <LoggedInTemplate>
            Welcome back <asp:LoginName ID="LoginName1" runat="server" />
        </LoggedInTemplate>
        </asp:LoginView>
        </td>
    <td><asp:CheckBox ID="ShippingCheckBox" 
            Text="Shipping Address Same As Billing Address" Checked="true" AutoPostBack="true" runat="server" 
            oncheckedchanged="ShippingCheckBox_CheckedChanged" /></td>
    <td align="left" rowspan="4" valign="top">
    <table cellpadding="2" cellspacing="3" border="0">
        <tr>
            <td><uc3:CartSummaryControl ID="CartSummaryControl1" runat="server" /></td>
        </tr>
        <tr>
            <td><b>Subtotal: <%= Cart.Subtotal.ToString("c") %></b></td>
        </tr>
        <tr>
            <td><b>Shipping: <%= Cart.Shipping.ToString("c") %></b></td>
        </tr>
        <tr>
            <td><b>Tax: <%= Cart.Tax.ToString("c") %></b></td>
        </tr>
        <tr>
            <td><b>Total: <%= Cart.Total.ToString("c") %></b></td>
        </tr>
        </table>
    </td>
</tr>
<tr>
    <td>
        <table cellpadding="2" cellspacing="3" border="0">
        <tr>
            <td align="right">Company</td>
            <td><asp:TextBox ID="ComapnyTextBox" runat="server"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">First Name</td>
            <td><asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" 
                    ControlToValidate="FirstNameTextBox" runat="server" 
                    ErrorMessage="First Name is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">Last Name</td>
            <td><asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" 
                    ControlToValidate="LastNameTextBox" runat="server" 
                    ErrorMessage="Last Name is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
        </tr>
        <uc1:AddressControl ID="BillingAddressControl" runat="server" />
        <tr>
            <td align="right">Day Phone</td>
            <td><asp:TextBox ID="DayPhoneTextBox" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">Evening Phone</td>
            <td><asp:TextBox ID="EveningPhoneTextBox" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="EveningPhoneRequiredFieldValidator" 
                    ControlToValidate="EveningPhoneTextBox" runat="server" 
                    ErrorMessage="Evening Phone is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">Cell Phone</td>
            <td><asp:TextBox ID="CellPhoneTextBox" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">Fax</td>
            <td><asp:TextBox ID="FaxTextBox" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">Email</td>
            <td><asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" 
                    ControlToValidate="EmailTextBox" runat="server" 
                    ErrorMessage="Email is Required" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" 
                    runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" 
                    ErrorMessage="Email not Valid" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    SetFocusOnError="True">*</asp:RegularExpressionValidator>
                <asp:CustomValidator ID="EmailCustomValidator" runat="server" 
                    ErrorMessage="The Email Address you entered already exists in the system. Please sign into your account to continue or enter a different Email Address." ControlToValidate="EmailTextBox" 
                    Display="Dynamic" onservervalidate="EmailCustomValidator_ServerValidate" 
                    SetFocusOnError="True">*</asp:CustomValidator>
            </td>
        </tr>
        </table>
    </td>
    <td valign="top">
        <table cellpadding="2" cellspacing="3" border="0">
        <uc1:AddressControl ID="ShippingAddressControl" Enabled="false" runat="server" />
           <tr>
           <td align="right">Select Shipping Method</td>
            <td >
            <asp:Panel ID="ShippingPanel" runat="server">
            <cc1:LookupDataDropDownList ID="ShippingLookupDataDropDownList" 
                    LookupType="GetShippingPoviders" runat="server" 
                AutoPostBack="True" 
                    onselectedindexchanged="ShippingLookupDataDropDownList_SelectedIndexChanged">
            </cc1:LookupDataDropDownList>
            </asp:Panel>
            <asp:Literal ID="DownloadLiteral" Visible="false" runat="server">Download Only</asp:Literal>
            </td>
               
            <td><asp:RequiredFieldValidator ID="ShippingRequiredFieldValidator" 
                    ControlToValidate="ShippingLookupDataDropDownList" runat="server" 
                    ErrorMessage="Please select Shipping Method">*</asp:RequiredFieldValidator></td>
           </tr>
           <tr>
             <td align="right">Comments</td>
            <td colspan="2">
                <asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" MaxLength="400" Rows="10" runat="server"></asp:TextBox></td>
           </tr>
        </table> 
    </td>
</tr>
<tr>
    <td colspan="3" align="center">
        <uc2:PaymentControl ID="PaymentControl1" runat="server" />
    </td>
</tr>
<tr>
    <td colspan="2" align="center"><asp:Button ID="BuyButton" runat="server" 
            Text="complete purchase" onclick="BuyButton_Click" /></td>
</tr>
</table>
</ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

