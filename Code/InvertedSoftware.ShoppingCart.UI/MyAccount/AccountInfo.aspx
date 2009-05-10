<%@ Page Title="My Account" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountInfo.aspx.cs" Inherits="MyAccount_AccountInfo" %>

<%@ Register src="../UserControls/AddressControl.ascx" tagname="AddressControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
 <ContentTemplate>
 <table cellpadding="2" cellspacing="3" border="0" width="100%">
 <tr>
    <td align="center"><table cellpadding="2" cellspacing="3" border="0">
    <tr>
            <td colspan="3" align="center">
                <asp:ValidationSummary ID="CustomerValidationSummary" runat="server" />
            </td>
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
                    ErrorMessage="First Name is Required">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">Last Name</td>
            <td><asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" 
                    ControlToValidate="LastNameTextBox" runat="server" 
                    ErrorMessage="Last Name is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
        </tr>
       <uc1:AddressControl ID="AddressControl1" runat="server" />
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
        <td colspan="3" align="center">
            <asp:Button ID="SaveButton" runat="server" Text="Save" 
                onclick="SaveButton_Click" /></td>
       </tr>
        </table></td>
 </tr>
 </table>
    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

