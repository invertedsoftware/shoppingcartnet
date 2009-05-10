<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomFieldsControl.ascx.cs" Inherits="UserControls_CustomFieldsControl" %>
<asp:Repeater ID="CustomFieldsRepeater" runat="server" 
    onitemdatabound="CustomFieldsRepeater_ItemDataBound">
<HeaderTemplate>
    <table cellspacing="2" cellpadding="3" border="0">
</HeaderTemplate>
<ItemTemplate>
    <tr>
        <td><asp:Label ID="FieldNameLabel" runat="server" Text='<%# Eval("CustomFieldName") %>'></asp:Label></td>
        <td id="CustomField" runat="server"></td>
    </tr>
</ItemTemplate>
<FooterTemplate>
    </table>
</FooterTemplate>
</asp:Repeater>
