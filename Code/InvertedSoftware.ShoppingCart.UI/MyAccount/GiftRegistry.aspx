<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GiftRegistry.aspx.cs" Inherits="MyAccount_GiftRegistry" %>

<%@ Import Namespace="InvertedSoftware.ShoppingCart.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td><b>My Gift Registry</b><br />
    To add items Please go to product page and click the "Add to my Gift Registry" button.</td>
</tr>
<tr>
    <td>
        <asp:ListView ID="GiftRegistryListView" DataKeyNames="GiftRegistryProductID" runat="server"  
            onitemcommand="GiftRegistryListView_ItemCommand">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            Gift Registry Empty.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td id="ButtonsColumn" runat="server"><asp:Button ID="DeleteButton" runat="server" CommandName="Remove" CommandArgument='<%# Eval("GiftRegistryProductID") %>' Text="Remove" OnClientClick="return confirm('Are you sure you want to remove this item?');" /></td>
                    <td>
                    <a href='../Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>'><%# Eval("ProductName") %></a>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th id="Th1" runat="server"></th>
                                    <th runat="server">
                                        Item</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </td>
</tr>
<tr>
    <td><b>Gift Registry Public Link: <a href='<%= StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL) %>/SearchGiftRegistries.aspx?Registry=<%: GetLoggedCustomer().Email %>'><%= ConfigurationManager.AppSettings["StoreURL"]%>/SearchGiftRegistries.aspx?Registry=<%: GetLoggedCustomer().Email %></a></b><br />
    Gift Registry visibility: <asp:RadioButtonList ID="VisibilityRadioButtonList" runat="server" 
            AutoPostBack="True" RepeatDirection="Horizontal" 
            onselectedindexchanged="VisibilityRadioButtonList_SelectedIndexChanged">
            <asp:ListItem Value="true">Public</asp:ListItem>
            <asp:ListItem Value="false">Logged In Users</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
</table>
</asp:Content>

