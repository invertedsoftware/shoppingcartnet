<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RelatedProductsControl.ascx.cs" Inherits="UserControls_RelatedProductsControl" %>
<asp:Repeater ID="ProductsSummaryRepeater" runat="server" 
    DataSourceID="ProductsSummaryObjectDataSource" 
    onprerender="ProductsSummaryRepeater_PreRender">
    <HeaderTemplate>
        <table cellpadding="2" cellspacing="3" border="0" class="gridview">
        <tr>
            <td align="center">Related Products</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
        <td><a href="Product.aspx?Product=<%# Eval("ProductName")%>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>"><%# Eval("ProductName")%></a></td>
    </tr>
    <tr>
        <td><a href="Product.aspx?Product=<%# Eval("ProductName")%>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>"><img src='ProductImages/<%# Eval("Thumbnail") %>' alt='<%# Eval("ProductName") %>' style="border-style:none" width="75" height="75" /></a></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<asp:ObjectDataSource ID="ProductsSummaryObjectDataSource" runat="server" 
    SelectMethod="GetRelatedProducts" 
    TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Products">
    <SelectParameters>
        <asp:Parameter Name="productID" ConvertEmptyStringToNull="false" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>