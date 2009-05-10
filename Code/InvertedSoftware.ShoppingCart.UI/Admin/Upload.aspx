<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Admin_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="2" cellspacing="3" border="0">
<tr>
    <td align="center" colspan="2">
        <asp:Label ID="MessageLabel" runat="server" Text="Please select image to upload"></asp:Label>
        </td>
</tr>
<tr>
    <td align="right">Upload image</td>
    <td>
        <asp:FileUpload ID="ProductFileUpload" runat="server" /></td>
</tr>
<tr>
    <td align="center" colspan="2">
        <asp:Button ID="UploadButton" runat="server" Text="Upload" 
            onclick="UploadButton_Click" /></td>
</tr>
</table>
 </asp:Content>

