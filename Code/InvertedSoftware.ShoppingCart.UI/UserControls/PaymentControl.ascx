<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PaymentControl.ascx.cs" Inherits="UserControls_PaymentControl" %>
<table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td align="right">Name on the card</td>
    <td align="left"><asp:TextBox ID="CardNameTextBox" runat="server"></asp:TextBox></td>
    <td align="left"><asp:RequiredFieldValidator ID="CardNameRequiredFieldValidator" 
            ControlToValidate="CardNameTextBox" runat="server" 
            ErrorMessage="Name on Card is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Card Type</td>
    <td align="left">
        <asp:DropDownList ID="CardTypeDropDownList" runat="server">
            <asp:ListItem Text="Select..." Value=""></asp:ListItem>
            <asp:ListItem Text="Visa" Value="Visa"></asp:ListItem>
            <asp:ListItem Text="MasterCard" Value="MasterCard"></asp:ListItem>
            <asp:ListItem Text="Discover" Value="Discover"></asp:ListItem>
            <asp:ListItem Text="Amex" Value="Amex"></asp:ListItem>
            </asp:DropDownList>
    </td>
    <td align="left"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="CardTypeDropDownList" runat="server" 
            ErrorMessage="Card Type is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Card Number</td>
    <td align="left"><asp:TextBox ID="CardNumberTextBox" runat="server"></asp:TextBox></td>
    <td align="left"><asp:RequiredFieldValidator ID="CardNumberRequiredFieldValidator" 
            ControlToValidate="CardNumberTextBox" runat="server" 
            ErrorMessage="Card Number is Required" Display="Dynamic" 
            SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CardNumberRegularExpressionValidator" 
            runat="server" ControlToValidate="CardNumberTextBox" Display="Dynamic" 
            ErrorMessage="Invalid Card Number" 
            ValidationExpression="^((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7][\d\s-]{13}$">*</asp:RegularExpressionValidator>
        <asp:CustomValidator ID="CardNumberCustomValidator" Display="Dynamic" runat="server" 
            ErrorMessage="Invalid Card Number." 
            ControlToValidate="CardNumberTextBox" onservervalidate="CardNumberCustomValidator_ServerValidate" 
            >*</asp:CustomValidator>
    </td>
</tr>
<tr>
    <td align="right">Expiration Date</td>
    <td align="left">
        <asp:DropDownList ID="MonthDropDownList" runat="server">
            <asp:ListItem Text="Select..." Value=""></asp:ListItem>
            <asp:ListItem Text="01" Value="01"></asp:ListItem>
            <asp:ListItem Text="02" Value="02"></asp:ListItem>
            <asp:ListItem Text="03" Value="03"></asp:ListItem>
            <asp:ListItem Text="04" Value="04"></asp:ListItem>
            <asp:ListItem Text="05" Value="05"></asp:ListItem>
            <asp:ListItem Text="06" Value="06"></asp:ListItem>
            <asp:ListItem Text="07" Value="07"></asp:ListItem>
            <asp:ListItem Text="08" Value="08"></asp:ListItem>
            <asp:ListItem Text="09" Value="09"></asp:ListItem>
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="11" Value="11"></asp:ListItem>
            <asp:ListItem Text="12" Value="12"></asp:ListItem>
            </asp:DropDownList>/
             <asp:DropDownList ID="YearDropDownList" runat="server">
            <asp:ListItem Text="Select..." Value=""></asp:ListItem>
            <asp:ListItem Text="2009" Value="2009"></asp:ListItem>
            <asp:ListItem Text="2010" Value="2010"></asp:ListItem>
            <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
            <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
            <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
            <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
            <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
            <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
            <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
            </asp:DropDownList>
    </td>
    <td align="left"><asp:RequiredFieldValidator ID="MonthRequiredFieldValidator" 
            ControlToValidate="MonthDropDownList" runat="server" 
            ErrorMessage="Exp month is Required" Display="Dynamic">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="YearRequiredFieldValidator" 
            ControlToValidate="YearDropDownList" runat="server" 
            ErrorMessage="Exp Year is Required" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="YearMonthCustomValidator" runat="server" 
            ErrorMessage="Your credit card seems to be expired." 
            ControlToValidate="YearDropDownList" onservervalidate="YearMonthCustomValidator_ServerValidate" 
            >*</asp:CustomValidator></td>
</tr>
<tr>
    <td align="right">CVV</td>
    <td align="left"><asp:TextBox ID="CVVTextBox" MaxLength="3" Columns="3" runat="server"></asp:TextBox></td>
    <td align="left"><asp:RequiredFieldValidator ID="CVVRequiredFieldValidator" 
            ControlToValidate="CVVTextBox" runat="server" ErrorMessage="CVV2 is Required" 
            SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CVVRegularExpressionValidator" 
            runat="server" ControlToValidate="CVVTextBox" Display="Dynamic" 
            ErrorMessage="CVV Not Valid" ValidationExpression="\d{3}|\d{2}">*</asp:RegularExpressionValidator>
    </td>
</tr>
</table>