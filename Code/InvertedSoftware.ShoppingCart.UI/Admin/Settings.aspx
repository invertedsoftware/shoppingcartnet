<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Admin_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" cellspacing="3" border="0" width="70%">
<tr>
    <td style="width:40%"></td>
    <td>
                        <table cellpadding="2" cellspacing="3" border="0">
                        <tr>
                            <td colspan="2">Configuration Variables.</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
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
                                <asp:TextBox ID="PayPalAPIPassword" runat="server"></asp:TextBox></td>
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
                                <asp:TextBox ID="GoogleImageButtonURL" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="GoogleCheckoutURLLabel" runat="server" AssociatedControlID="GoogleCheckoutURL">Google Image Button URL:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="GoogleCheckoutURL" runat="server"></asp:TextBox></td>
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
                            <td colspan="2" align="center">
                                <asp:Button ID="EditButton" runat="server" Text="Save" 
                                    onclick="EditButton_Click" />
                            </td>
                        </tr>
                    </table>
                    </td>
</tr>
</table>
</asp:Content>

