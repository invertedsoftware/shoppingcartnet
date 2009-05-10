<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewState="false" CodeFile="Receipt.aspx.cs" Inherits="Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellpadding="2" cellspacing="3" border="0" class="gridview">
<tr>
    <td><h1>Please print this page for your records</h1></td>
</tr>
<tr>
    <td><b>Order Number:</b> <%= Order.OrderNumber%></td>
</tr>
<tr>
    <td><b>Customer:</b> <%= Customer.FirstName %> <%= Customer.LastName %></td>
</tr>
<tr>
    <td><b>Ship to (if applicable):</b> <%= Order.Address %>, <%= Order.City %>, <%= State %><%= Province %>, <%= Country %>, <%= Order.Zipcode %></td>
</tr>
<tr>
    <td><b>Details</b></td>
</tr>
<tr>
    <td>
        <table cellpadding="2" cellspacing="3" border="0" width="100%">
        <tr>
            <td><b>Product</b></td>
            <td><b>Catalog No.</b></td>
            <td><b>Quantity</b></td>
            <td><b>Price</b></td>
        </tr>
        <% foreach (InvertedSoftware.ShoppingCart.DataLayer.DataObjects.OrderItem item in Order.OrderItems)
           {%>
           <tr>
            <td>
            <%= item.ProductName%>
            <% foreach (InvertedSoftware.ShoppingCart.DataLayer.DataObjects.OrderProductOption option in item.OptionList)
               {%>
               <br />
               <%= option.ProductOptionName%>
            <%} %>
            </td>
            <td><%= item.CatalogNumber%></td>
            <td><%= item.Quantity%></td>
            <td><%= item.TotalPrice.ToString("c")%></td>
           </tr>
           <tr>
            <td colspan="4" align="left">
           <% foreach (InvertedSoftware.ShoppingCart.DataLayer.DataObjects.OrderProductCustomField field in item.OrderProductCustomFieldList)
                    {%>
               <br />
               <%= field.CustomFieldName %>: <%=field.OrderProductCustomFieldValue %>
            <%} %>
            </td>
           </tr>
           
        <%} %>
        </table>
    </td>
</tr>
<tr>
    <td><b>Shipping:</b> <%= Order.Shipping.ToString("c") %></td>
</tr>
<tr>
    <td><b>Tax:</b> <%= Order.Tax.ToString("c") %></td>
</tr>
<tr>
    <td><b>Total:</b> <%= Order.Total.ToString("c") %></td>
</tr>
</table>

</asp:Content>

