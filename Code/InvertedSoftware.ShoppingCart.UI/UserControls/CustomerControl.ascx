<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerControl.ascx.cs" Inherits="UserControls_CustomerControl" %>
<%@ Register src="AddressControl.ascx" tagname="AddressControl" tagprefix="uc1" %>
<table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td align="right">Company</td>
    <td><asp:TextBox ID="CompanyTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">First Name</td>
    <td><asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" ControlToValidate="FirstNameTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Last Name</td>
    <td><asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" ControlToValidate="LastNameTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator></td>
</tr>
<uc1:AddressControl ID="AddressControl" runat="server" />
<tr>
    <td align="right">Day Phone</td>
    <td><asp:TextBox ID="DayPhoneTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">Evening Phone</td>
    <td><asp:TextBox ID="EveningPhoneTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="EveningPhoneRequiredFieldValidator" ControlToValidate="EveningPhoneTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Cell</td>
    <td><asp:TextBox ID="CellPhoneTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">Fax</td>
    <td><asp:TextBox ID="FaxTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">Email</td>
    <td><asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" ControlToValidate="EmailTextBox" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Email Not Valid" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</td>
</tr>
</table>