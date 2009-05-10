using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Products
    {
        #region Select
        public Product GetProduct(int productID)
        {
            Product product = null;

            SqlParameter ProductIDSqlParameter = new SqlParameter("@productID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProduct", ProductIDSqlParameter))
                {
                    while (reader.Read())
                        product = (Product)ObjectHelper.GetAs(reader, typeof(Product));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Getting Product", e);
            }
            return product;
        }

        public Product GetProduct(string productName)
        {
            Product product = null;

            SqlParameter ProductNameSqlParameter = new SqlParameter("@ProductName", SqlDbType.VarChar, 50);
            ProductNameSqlParameter.Value = productName;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProduct", ProductNameSqlParameter))
                {
                    while (reader.Read())
                        product = (Product)ObjectHelper.GetAs(reader, typeof(Product));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Getting Product", e);
            }
            return product;
        }

        public List<string> GetProductImages(int productID, bool isThumnails)
        {
            List<string> productImages = new List<string>();
            SqlParameter[] paramArray = new SqlParameter[2];

            SqlParameter ProductIDSqlParameter = new SqlParameter("@productID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;
            paramArray[0] = ProductIDSqlParameter;

            SqlParameter ThumsSqlParameter = new SqlParameter("@Thums", SqlDbType.Bit);
            ThumsSqlParameter.Value = isThumnails;
            paramArray[1] = ThumsSqlParameter;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductImages", paramArray))
                {
                    while (reader.Read())
                        productImages.Add(Convert.ToString(reader["ImageURL"]));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting product images", e);
            }
            return productImages;
        }

        public int ProductCount { get; set; }

        public List<Product> GetProducts(int categoryID, int pageIndex, int maximumRows)
        {
            List<Product> productList = new List<Product>();

            SqlParameter[] paramArray = new SqlParameter[4];

            SqlParameter PageIndexSqlParameter = new SqlParameter("@PageIndex", SqlDbType.Int);
            PageIndexSqlParameter.Value = pageIndex;
            paramArray[0] = PageIndexSqlParameter;

            SqlParameter PageSizeSqlParameter = new SqlParameter("@PageSize", SqlDbType.Int);
            PageSizeSqlParameter.Value = maximumRows;
            paramArray[1] = PageSizeSqlParameter;

            SqlParameter CategoryIDSqlParameter = new SqlParameter("@CategoryID", SqlDbType.Int);
            CategoryIDSqlParameter.Value = categoryID;
            paramArray[2] = CategoryIDSqlParameter;

            SqlParameter TotalRecordsSqlParameter = new SqlParameter("@TotalRecords", SqlDbType.Int);
            TotalRecordsSqlParameter.Direction = ParameterDirection.ReturnValue;
            paramArray[3] = TotalRecordsSqlParameter;

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {

                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "GetProducts", paramArray);
                    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    while (rdr.Read())
                        productList.Add((Product)ObjectHelper.GetAs(rdr, typeof(Product)));
                    rdr.Close();
                    ProductCount = Convert.ToInt32(TotalRecordsSqlParameter.Value);
                    cmd.Parameters.Clear();
                }
                catch (Exception e)
                {
                    throw new Exception("Error getting Products", e);
                }
            }

            return productList;
        }

        public List<ProductOption> GetProductOptions(int productID)
        {
            List<ProductOption> productOptions = new List<ProductOption>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductOptions", ProductIDSqlParameter))
                {
                    while (reader.Read())
                        productOptions.Add((ProductOption)ObjectHelper.GetAs(reader, typeof(ProductOption)));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting product options", e);
            }
            return productOptions;
        }

        public List<CustomField> GetCustomFields(int productID)
        {
            List<CustomField> customFields = new List<CustomField>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomFields", ProductIDSqlParameter))
                {
                    while (reader.Read())
                        customFields.Add((CustomField)ObjectHelper.GetAs(reader, typeof(CustomField)));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting custom fields", e);
            }
            return customFields;
        }

        public bool IsProductOptionsExist(int productID)
        {
            bool optionsExist = false;
            try
            {
                SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
                ProductIDSqlParameter.Value = productID;
                optionsExist = Convert.ToBoolean(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "IsProductOptionsExist", ProductIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting options exist", e);
            }
            return optionsExist;
        }

        public List<FeaturedProduct> GetFeaturedProducts(int? categoryID)
        {
            List<FeaturedProduct> products = new List<FeaturedProduct>();

            SqlParameter CategoryIDSqlParameter = new SqlParameter("@CategoryID", SqlDbType.Int);
            if (categoryID.HasValue)
                CategoryIDSqlParameter.Value = categoryID.Value;
            else
                CategoryIDSqlParameter.Value = DBNull.Value;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetFeaturedProducts", CategoryIDSqlParameter))
                {
                    while (reader.Read())
                        products.Add((FeaturedProduct)ObjectHelper.GetAs(reader, typeof(FeaturedProduct)));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting featured products", e);
            }
            return products;
        }

        public List<RelatedProduct> GetRelatedProducts(int productID)
        {
            List<RelatedProduct> products = new List<RelatedProduct>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetRelatedProducts", ProductIDSqlParameter))
                {
                    while (reader.Read())
                        products.Add((RelatedProduct)ObjectHelper.GetAs(reader, typeof(RelatedProduct)));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting related products", e);
            }
            return products;
        }
        #endregion

        #region Insert
        public int AddProduct(Product product)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(product);
                paramArray[0] = null;
                paramArray[3] = null;
                paramArray[4] = null;
                product.ProductID = (int)SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddProduct", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding Product", e);
            }
            return product.ProductID;
        }
        #endregion

        #region Update
        public void UpdateProduct(Product product)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(product);
                paramArray[3] = null;
                paramArray[4] = null;
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateProduct", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Updating Product", e);
            }
        } 
        #endregion
    }
}
