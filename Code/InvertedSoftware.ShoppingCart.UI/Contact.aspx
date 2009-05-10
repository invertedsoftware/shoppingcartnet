<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
   Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
   
   function BeginRequestHandler(sender, args)
   {
        var postbackElem = args.get_postBackElement();
        postbackElem.disabled = true;
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td colspan="3" align="center">
        <asp:Label ID="MessageLabel" runat="server"></asp:Label></td>
</tr>
<tr>
    <td colspan="3" align="center">
        <asp:ValidationSummary ID="MainValidationSummary" runat="server" />
    </td>
</tr>
<tr>
    <td align="right">Name</td>
    <td>
        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="NameRequiredFieldValidator" 
                    ControlToValidate="NameTextBox" runat="server" 
                    ErrorMessage="Name is Required" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Email</td>
    <td>
        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" 
                    ControlToValidate="EmailTextBox" runat="server" 
                    ErrorMessage="Email is Required" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" 
                    runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" 
                    ErrorMessage="Email not Valid" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    SetFocusOnError="True">*</asp:RegularExpressionValidator></td>
</tr>
<tr>
    <td align="right">Phone Number</td>
    <td>
        <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">Subject</td>
    <td>
        <asp:DropDownList ID="SubjectDropDownList" runat="server">
            <asp:ListItem Text="Other" Value="Other" Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td><asp:RequiredFieldValidator ID="SubjectRequiredFieldValidator" 
                    ControlToValidate="SubjectDropDownList" runat="server" 
                    ErrorMessage="Subject is Required" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
</tr>
<tr>
    <td align="right">Order Number</td>
    <td>
        <asp:TextBox ID="OrderNumberTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td align="right">Comments</td>
    <td>
        <asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" Rows="10" runat="server"></asp:TextBox></td>
    <td></td>
</tr>

<tr>
    <td align="right">Where did you hear about us?</td>
    <td>
        <asp:TextBox ID="AboutTextBox" runat="server"></asp:TextBox></td>
    <td></td>
</tr>
<tr>
    <td colspan="3" align="center">
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" 
            onclick="SubmitButton_Click" /></td>
</tr>
</table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

