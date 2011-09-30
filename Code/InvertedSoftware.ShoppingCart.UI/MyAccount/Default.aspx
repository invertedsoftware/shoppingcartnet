<%@ Page Title="My Account" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MyAccount_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0" width="60%">
<tr>
    <td><a href="Orders.aspx">Orders</a></td>
    <td><a href="GiftRegistry.aspx">Gift Registry</a></td>
    <td><a href="AccountInfo.aspx">Update Account Info</a></td>
    <td><a href="UpdatePassword.aspx">Update Account Password</a> </td>
    <td><a href="../FAQ.aspx">FAQ</a></td>
    <td><a href="../Support.aspx">Contact Customer Support</a></td>
</tr>
</table>
</asp:Content>

