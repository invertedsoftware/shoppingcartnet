<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductBreadcrumbControl.ascx.cs" Inherits="UserControls_ProductBreadcrumbControl" %>
<%@ Import Namespace="InvertedSoftware.ShoppingCart.DataLayer.DataObjects" %>
<%@ OutputCache Duration="10" VaryByParam="ProductID" %>
<asp:Repeater ID="BreadcrumbRepeater" runat="server">
<HeaderTemplate>
<br /><b>Browse for more products in the same category as this item:</b>
</HeaderTemplate>
<ItemTemplate><br />
<asp:Repeater ID="PathRepeater" DataSource='<%# GetParentCategories(Convert.ToInt32(Container.DataItem)) %>' runat="server">
<ItemTemplate>
<a href='Category.aspx?Category=<%# HttpUtility.UrlEncode(Eval("CategoryName").ToString()) %>&CategoryID=<%# Eval("CategoryID") %>'><%# Eval("CategoryName") %></a> > 
</ItemTemplate>
</asp:Repeater>
</ItemTemplate>
<FooterTemplate>
</FooterTemplate>
</asp:Repeater>
