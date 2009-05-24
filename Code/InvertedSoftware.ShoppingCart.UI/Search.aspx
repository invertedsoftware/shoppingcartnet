<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register src="UserControls/ProductsGridControl.ascx" tagname="ProductsGridControl" tagprefix="uc1" %>

<%@ Register src="UserControls/FeaturedProductsControl.ascx" tagname="FeaturedProductsControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td align="center"><b><%= Request.QueryString["Keyword"]%></b></td>
</tr>
<tr>
    <td align="center" style="width:100%"><uc1:ProductsGridControl ID="ProductsGrid" runat="server" /></td>
</tr>
</table>
</asp:Content>

