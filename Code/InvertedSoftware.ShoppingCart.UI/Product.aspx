<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<%@ Register src="UserControls/RelatedProductsControl.ascx" tagname="RelatedProductsControl" tagprefix="uc1" %>

<%@ Register src="UserControls/ProductOptionsControl.ascx" tagname="ProductOptionsControl" tagprefix="uc2" %>

<%@ Register src="UserControls/CustomFieldsControl.ascx" tagname="CustomFieldsControl" tagprefix="uc3" %>

<%@ Register src="UserControls/TagsControl.ascx" tagname="TagsControl" tagprefix="uc4" %>

<%@ Register src="UserControls/ProductBreadcrumbControl.ascx" tagname="ProductBreadcrumbControl" tagprefix="uc5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/carousel/assets/skins/sam/carousel.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/carousel/carousel-min.js"></script>
<script src="JS/InventoryService.js" type="text/javascript"></script>
<script type="text/javascript">
	function checkInventory() {
		if(inventoryChecked)
			return inventoryChecked;
		var qty = document.getElementById("<%= QtyTextBox.ClientID %>").value;
		var objRegExp  = /(^-?\d\d*$)/;
		if(objRegExp.test(qty))
			GetProductStockStatus(<%= CartProduct.ProductID %>, parseInt(qty));
		return inventoryChecked;
	}

	function resetInventoryChecked(){
		inventoryChecked = false;
	}
</script>

<table cellpadding="2" cellspacing="3" border="0" width="100%">
<tr>
	<td style="width:100%"><table cellpadding="2" cellspacing="3" border="0">
	 <% if (CartProduct.SalePrice > 0)
	   {  %>
	   <tr>
		<td><b>On Sale!!</b></td>
	   </tr>
	<%} %>
<tr>
	<td><%= CartProduct.ProductName%> (<%= CartProduct.CatalogNumber%>)</td>
</tr>
<% if(this.ProductImages.Count > 0){ %>
<tr>
	<td>
<div class="yui-skin-sam" id="container">
	<ol id="carousel">
	<% foreach (string image in this.ProductImages)
	   {%>
	   <li>
			<img src="ProductImages/<%= image%>" alt="<%= CartProduct.ProductName %>"  width="75" height="75"/>
		</li>
	<%} %>
		
	</ol>
</div>

<!-- The spotlight container -->
<div id="spotlight"></div>

<style type="text/css">
/* Style the spotlight container */
#spotlight {
	border: 1px solid #ccc;
	margin: 10px auto;
	padding: 1px;
}

.yui-carousel-element li {
	opacity: 0.6;
}

.yui-carousel-element .yui-carousel-item-selected {
	opacity: 1;
}
</style>
<script>
	(function() {
		// Get the image link from within its (parent) container.
		function getImage(parent) {
			var el = parent.firstChild;

			while (el) { // walk through till as long as there's an element
				if (el.nodeName.toUpperCase() == "IMG") { // found an image
					// flickr uses "_s" suffix for small, and "_m" for big
					// images respectively
					return el.src.replace(/_t\.jpg$/, ".jpg").replace(/_t\.jpeg$/, ".jpeg").replace(/_t\.bmp$/, ".bmp").replace(/_t\.gif$/, ".gif");
				}
				el = el.nextSibling;
			}

			return "";
		}

		YAHOO.util.Event.onDOMReady(function(ev) {
			var spotlight = YAHOO.util.Dom.get("spotlight"),
				carousel = new YAHOO.widget.Carousel("container");

			carousel.on("itemSelected", function(index) {
				// item has the reference to the Carousel's item
				var item = carousel.getElementForItem(index);

				if (item) {
					spotlight.innerHTML = "<img src=\"" + getImage(item) + "\">";
				}
			});
			
			carousel.set("numVisible", 10);     
			carousel.render(); // get ready for rendering the widget
			carousel.show();   // display the widget
		   
		});
	})();
</script>
</td>
</tr>
<% }%>
<tr>
	<td><%= CartProduct.Description%></td>
</tr>
<%if (CartProduct.Height > 0 && CartProduct.Length > 0 && CartProduct.Width > 0)
  {%>
  <tr>
	<td>Dimentions: <%: CartProduct.Height %>"x<%: CartProduct.Length%>"x<%: CartProduct.Width%>"</td>
  </tr>
<%} %>
<%if (CartProduct.Weight > 0)
  {%>
  <tr>
	<td>Weight: <%: CartProduct.Weight%>LBS</td>
  </tr>
<%} %>
<tr>
	<td><uc2:ProductOptionsControl ID="ProductOptionsControl1" runat="server" /></td>
</tr>
<tr>
	<td>
		<uc3:CustomFieldsControl ID="CustomFieldsControl1" runat="server" />
	</td>
</tr>
<tr>
	<td>Price: <%= CartProduct.Price.ToString("c")%>
	<% if (CartProduct.SalePrice > 0)
	   {  %>
	   <b>Sale Price: <%= CartProduct.SalePrice.ToString("c")%></b>
	<%} %>
	<asp:Button ID="AddButton" ClientIDMode="Static" runat="server" Text="Add to Cart" onclick="AddButton_Click" OnClientClick="return checkInventory();" />
	<asp:TextBox ID="QtyTextBox" ClientIDMode="Static" Text="1" MaxLength="4" Columns="3" runat="server"></asp:TextBox>
	<asp:RequiredFieldValidator ControlToValidate="QtyTextBox" ID="QtyRequiredFieldValidator" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
	<asp:RangeValidator
		ID="QtyRangeValidator" ControlToValidate="QtyTextBox" runat="server" ErrorMessage="Please enter a number between 1 and 9999" MinimumValue="1" MaximumValue="9999" Type="Integer"></asp:RangeValidator></td>
 </tr>
 <%if (CartProduct.IsReviewEnabled)
 { %>
 <script language=javascript type="text/ecmascript">

	 function showReviewMethod() {
		 $("#messageDiv").html("In order to keep reviews real this store will only accept reviews from verified customers that have purchased this product. If you wish to review this product, please log in to your account and use the review form on this page.");
		 if ($("#facebox").data("overlay") != null) {
			 $("#facebox").data("overlay").load();
		 } else {
			 $("#facebox").overlay({
				 top: '20%',
				 mask: {
					 color: '#fff',
					 loadSpeed: 200,
					 opacity: 0.5
				 },
				 closeOnClick: false,
				 load: true
			 });
		 }
	 }
			</script>
 <tr>
	<td><iframe src="ProductReviews.aspx?ProductID=<%: WebUtility.EncodeParamForQueryString(CartProduct.ProductID.ToString()) %>" width="100%" height="300" scrolling="auto" frameborder="0"></iframe></td>
 </tr>
 <%} %>
 <tr>
	<td>
		<uc5:ProductBreadcrumbControl ID="ProductBreadcrumbControl1" runat="server" />
	 </td>
 </tr>
</table></td>
	<td>
		<uc1:RelatedProductsControl ID="RelatedProductsControl1" runat="server" /><br />
		<uc4:TagsControl ID="TagsControl1" runat="server" />
	</td>
</tr>
</table>




</asp:Content>

