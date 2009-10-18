<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

    <h2>Admin Area</h2>

    <br /><br />
    <asp:LoginView id="SuperAdminLinksLoginView" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="SuperAdmin">
                <ContentTemplate>
                    <a class="gridview" href="AddAdmin.aspx">Add Admin</a><br />
                    <a class="gridview" href="Settings.aspx">Settings</a>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
<br />
<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
    <td><asp:GridView ID="Menu1" runat="server" AutoGenerateColumns="false"
        CssClass="gridview" AlternatingRowStyle-CssClass="even">
        <Columns>
            <asp:TemplateField HeaderText="Table Name" SortExpression="TableName">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("ListActionPath") %>'><%#Eval("DisplayName") %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView></td>
    <td valign="top" align="center">
        Sales for <asp:DropDownList ID="YearsDropDownList" runat="server" AutoPostBack="True" 
            onselectedindexchanged="YearsDropDownList_SelectedIndexChanged">
        </asp:DropDownList><br />
    <asp:Chart ID="SalesChart" Width="400px" runat="server">
        <Legends>
            <asp:Legend Name="Default"></asp:Legend>
        </Legends>
        <series>
            <asp:Series Name="Series1" LegendText="Sales"></asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </chartareas>
    </asp:Chart>
       
    </td>
</tr>
</table>
    
    
</asp:Content>


