<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductOptionsControl.ascx.cs" Inherits="UserControls_ProductOptionsControl" %>
<asp:Repeater ID="GroupsRepeater" runat="server"  
    onitemdatabound="GroupsRepeater_ItemDataBound">
<HeaderTemplate>
    <table cellpadding="2" cellspacing="3" border="0">
</HeaderTemplate>
<ItemTemplate>
<tr>
    <td><asp:Label ID="GroupLabel" Text='<%# Eval("Key") %>' runat=server></asp:Label></td>
    <td><asp:DropDownList ID="OptionDropDownList" runat="server"></asp:DropDownList>
    </td>
</tr>
</ItemTemplate>
<FooterTemplate>
    </table>
</FooterTemplate>
</asp:Repeater>
