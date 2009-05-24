<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewState="false" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="UserControls/FeaturedProductsControl.ascx" tagname="FeaturedProductsControl" tagprefix="uc1" %>

<%@ Register src="UserControls/TagsControl.ascx" tagname="TagsControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td style="width:100%"></td>
    <td>
        <uc1:FeaturedProductsControl ID="FeaturedProductsControl1" runat="server" />
        </td>
<tr>
    <td style="width:100%"></td>
    <td>
        <uc2:TagsControl ID="TagsControl1" runat="server" />
    </td>
</tr>
</tr>
</table>
</asp:Content>

