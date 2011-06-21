using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;


namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Categories
    {
        public static List<Category> GetCategories()
        {
            List<Category> categories = new List<Category>();
            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCategories"))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<Category>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    Category category;
                    while (reader.Read())
                    {
                        category = new Category();
                        ObjectHelper.LoadAs<Category>(reader, category, props, columnList);
                        categories.Add(category);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting categories", e);
            }
            return categories;
        }

        public static List<string> GetTags()
        {
            List<string> tags = new List<string>();
           
            try
            {
                using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetTags"))
                {
                    while (rdr.Read())
                        tags.Add(Convert.ToString(rdr["TagName"]));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting tags", e);
            }
            return tags;
        }

        public static List<int> GetProductCategories(int productID)
        {
            List<int> productCategories = new List<int>();

            try
            {
                SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int) { Value = productID };

                using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductCategories", ProductIDSqlParameter))
                {
                    while (rdr.Read())
                        productCategories.Add(rdr.GetInt32(0));
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error product categories tags", e);
            }
            return productCategories;
        }
    }
}
