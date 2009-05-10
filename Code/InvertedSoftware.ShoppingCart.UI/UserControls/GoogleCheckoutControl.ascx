<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GoogleCheckoutControl.ascx.cs" Inherits="UserControls_GoogleCheckoutControl" %>

<asp:Label ID="MessageLabel" runat="server"></asp:Label><br />
<asp:ImageButton ID="GoogleImageButton" 
    AlternateText="Fast checkout through Google" Height="46" 
    Width="180" runat="server" onclick="GoogleImageButton_Click" />