<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductReviewsControl.ascx.cs" EnableViewState="true" Inherits="UserControls_ProductReviewsControl" %>
<%@ Import Namespace="InvertedSoftware.ShoppingCart.DataLayer.Database" %>
<%@ Import Namespace="InvertedSoftware.ShoppingCart.DataLayer.Cache" %>
<%@ Import Namespace="InvertedSoftware.ShoppingCart.BusinessLayer.Controls" %>
<script src="JS/jquery.ui.stars-3.0/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
<script src="JS/jquery.ui.stars-3.0/jquery.ui.stars.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="JS/jquery.ui.stars-3.0/jquery.ui.stars.css">

<table cellpadding="2" cellpadding="3" border="0">
<tr>
	<td>
		<asp:LoginView ID="ReviewLoginView" runat="server">
			<AnonymousTemplate><a href="#" onclick="javascript:showReviewMethod();">How can I review products?</a> 
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
			</AnonymousTemplate>
			<RoleGroups>
				<asp:RoleGroup Roles="Customer">
					<ContentTemplate>
						<asp:Panel ID="AddReviewPanel" runat="server">
						<table cellpadding="2" cellspacing="3" border="0">
						<tr>
							<td>Add Review<br />
							<asp:Literal ID="MessageLiteral" runat="server"></asp:Literal></td>
						</tr>
						<tr>
							<td>
							<asp:Repeater ID="ReviewCategoriesRepeater" DataSource="<%# CacheManager.GetCachedLookupTable(LookupDataEnum.GetProductReviewCategories, false) %>" runat="server">
							<HeaderTemplate>
								<table cellpadding="2" cellspacing="3" border="0">
							</HeaderTemplate>
							<ItemTemplate>
								<asp:HiddenField ID="ProductReviewCategoryIDHiddenField" Value='<%# Eval("Value") %>' runat="server" />
								<asp:HiddenField ID="SelectedRatingHiddenField" Value="" runat="server" />
							<tr>
							<td valign="bottom"><%# Eval("Text")%>:</td>
							<td>
							<span id="addStars-cap<%#(((RepeaterItem)Container).ItemIndex) %>"></span>
									<div id="addStars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>">
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="1" title="Very poor" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="2" title="Poor" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="3" title="Not that bad" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="4" title="Fair" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="5" title="Average" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="6" title="Almost good" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="7" title="Good" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="8" title="Very good" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="9" title="Excellent" />
										<input type="radio" name="addNewrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="10" title="Perfect" />
									</div>
							</td>
						</tr>
									<script language="javascript" type="text/javascript">
								  
											$("#addStars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>").stars({
												callback: function (ui, type, value) {
													$("#addStars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>").stars("select", value);
													$('#<%#(((RepeaterItem)Container).FindControl("SelectedRatingHiddenField").ClientID) %>').val(value);
												}
											});
									</script>
							</ItemTemplate>
							<FooterTemplate>
								</table>
							</FooterTemplate>
							</asp:Repeater></td>
						</tr>
						<tr>
							<td><asp:TextBox ID="ReviewTextBox" runat="server" TextMode="MultiLine" ValidationGroup="AddReview" Columns="50" Rows="6"></asp:TextBox>
							<asp:RegularExpressionValidator ID="ReviewTextBoxRegularExpressionValidator" ValidationGroup="AddReview" ControlToValidate="ReviewTextBox" Text="Please keep reviews under 500 characters" ValidationExpression="(\s|.){0,500}$" runat="server" /></td>
						</tr>
						<tr>
							<td><asp:Button ID="ReviewButton" runat="server" Text="Review" 
									onclick="ReviewButton_Click" ValidationGroup="AddReview" /></td>
						</tr>
						</table>
						
						</asp:Panel>
					</ContentTemplate>
				</asp:RoleGroup>
			</RoleGroups>
		</asp:LoginView>
	</td>
