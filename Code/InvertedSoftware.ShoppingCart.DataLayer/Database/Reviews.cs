using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Reviews
    {
        public int ProductReviewCount { get; set; }

        #region Select
        public static bool IsCustomerAllowedToReview(int customerID, int productID)
        {
            bool isCustomerAllowedToReview = false;
            try
            {
                SqlParameter[] paramArray = new SqlParameter[] {
                    new SqlParameter("@CustomerID", SqlDbType.Int) { Value = customerID },
                    new SqlParameter("@ProductID", SqlDbType.Int) { Value = productID } 
                };

                isCustomerAllowedToReview = Convert.ToBoolean(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "IsCustomerAllowedToReview", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error Deciding if customer is allowed to review a product", e);
            }
            return isCustomerAllowedToReview;
        }

        public int GetProductReviewsCount(int productID)
        {
            return ProductReviewCount;
        }

        public List<ProductReview> GetProductReviews(int productID, int startRowIndex, int maximumRows)
        {
            List<ProductReview> productReviews = new List<ProductReview>();
            int pageIndex = Convert.ToInt32(startRowIndex / maximumRows);

            SqlParameter[] paramArray = new SqlParameter[] { 
                new SqlParameter("@ProductID", SqlDbType.Int) { Value = productID },
                new SqlParameter("@PageIndex", SqlDbType.Int) { Value = pageIndex },
                new SqlParameter("@PageSize", SqlDbType.Int) { Value = maximumRows },
                new SqlParameter("@TotalRecords", SqlDbType.Int){ Direction = ParameterDirection.ReturnValue}
            };

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {
                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "GetProductReviews", paramArray);
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<ProductReview>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        ProductReview productReview;
                        while (rdr.Read())
                        {
                            productReview = new ProductReview();
                            ObjectHelper.LoadAs<ProductReview>(rdr, productReview, props, columnList);
                            productReviews.Add(productReview);
                        }
                        //Get the ratings
                        if (rdr.NextResult())
                            LoadReviewRatings(rdr, productReviews);
                    }
                    ProductReviewCount = Convert.ToInt32(paramArray[paramArray.Length - 1].Value);
                    cmd.Parameters.Clear();
                }
                catch (Exception e)
                {
                    throw new Exception("Error getting Product Reviews", e);
                }
            }

            return productReviews;
        }

        private void LoadReviewRatings(SqlDataReader rdr, List<ProductReview> productReviews)
        {
            int productReviewID = 0;

            while (rdr.Read())
            {
                productReviewID = rdr.GetInt32(0);
                var productReview = productReviews.Where(r => r.ProductReviewID == productReviewID).FirstOrDefault();
                if (productReview != null)
                    productReview.Ratings.Add(new KeyValuePair<string, int>(rdr.GetString(1), rdr.GetInt32(2)));
            }
        }
        #endregion

        #region Insert
        public static int AddProductReview(int productID, int customerID, string reviewText)
        {
            int productReviewID = 0;
            try
            {
                SqlParameter[] paramArray = new SqlParameter[] {
                    new SqlParameter("@ProductID", SqlDbType.Int) { Value = productID },
                    new SqlParameter("@CustomerID", SqlDbType.Int) { Value = customerID },
                    new SqlParameter("@ReviewText", SqlDbType.VarChar, 500) { Value = reviewText }
                };

                productReviewID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddProductReview", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error adding product review", e);
            }
            return productReviewID;
        }

        public static int AddProductReviewCaregoryProductReview(int productReviewCategoryID, int productReviewID, int rating)
        {
            int ProductReviewCaregoryProductReviewID = 0;
            try
            {
                SqlParameter[] paramArray = new SqlParameter[] {
                    new SqlParameter("@ProductReviewCategoryID", SqlDbType.Int) { Value = productReviewCategoryID },
                    new SqlParameter("@ProductReviewID", SqlDbType.Int) { Value = productReviewID },
                    new SqlParameter("@Rating", SqlDbType.Int) { Value = rating }
                };

                ProductReviewCaregoryProductReviewID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddProductReviewCaregoryProductReview", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error adding product rating", e);
            }
            return ProductReviewCaregoryProductReviewID;
        }
        #endregion
    }
}
