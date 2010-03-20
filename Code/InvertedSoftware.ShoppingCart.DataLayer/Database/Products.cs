using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Products
    {
        #region Select
        public static Product GetProduct(int productID)
        {
            Product product = new Product();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@productID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProduct", ProductIDSqlParameter))
                {
                    while (reader.Read())
                        ObjectHelper.LoadAs<Product>(reader, product);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Getting Product", e);
            }
            return product;
        }

        public static Product GetProduct(string productName)
        {
            Product product = new Product();

            SqlParameter ProductNameSqlParameter = new SqlParameter("@ProductName", SqlDbType.VarChar, 50);
            ProductNameSqlParameter.Value = productName;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProduct", ProductNameSqlParameter))
                {
                    while (reader.Read())
                        ObjectHelper.LoadAs<Product>(reader, product);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Getting Product", e);
            }
            return product;
        }

        public static List<string> GetProductImages(int productID, bool isThumnails)
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
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<Product>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        Product product;
                        while (rdr.Read())
                        {
                            product = new Product();
                            ObjectHelper.LoadAs<Product>(rdr, product, props, columnList);
                            productList.Add(product);
                        }
                    }
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

        public List<Product> SearchProducts(string keyword, int pageIndex, int maximumRows)
        {
            List<Product> productList = new List<Product>();

            SqlParameter[] paramArray = new SqlParameter[4];

            SqlParameter PageIndexSqlParameter = new SqlParameter("@PageIndex", SqlDbType.Int);
            PageIndexSqlParameter.Value = pageIndex;
            paramArray[0] = PageIndexSqlParameter;

            SqlParameter PageSizeSqlParameter = new SqlParameter("@PageSize", SqlDbType.Int);
            PageSizeSqlParameter.Value = maximumRows;
            paramArray[1] = PageSizeSqlParameter;

            SqlParameter KeywordSqlParameter = new SqlParameter("@Keyword", SqlDbType.VarChar, 200);
            KeywordSqlParameter.Value = keyword;
            paramArray[2] = KeywordSqlParameter;

            SqlParameter TotalRecordsSqlParameter = new SqlParameter("@TotalRecords", SqlDbType.Int);
            TotalRecordsSqlParameter.Direction = ParameterDirection.ReturnValue;
            paramArray[3] = TotalRecordsSqlParameter;

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {

                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "SearchProducts", paramArray);
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<Product>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        Product product;
                        while (rdr.Read())
                        {
                            product = new Product();
                            ObjectHelper.LoadAs<Product>(rdr, product, props, columnList);
                            productList.Add(product);
                        }
                    }
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

        public List<Product> GetProductsByTags(string tagName, int pageIndex, int maximumRows)
        {
            List<Product> productList = new List<Product>();

            SqlParameter[] paramArray = new SqlParameter[4];

            SqlParameter PageIndexSqlParameter = new SqlParameter("@PageIndex", SqlDbType.Int);
            PageIndexSqlParameter.Value = pageIndex;
            paramArray[0] = PageIndexSqlParameter;

            SqlParameter PageSizeSqlParameter = new SqlParameter("@PageSize", SqlDbType.Int);
            PageSizeSqlParameter.Value = maximumRows;
            paramArray[1] = PageSizeSqlParameter;

            SqlParameter TagNameSqlParameter = new SqlParameter("@TagName", SqlDbType.VarChar, 200);
            TagNameSqlParameter.Value = tagName;
            paramArray[2] = TagNameSqlParameter;

            SqlParameter TotalRecordsSqlParameter = new SqlParameter("@TotalRecords", SqlDbType.Int);
            TotalRecordsSqlParameter.Direction = ParameterDirection.ReturnValue;
            paramArray[3] = TotalRecordsSqlParameter;

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {
                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "GetProductsByTag", paramArray);
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<Product>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        Product product;
                        while (rdr.Read())
                        {
                            product = new Product();
                            ObjectHelper.LoadAs<Product>(rdr, product, props, columnList);
                            productList.Add(product);
                        }
                    }
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

        public static List<ProductOption> GetProductOptions(int productID)
        {
            List<ProductOption> productOptions = new List<ProductOption>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductOptions", ProductIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<ProductOption>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    ProductOption productOption;
                    while (reader.Read())
                    {
                        productOption = new ProductOption();
                        ObjectHelper.LoadAs<ProductOption>(reader, productOption, props, columnList);
                        productOptions.Add(productOption);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting product options", e);
            }
            return productOptions;
        }

        public static List<CustomField> GetCustomFields(int productID)
        {
            List<CustomField> customFields = new List<CustomField>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomFields", ProductIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<CustomField>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    CustomField customField;
                    while (reader.Read())
                    {
                        customField = new CustomField();
                        ObjectHelper.LoadAs<CustomField>(reader, customField, props, columnList);
                        customFields.Add(customField);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting custom fields", e);
            }
            return customFields;
        }

        public static bool IsProductOptionsExist(int productID)
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

        public static List<FeaturedProduct> GetFeaturedProducts(int? categoryID)
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
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<FeaturedProduct>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    FeaturedProduct featuredProduct;
                    while (reader.Read())
                    {
                        featuredProduct = new FeaturedProduct();
                        ObjectHelper.LoadAs<FeaturedProduct>(reader, featuredProduct, props, columnList);
                        products.Add(featuredProduct);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting featured products", e);
            }
            return products;
        }

        public static List<RelatedProduct> GetRelatedProducts(int productID)
        {
            List<RelatedProduct> products = new List<RelatedProduct>();

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetRelatedProducts", ProductIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<RelatedProduct>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    RelatedProduct relatedProduct;
                    while (reader.Read())
                    {
                        relatedProduct = new RelatedProduct();
                        ObjectHelper.LoadAs<RelatedProduct>(reader, relatedProduct, props, columnList);
                        products.Add(relatedProduct);
                    }
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
        public static int AddProduct(Product product)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(product, InvertedSoftware.ShoppingCart.DataLayer.DataAttributes.CrudFieldType.Create);
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
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(product, InvertedSoftware.ShoppingCart.DataLayer.DataAttributes.CrudFieldType.Update);
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
