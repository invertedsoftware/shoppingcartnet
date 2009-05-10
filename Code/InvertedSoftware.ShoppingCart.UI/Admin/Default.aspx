<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

    <h2>Admin Area</h2>

    <br /><br />
    <asp:LoginView id="SuperAdminLinksLoginView" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="SuperAdmin">
                <ContentTemplate>
                    <a class="gridview" href="AddAdmin.aspx">Add Admin</a>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
<br />
    <asp:GridView ID="Menu1" runat="server" AutoGenerateColumns="false"
        CssClass="gridview" AlternatingRowStyle-CssClass="even">
        <Columns>
            <asp:TemplateField HeaderText="Table Name" SortExpression="TableName">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("ListActionPath") %>'><%#Eval("DisplayName") %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>


