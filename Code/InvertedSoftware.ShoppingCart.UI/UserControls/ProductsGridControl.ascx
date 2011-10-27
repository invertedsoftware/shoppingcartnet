<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductsGridControl.ascx.cs" Inherits="UserControls_ProductsGridControl" %>
<script src="JS/NumericPaging.js" type="text/javascript"></script>
<table cellpadding="2" cellspacing="3" border="0" width="60%">
<tr>
    <td>Total of: <%= TotalRecords%> Products</td>
</tr>
<tr>
    <td><asp:Repeater ID="ProductsRepeater" runat="server" 
            onitemcommand="ProductsRepeater_ItemCommand" 
            onitemdatabound="ProductsRepeater_ItemDataBound">
    <HeaderTemplate>
        <table cellpadding="2" cellspacing="3" border="0" width="60%" class="gridview">
        <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td>
        <asp:HiddenField ID='ProductIDHiddenField' Value='<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>' runat='server' />
        <asp:HiddenField ID='ProductLinkHiddenField' Value='<%# Eval("ProductLink") %>' runat='server' />
        <table cellpadding="2" cellspacing="3" border="0" bgcolor="aqua" width="100%">
        <tr>
            <td><a href='Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>'><img src='ProductImages/<%# Eval("Thumbnail") %>' alt='<%# Eval("ProductName") %>' border="0" width="75" height="75" /></a></td>
            <td><asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2"><%# Eval("Description")%> <a href='Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>'>More...</a></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="AddButton" runat="server" Text="Add to Cart" CommandName="AddToCart" /></td>
        </tr>
        </table>
        </td>
    </ItemTemplate>
    <SeparatorTemplate></tr><tr></SeparatorTemplate>
    <FooterTemplate>
        </tr>
        </table>
    </FooterTemplate>
</asp:Repeater></td>
</tr>
<tr>
    <td align="center"><div id="PagerDiv"></div></td>
</tr>
</table>