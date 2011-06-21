<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Setup_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        oncreateduser="CreateUserWizard1_CreatedUser" 
        onnextbuttonclick="CreateUserWizard1_NextButtonClick" 
        onfinishbuttonclick="CreateUserWizard1_FinishButtonClick">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
                <ContentTemplate>
                    <table border="0">
                        <tr>
                            <td colspan="2">
                                Welcome to your new Shopping Cart NET store. Let’s help you get started.<br />
First let’s create an Admin account for you.<br />
Using this account you can log onto your store’s management panel by simply typing yourdomain.com/admin.
</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="The Password and Confirmation Password must match." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
  
            <asp:TemplatedWizardStep ID="Configuration" runat="server" 
                Title="Configuration">
                <ContentTemplate>
                <table border="0">
                        <tr>
                            <td colspan="2">
                                 Next let’s add the basic site configuration variables.
                        </td>
                        </tr>
                      
                        <tr>
                            <td align="right">
                                <asp:Label ID="StoreNameLabel" runat="server" AssociatedControlID="StoreName">Store Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="StoreName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="StoreNameRequired" runat="server" 
                                    ControlToValidate="StoreName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="StoreURLLabel" runat="server" AssociatedControlID="StoreURL">Store URL:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="StoreURL" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="StoreURLRequired" runat="server" 
                                    ControlToValidate="StoreURL" ErrorMessage="Store URL is required." 
                                    ToolTip="Store URL is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="StoreURLRegularExpression" ControlToValidate="StoreURL" 
                                    runat="server" ErrorMessage="URL is invalid." ToolTip="URL is invalid." 
                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                       <tr>
                            <td align="right">
                                <asp:Label ID="SalesTeamEmailLabel" runat="server" AssociatedControlID="SalesTeamEmail">Sales Email:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="SalesTeamEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="SalesTeamEmailRequired" runat="server" 
                                    ControlToValidate="SalesTeamEmail" ErrorMessage="Sales Email is required." 
                                    ToolTip="Sales Email is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="SalesTeamEmailRegularExpression" 
                                    ControlToValidate="SalesTeamEmail" runat="server" 
                                    ErrorMessage="Email is invalid." ToolTip="Email is invalid." 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="NewOrdersEmailLabel" runat="server" AssociatedControlID="NewOrdersEmail">New Orders Email:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="NewOrdersEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NewOrdersEmailRequired" runat="server" 
                                    ControlToValidate="NewOrdersEmail" ErrorMessage="New Orders Email is required." 
                                    ToolTip="New Orders Email is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="NewOrdersEmailRegularExpression" 
                                    ControlToValidate="NewOrdersEmail" runat="server" 
                                    ErrorMessage="Email is invalid." ToolTip="Email is invalid." 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ContactEmailLabel" runat="server" AssociatedControlID="ContactEmail">Main Contact Email:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ContactEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ContactEmailRequired" runat="server" 
                                    ControlToValidate="ContactEmail" ErrorMessage="Contact Email is required." 
                                    ToolTip="Contac Email is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="ContactEmailExpression" 
                                    ControlToValidate="ContactEmail" runat="server" 
                                    ErrorMessage="Email is invalid." ToolTip="Email is invalid." 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TemplatedWizardStep>
            <asp:TemplatedWizardStep runat="server" ID="Payment" Title="Payment">
            <ContentTemplate>
            <table border="0">
                        <tr>
                            <td colspan="2">
                                 We are almost done. Let’s add the PayPal and Google Checkout information.<br />
                                 Then you will be ready to accept credit card payments.<br />
                                 If you don’t have a PayPal or Google Checkout yet just skip this step.<br />
                                 Don’t worry. You can always fill it in later from your Settings screen.
                        </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PayPalAPIUsernameLabel" runat="server" AssociatedControlID="PayPalAPIUsername">PayPal API Username:</asp:Label>
                            </td>
                            <td><asp:TextBox ID="PayPalAPIUsername" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PayPalAPIPasswordLabel" runat="server" AssociatedControlID="PayPalAPIPassword">PayPal API Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="PayPalAPIPassword" TextMode="Password" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PayPalAPISignatureLabel" runat="server" AssociatedControlID="PayPalAPISignature">PayPal API Signature:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="PayPalAPISignature" runat="server"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="GoogleCheckoutEnabledLabel" runat="server" AssociatedControlID="GoogleCheckoutEnabled">Google Checkout Enabled?</asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="GoogleCheckoutEnabled" runat="server" /></td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="GoogleMerchantIDLabel" runat="server" AssociatedControlID="GoogleMerchantID">Google MerchantID:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GoogleMerchantID" runat="server"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="GoogleMerchantkeyLabel" runat="server" AssociatedControlID="GoogleMerchantkey">Google Merchant key:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GoogleMerchantkey" runat="server"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="GoogleImageButtonURLLabel" runat="server" AssociatedControlID="GoogleImageButtonURL">Google Image Button URL:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GoogleImageButtonURL" Text="http://sandbox.google.com/checkout/buttons/checkout.gif?merchant_id={0}&amp;w=180&amp;h=46&amp;style=white&amp;variant=text&amp;loc=en_US" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="GoogleCheckoutURLLabel" runat="server" AssociatedControlID="GoogleCheckoutURL">Google Image Button URL:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GoogleCheckoutURL" Text="https://sandbox.google.com/checkout/api/checkout/v2/merchantCheckout/Merchant/{0}" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AuthorizeNetTestModeLabel" runat="server" AssociatedControlID="AuthorizeNetTestMode">AuthorizeNet in test mode:</asp:Label>
                            </td>
                             <td>
                                <asp:CheckBox ID="AuthorizeNetTestMode" runat="server" /></td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="AuthorizeNetAPILoginIDLabel" runat="server" AssociatedControlID="AuthorizeNetAPILoginID">AuthorizeNet Login ID:</asp:Label>
                            </td>
                              <td>
                                <asp:TextBox ID="AuthorizeNetAPILoginID" Text="" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AuthorizeNetTransactionKeyLabel" runat="server" AssociatedControlID="AuthorizeNetTransactionKey">AuthorizeNet Transaction Key:</asp:Label>
                            </td>
                             <td>
                                <asp:TextBox ID="AuthorizeNetTransactionKey" Text="" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
            </ContentTemplate>
            </asp:TemplatedWizardStep>
            <asp:CompleteWizardStep runat="server" >
                <ContentTemplate>
                    <table border="0">
                        <tr>
                            <td align="center" colspan="2">
                                Complete</td>
                        </tr>
                        <tr>
                            <td>
                                Thank you. You are now ready to add products to your store.<Br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Don’t forget to read the quick startup file quickstart.txt located at the root 
                                directory of your new shopping cart before you accept any orders.</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" Text="Take me to Admin Panel" 
                                    ValidationGroup="CreateUserWizard1" onclick="ContinueButton_Click" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>

