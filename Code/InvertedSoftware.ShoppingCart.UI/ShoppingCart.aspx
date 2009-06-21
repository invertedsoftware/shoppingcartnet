<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register src="UserControls/GoogleCheckoutControl.ascx" tagname="GoogleCheckoutControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td align="center">
    <table cellpadding="2" cellspacing="3" border="0" width="0%">
    <tr>
        <td><asp:Literal ID="MessageLiteral" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td align="center">
            <asp:Repeater ID="CartRepeater" runat="server" 
                onitemcommand="CartRepeater_ItemCommand">
                <HeaderTemplate>
                    <table cellpadding="2" cellspacing="3" border="0">
                    <tr>
                        <td>Remove</td>
                        <td>Product</td>
                        <td>Catalog No.</td>
                        <td>Quantity</td>
                        <td>Price</td>
                        <td>Subtotal</td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                   <tr>
                        <td><asp:Button ID="RemoveButton" runat="server" Text="Remove" /></td>
                        <td><%# Eval("ProductName") %>
                        <%# GetProductOptions(Container.ItemIndex) %></td>
                        <td><%# Eval("CatalogNumber")%></td>
                        <td><asp:TextBox ID='QuantityTextBox' Text='<%# Eval("Quantity") %>' Columns="3" runat="server"></asp:TextBox></td>
                        <td><%# Eval("PricePerUnit", "{0:c}")%></td>
                        <td><%# Eval("Subtotal", "{0:c}")%></td>
                    </tr>
                    <tr>
                        <td colspan="6" align="left"><%# GetCustomFields(Container.ItemIndex) %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="5" align="right">SubTotal</td>
                        <td><%= this.Cart.Subtotal.ToString("c")%></td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </td>
    </tr>
    <tr>
        <td>
        <table cellpadding="2" cellspacing="3" width="100%" border="0">
        <tr>
            <td><asp:Button ID="UpdateButton" runat="server" Text="Update Quantity" 
                    onclick="UpdateButton_Click" /></td>
            <td><asp:Button ID="ContinueButton" runat="server" Text="Continue Shopping" 
                    onclick="ContinueButton_Click" /></td>
            <td><asp:Button ID="CheckoutButton" runat="server" Text="Checkout" 
                    onclick="CheckoutButton_Click" />
            </td>
        </tr>
       </table>
       <br />
       <uc1:GoogleCheckoutControl ID="GoogleCheckoutControl1" runat="server" /><br /><br />
       <table cellpadding="2" cellspacing="3" border="0" class="gridview">
       <tr>
        <td colspan="3"><b>More:</b></td>
       </tr>
       <tr>
        <td align="left" colspan="2">Saving your cart will enable you to continue your purchase at a later date from the current computer or if you log into your account, from any computer.</td>
        <td><asp:Button ID="SaveButton" ValidationGroup="Save" runat="server" Text="Save My Cart" 
                onclick="SaveButton_Click" /></td>
       </tr>
       <tr>
        <td align="left">Email your cart to yourself or friends. Please separate Multiple Recipients using ,</td>
        <td><asp:TextBox ID="EmailTextBox" MaxLength="200" ValidationGroup="Email" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                ID="EmailRequiredFieldValidator" ValidationGroup="Email" ControlToValidate="EmailTextBox" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
        <td>
            <asp:Button ID="EmailButton" runat="server" ValidationGroup="Email" Text="Email My Cart" 
                onclick="EmailButton_Click" /></td>
       </tr>
       </table>
            <br />
       </td>
    </tr>
    </table>
    </td>
</tr>
</table>
</asp:Content>

