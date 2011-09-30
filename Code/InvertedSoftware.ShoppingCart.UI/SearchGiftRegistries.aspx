<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchGiftRegistries.aspx.cs" Inherits="SearchGiftRegistries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td><b>Search for a Gift Registry</b><br />
    Please enter email: 
        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="EmailTextBoxRequiredFieldValidator" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator" 
            runat="server" ErrorMessage="Invalid Email" ControlToValidate="EmailTextBox" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:Button ID="SearchButton" runat="server" Text="Seach" 
            onclick="SearchButton_Click" /></td>
</tr>
<tr>
    <td>
        <asp:ListView ID="GiftRegistryListView" DataKeyNames="GiftRegistryProductID" runat="server">
            <EmptyDataTemplate>
                <table id="Table1" runat="server" style="">
                    <tr>
                        <td>Gift Registry Empty.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                    <a href='Product.aspx?Product=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&ProductID=<%# WebUtility.EncodeParamForQueryString(Eval("ProductID").ToString()) %>&GiftRegistryID=<%: WebUtility.EncodeParamForQueryString(GiftRegistry.GiftRegistryID.ToString())%>&GiftRegistryProductID=<%# WebUtility.EncodeParamForQueryString(Eval("GiftRegistryProductID").ToString()) %>'><%# Eval("ProductName") %></a>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="Tr2" runat="server" style="">
                                    <th id="Th1" runat="server">
                                        Item</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </td>
</tr>
</table>
</asp:Content>

