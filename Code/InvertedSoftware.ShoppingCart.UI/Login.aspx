<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register src="UserControls/LoginControl.ascx" tagname="LoginControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td align="center"><uc1:LoginControl ID="LoginControl1" runat="server" /></td>
</tr>
<tr>
    <td align="center"><a href="ForgotPassword.aspx">Forgot your password?</a> </td>
</tr>
</table>
    
</asp:Content>

