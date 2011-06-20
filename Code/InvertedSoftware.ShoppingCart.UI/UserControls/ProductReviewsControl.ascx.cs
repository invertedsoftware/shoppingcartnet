using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class UserControls_ProductReviewsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindReviews();
            Repeater ReviewCategoriesRepeater = ReviewLoginView.FindControl("ReviewCategoriesRepeater") as Repeater;
            if (ReviewCategoriesRepeater != null)
                ReviewCategoriesRepeater.DataBind();
            Panel AddReviewPanel = ReviewLoginView.FindControl("AddReviewPanel") as Panel;
            if (AddReviewPanel != null)
                AddReviewPanel.Visible = Reviews.IsCustomerAllowedToReview(((BasePage)Page).GetLoggedCustomerID(), ProductID);
           
        }
    }

    public int ProductID { get; set; }
   

    private void BindReviews()
    {
        ProductReviewsObjectDataSource.SelectParameters[0].DefaultValue = ProductID.ToString();
        //ProductReviewsObjectDataSource.Select();
        //ProductReviewsListView.DataBind();
    }

    protected void ReviewButton_Click(object sender, EventArgs e)
    {
        try
        {
            int customerID = ((BasePage)Page).GetLoggedCustomerID();
            string reviewText = ((TextBox)ReviewLoginView.FindControl("ReviewTextBox")).Text;
            if (string.IsNullOrWhiteSpace(reviewText))
                return;
            int reviewID = Reviews.AddProductReview(ProductID, customerID, reviewText);
            AddRatings(reviewID);
            ((TextBox)ReviewLoginView.FindControl("ReviewTextBox")).Text = string.Empty;
            ((Literal)ReviewLoginView.FindControl("MessageLiteral")).Text = "Thank you. Your review ill be available Shortly.";
        }
        catch (Exception ex)
        {
            ((Literal)ReviewLoginView.FindControl("MessageLiteral")).Text = ex.Message;
        }
    }

    private void AddRatings(int reviewID)
    {
        Repeater ratingsRepeater = ReviewLoginView.FindControl("ReviewCategoriesRepeater") as Repeater;
        if (ratingsRepeater == null)
            return;
        int productReviewCategoryID = 0;
        int ratingNumber = 0;
        foreach (RepeaterItem item in ratingsRepeater.Items)
        {
            productReviewCategoryID = Convert.ToInt32(((HiddenField)item.FindControl("ProductReviewCategoryIDHiddenField")).Value);
            if (int.TryParse(((HiddenField)item.FindControl("SelectedRatingHiddenField")).Value, out ratingNumber) && ratingNumber > 0)
                Reviews.AddProductReviewCaregoryProductReview(productReviewCategoryID, reviewID, ratingNumber);
        }
    }
}