</tr>
<tr>
	<td>
		<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>--%>
		<asp:ListView ID="ProductReviewsListView" runat="server" DataKeyNames="ProductReviewID"
			DataSourceID="ProductReviewsObjectDataSource">
			<EmptyDataTemplate>
				<table runat="server" style="">
					<tr>
						<td>
							No reviews yet.</td>
					</tr>
				</table>
			</EmptyDataTemplate>
			<ItemTemplate>
				<tr style="">
					<td>
						Reviewd in <asp:Label ID="Label1" runat="server" 
							Text='<%# Eval("ReviewDate", "{0:MMMM d, yyyy}") %>' /> by a customer that have purchased this product on <asp:Label ID="ReviewDateLabel" runat="server" 
							Text='<%# Eval("ReviewDate", "{0:MMMM d, yyyy}") %>' /><br />

						<asp:Repeater ID="RatingsRepeater" DataSource='<%# Eval("Ratings") %>' runat="server">
						<HeaderTemplate>
							<table cellpadding="2" cellspacing="3" border="0">
						</HeaderTemplate>
						<ItemTemplate>
						<tr>
							<td valign=bottom><%# Eval("Key") %>: </td>
							<td>
							<span id="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-cap<%#(((RepeaterItem)Container).ItemIndex) %>"></span>
									<div id="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>">
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="1" title="Very poor" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="2" title="Poor" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="3" title="Not that bad" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="4" title="Fair" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="5" title="Average" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="6" title="Almost good" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="7" title="Good" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="8" title="Very good" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="9" title="Excellent" />
										<input type="radio" name="<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>newrate<%#(((RepeaterItem)Container).ItemIndex) %>" value="10" title="Perfect" />
									</div>
							</td>
						</tr>
									<script language="javascript" type="text/javascript">
									
										$("#<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>").stars({
											disabled: true,
											captionEl: $("#<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-cap<%#(((RepeaterItem)Container).ItemIndex) %>")
										});
										$("#<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>").stars("select", 99); // remove selection
										$("#<%# ((ListViewDataItem)(Container.NamingContainer.Parent)).DataItemIndex %>stars-wrapper<%#(((RepeaterItem)Container).ItemIndex) %>").stars("select", <%# Eval("Value") %>);
										
									</script>
						</ItemTemplate>
						<FooterTemplate>
							</table>
						</FooterTemplate>
						</asp:Repeater>
							<br />
						<asp:Label ID="ReviewTextLabel" runat="server" 
							Text='<%# Eval("ReviewText") %>' /><br /><br />
					</td>
				</tr>
			</ItemTemplate>
			<LayoutTemplate>
				<table runat="server">
					<tr runat="server">
						<td runat="server">
							<table ID="itemPlaceholderContainer" runat="server" border="0" style="">
								<tr runat="server" style="">
									<th runat="server">Reviews</th>
								</tr>
								<tr ID="itemPlaceholder" runat="server">
								</tr>
							</table>
						</td>
					</tr>
					<tr runat="server">
						<td runat="server" style="">
							<asp:DataPager ID="DataPager1" runat="server" PageSize="5">
								<Fields>
									<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
										ShowNextPageButton="False" ShowPreviousPageButton="False" />
									<asp:NumericPagerField />
									<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
										ShowNextPageButton="False" ShowPreviousPageButton="False" />
								</Fields>
							</asp:DataPager>
						</td>
					</tr>
				</table>
			</LayoutTemplate>
		</asp:ListView>
		<asp:ObjectDataSource ID="ProductReviewsObjectDataSource" runat="server" 
			SelectMethod="GetProductReviews" SelectCountMethod="GetProductReviewsCount"
			TypeName="InvertedSoftware.ShoppingCart.DataLayer.Database.Reviews"
			EnablePaging="True">
			<SelectParameters>
				<asp:Parameter Name="productID" Type="Int32"/>
			</SelectParameters>
		</asp:ObjectDataSource>
		<%--  </ContentTemplate>
		</asp:UpdatePanel>--%>
	</td>
</tr>
</table>