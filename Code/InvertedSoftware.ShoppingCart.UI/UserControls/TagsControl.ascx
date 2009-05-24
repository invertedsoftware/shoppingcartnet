<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagsControl.ascx.cs" Inherits="UserControls_TagsControl" %>
<%@ OutputCache Duration="30" VaryByParam="none" %>
<asp:Repeater ID="TagsRepeater" runat="server" 
    DataSourceID="TagsObjectDataSource" onprerender="TagsRepeater_PreRender">
    <HeaderTemplate>
         <table cellpadding="2" cellspacing="3" border="0" width="200px" class="gridview">
        <tr>
            <td align="center">Tags</td>
        </tr>
        <tr>
            <td>
    </HeaderTemplate>
    <ItemTemplate>
    <a href="Search.aspx?Tag=<%# HttpUtility.UrlEncode(Convert.ToString(Container.DataItem)) %>"><%# Container.DataItem %></a>
    </ItemTemplate>
    <FooterTemplate>
    </td>
        </tr>
     </table>
    </FooterTemplate>
</asp:Repeater>
<asp:ObjectDataSource ID="TagsObjectDataSource" runat="server" 
    SelectMethod="GetTags" 
    TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Categories">
</asp:ObjectDataSource>

