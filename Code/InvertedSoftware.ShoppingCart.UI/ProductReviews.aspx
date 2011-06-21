<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductReviews.aspx.cs" Inherits="ProductReviews" %>


<%@ Register src="UserControls/ProductReviewsControl.ascx" tagname="ProductReviewsControl" tagprefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" language="type="text/javascript"></script>
    <script src="http://cdn.jquerytools.org/1.2.2/jquery.tools.min.js"></script>
</head>
<body class="template">
    <form id="form1" runat="server">
    <div>
   
        <uc1:ProductReviewsControl ID="ProductReviewsControl1" runat="server" />
   
    </div>
    </form>
</body>
</html>
