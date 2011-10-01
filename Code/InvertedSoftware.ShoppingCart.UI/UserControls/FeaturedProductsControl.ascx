<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeaturedProductsControl.ascx.cs" Inherits="UserControls_FeaturedProductsControl" %>
<asp:Repeater ID="ProductsSummaryRepeater" runat="server" 
    DataSourceID="ProductsSummaryObjectDataSource" 
    onprerender="ProductsSummaryRepeater_PreRender">
    <HeaderTemplate>
        <table cellpadding="2" cellspacing="3" border="0" class="gridview">
        <tr>
            <td align="center">Featured</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
        <td><a href="Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>"><%# Eval("ProductName")%></a></td>
    </tr>
    <tr>
        <td><a href="Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>"><img src='ProductImages/<%# Eval("Thumbnail") %>' alt='<%# Eval("ProductName") %>' style="border-style:none" width="75" height="75" /></a></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<asp:ObjectDataSource ID="ProductsSummaryObjectDataSource" runat="server" 
    SelectMethod="GetFeaturedProducts" 
    TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Products">
    <SelectParameters>
        <asp:QueryStringParameter Name="categoryID" ConvertEmptyStringToNull="true" QueryStringField="CategoryID" 
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
