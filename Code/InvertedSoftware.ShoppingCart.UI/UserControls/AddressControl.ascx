<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressControl.ascx.cs" Inherits="UserControls_AddressControl" %>
<%@ Register Assembly="InvertedSoftware.ShoppingCart.BusinessLayer" Namespace="InvertedSoftware.ShoppingCart.BusinessLayer.Controls"
    TagPrefix="cc1" %>
<tr>
    <td align="right">Address</td>
    <td><asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" 
    ControlToValidate="AddressTextBox" runat="server" 
    ErrorMessage="Address is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">City</td>
    <td><asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="CityRequiredFieldValidator" 
    ControlToValidate="CityTextBox" runat="server" ErrorMessage="City is Required" 
    SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Country</td>
    <td><cc1:LookupDataDropDownList ID="CountryLookupDataDropDownList" Width="200"
    AutoPostBack="true" runat="server" 
    onselectedindexchanged="CountryLookupDataDropDownList_SelectedIndexChanged" LookupType="GetCountries"></cc1:LookupDataDropDownList></td>
    <td><asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" 
    ControlToValidate="CountryLookupDataDropDownList" runat="server" 
    ErrorMessage="Country is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr id="StateProvinceTr" visible="false" runat="server">
    <td align="right">State / Province</td>
    <td><cc1:LookupDataDropDownList ID="StateProvinceLookupDataDropDownList" LookupType="NoBinding" AutoPostBack="true" runat="server"></cc1:LookupDataDropDownList></td>
    <td><asp:RequiredFieldValidator ID="StateRequiredFieldValidator" 
    ControlToValidate="StateProvinceLookupDataDropDownList" runat="server" 
    ErrorMessage="State/Province is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Zipcode</td>
    <td><asp:TextBox ID="ZipcodeTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="ZipcodeRequiredFieldValidator" 
    ControlToValidate="ZipcodeTextBox" runat="server" 
    ErrorMessage="Zipcode is Required" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
