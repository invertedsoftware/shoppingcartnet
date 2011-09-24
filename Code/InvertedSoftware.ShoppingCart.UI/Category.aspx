<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<%@ Register src="UserControls/ProductsGridControl.ascx" tagname="ProductsGridControl" tagprefix="uc1" %>

<%@ Register src="UserControls/FeaturedProductsControl.ascx" tagname="FeaturedProductsControl" tagprefix="uc2" %>

<%@ Register src="UserControls/TagsControl.ascx" tagname="TagsControl" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td align="center"><b><%: WebUtility.LoadStringFromQueryString("Category", 200, true) %></b></td>
    <td>Sort By <select name="sort" id="sort" onchange="javascript:location.href='Category.aspx?Category=<%: WebUtility.LoadStringFromQueryString("Category", 200, true) %>&CategoryID=<%: WebUtility.LoadInt32FromQueryString("CategoryID") %>&Sort='+ this.options[this.selectedIndex].value;">
                                    <option value="DontSort" <%if(Request.QueryString["Sort"] == "DontSort") Response.Write("selected"); %>>Don't Sort</option>
                                    <option value="LowtoHigh" <%if(Request.QueryString["Sort"] == "LowtoHigh") Response.Write("selected"); %>>Price: Low to High</option>
                                    <option value="HightoLow" <%if(Request.QueryString["Sort"] == "HightoLow") Response.Write("selected"); %>>Price: High to Low</option>
                                    <option value="Name" <%if(Request.QueryString["Sort"] == "Name") Response.Write("selected"); %>>Name</option>
                                  </select></td>
</tr>
<tr>
    <td colspan="2" align="center"><asp:Repeater ID="CategoryNavRepeater" runat="server" 
        DataSourceID="CategoryObjectDataSource">
        <HeaderTemplate>
            <table cellpadding="2" cellspacing="3" border="0">
            <tr>
        </HeaderTemplate>
        <ItemTemplate>
            <td><a href='Category.aspx?Category=<%# HttpUtility.UrlEncode(Eval("CategoryName").ToString()) %>&CategoryID=<%# Eval("CategoryID") %>'><%# Eval("CategoryName") %></a> </td>
        </ItemTemplate>
        <FooterTemplate>
            </tr>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="CategoryObjectDataSource" runat="server" 
        SelectMethod="GetCachedChildCategories" 
        TypeName="InvertedSoftware.ShoppingCart.DataLayer.Cache.CacheManager">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="CategoryID" Name="parentCategoryID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource></td>
</tr>
<tr>
    <td align="center" style="width:100%"><uc1:ProductsGridControl ID="ProductsGrid" runat="server" /></td>
    <td>
        <uc2:FeaturedProductsControl ID="FeaturedProductsControl1" runat="server" /><br />
        <uc3:TagsControl ID="TagsControl1" runat="server" />
    </td>
</tr>
<tr>
    <td colspan="2" align="right"><a href="Syndication/RSS.ashx?CategoryID=<%= Request.QueryString["CategoryID"]%>">RSS</a>  <a href="Syndication/Atom.ashx?CategoryID=<%= Request.QueryString["CategoryID"]%>">Atom</a></td>
</tr>
</table>
</asp:Content>

