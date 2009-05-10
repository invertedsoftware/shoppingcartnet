<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartSummaryControl.ascx.cs" Inherits="UserControls_CartSummaryControl" %>
<asp:Repeater ID="CartSummaryRepeater" runat="server">
<HeaderTemplate>
    <table cellpadding="2" cellspacing="3" border="0" style="font-size:small">
    <tr>
        <td colspan="2" align="center">Your Cart</td>
    </tr>
</HeaderTemplate>
<ItemTemplate>
<tr>
    <td><a href='Product.aspx?Product=<%# Eval("ProductName") %>' target="_blank"><%# Eval("ProductName")%></a></td>
    <td><%# Eval("Quantity")%></td>
</tr>
</ItemTemplate>
<FooterTemplate>
    </table>
</FooterTemplate>
</asp:Repeater>
