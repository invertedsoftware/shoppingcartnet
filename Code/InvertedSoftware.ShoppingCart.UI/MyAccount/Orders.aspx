<%@ Page Title="My Orders" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="MyAccount_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
 <ContentTemplate>
    <table cellpadding="2" cellspacing="3" border="0" width="70%">
<tr>
    <td align="center"><b>My Orders</b></td>
</tr>
<tr>
    <td align="center"> <asp:GridView ID="OrdersGridView" CellPadding="2" DataKeyNames="OrderID" runat="server" AllowPaging="True" PageSize="5"
        AutoGenerateColumns="False" DataSourceID="OrdersObjectDataSource" SelectedRowStyle-BackColor="Aqua" CssClass="gridview">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderStatusName" HeaderText="Status" 
                SortExpression="OrderStatusName" />
            <asp:BoundField DataField="ShippingProviderName" HeaderText="Ship Via" 
                SortExpression="ShippingProviderName" />
            <asp:BoundField DataField="OrderNumber" HeaderText="OrderNumber" 
                SortExpression="OrderNumber" />
            <asp:BoundField DataField="ShippingNumber" HeaderText="Routing No." 
                SortExpression="ShippingNumber" />
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <%# Eval("Address") %>,<%# Eval("City") %>, <%# Eval("StateName") %><%# Eval("ProvinceName")%>,<br />
                    <%# Eval("CountryName") %>, <%# Eval("Zipcode") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DatePlaced" HeaderText="Placed" 
                SortExpression="DatePlaced" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="DateShipped" HeaderText="Shipped" 
                SortExpression="DateShipped" DataFormatString="MM/dd/yyyy" />
            <asp:BoundField DataField="Total" DataFormatString="{0:C}" 
                HeaderText="Total" SortExpression="Total" />
            <asp:BoundField DataField="Shipping" DataFormatString="{0:C}" 
                HeaderText="Shipping" SortExpression="Shipping" />
            <asp:BoundField DataField="Tax" DataFormatString="{0:C}" HeaderText="Tax" SortExpression="Tax" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="OrdersObjectDataSource" runat="server" 
        SelectMethod="GetOrders" StartRowIndexParameterName="startRowIndex" MaximumRowsParameterName="maximumRows"
         SelectCountMethod="GetOrderCount" EnablePaging="true"
        TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Orders">
        <SelectParameters>
            <asp:Parameter Name="customerID" Type="Int32" />
            <asp:Parameter DefaultValue="1/1/2000" Name="startDate" Type="DateTime" />
            <asp:Parameter DefaultValue="1/1/3000" Name="endDate" Type="DateTime" />
            <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource></td>
</tr>
<tr>
    <td align="center">
        <asp:GridView ID="OrderProductsGridView" CellPadding="2" CssClass="gridview" runat="server" 
            AutoGenerateColumns="False" DataSourceID="OrderProductsObjectDataSource">
            <Columns>
                <asp:TemplateField HeaderText="Product" SortExpression="ProductName">
                    <ItemTemplate>
                        <%# Eval("ProductName") %>
                        <%# GetDownloadText(Eval("DownloadURL"), Eval("DownloadKey"))%>
                        <asp:Repeater ID="OptionsRepeater" DataSource='<%# Eval("OptionList")%>' runat="server">
                        <ItemTemplate><br /><%# Eval("ProductOptionName")%></ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CatalogNumber" HeaderText="Catalog No." 
                    SortExpression="CatalogNumber" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="PricePerUnit" DataFormatString="{0:C}" 
                    HeaderText="Price Per Unit" SortExpression="PricePerUnit" />
                <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}"
                    HeaderText="Price" SortExpression="TotalPrice" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="OrderProductsObjectDataSource" runat="server" 
            SelectMethod="GetOrderItems" 
            TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Orders">
            <SelectParameters>
                <asp:ControlParameter ControlID="OrdersGridView" Name="orderID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </td>
</tr>
</table>
   </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

