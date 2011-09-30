<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register src="UserControls/AddressControl.ascx" tagname="AddressControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table cellpadding="2" cellspacing="3" border="0">
         <tr>
            <td colspan="3" align="center"><b>please use this form to register. A password will be emailed to you.</b></td>
        </tr>
        <tr>
            <td colspan="3" align="center"><asp:ValidationSummary ID="ValidationSummary1" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="3" align="center"><asp:Label ID="MessageLabel" runat="server"></asp:Label></td>
        </tr>
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
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="RegisterButton" runat="server" Text="Register" 
                    onclick="RegisterButton_Click" />
            </td>
        </tr>
        </table>
</asp:Content>

