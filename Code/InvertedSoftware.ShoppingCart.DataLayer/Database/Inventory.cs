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
    public enum InventoryAction
    {
        /// <summary>
        /// Product is not in inventory
        /// </summary>
        NotInventoryControled = 0,
        /// <summary>
        /// For products with options, do not allow selling the options combination
        /// </summary>
        StopSellingOption = 1,
        /// <summary>
        /// For products with no options remove the buy button and replace it with an out of stock message
        /// </summary>
        StopSellingProduct = 2,
       /// <summary>
       /// On add to cart products with options, prompt that this is a pre order
       /// </summary>
        ShowPreOrderOption = 3,
        /// <summary>
        /// Show a message that the product is out of stock and replace the text on the buy button with pre order text
        /// </summary>
        ShowPreOrderProduct = 4,
        /// <summary>
        /// Do nothing.
        /// </summary>
        DoNothing = 5
    }

    public class Inventory
    {
        #region Select
        public static DataObjects.Inventory GetProductInventory(int productID, List<int> productOptions)
        {
            DataObjects.Inventory inventory = new DataObjects.Inventory();

            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@ProductID", SqlDbType.Int);
            sqlParams[0].Value = productID;

            sqlParams[1] = new SqlParameter("@CommaDelimitedProductOptions", SqlDbType.VarChar, 2000);
            sqlParams[1].Value = String.Join(",", productOptions);

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductInventory", sqlParams))
                {
                    while (reader.Read())
                        ObjectHelper.LoadAs<DataObjects.Inventory>(reader, inventory);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error GetProductInventory", e);
            }
            return inventory;
        }
        #endregion

        public static void UpdateProductInventory(int productID, List<int> productOptions, int quantity)
        {
        
            SqlParameter[] sqlParams = new SqlParameter[3];

            sqlParams[0] = new SqlParameter("@ProductID", SqlDbType.Int);
            sqlParams[0].Value = productID;

            sqlParams[1] = new SqlParameter("@CommaDelimitedProductOptions", SqlDbType.VarChar, 2000);
            sqlParams[1].Value = String.Join(",", productOptions);

            sqlParams[2] = new SqlParameter("@Quantity", SqlDbType.Int);
            sqlParams[2].Value = quantity;

            try
            {
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateProductInventory", sqlParams);
            }
            catch (Exception e)
            {
                throw new Exception("Error UpdateProductInventory", e);
            }
        }
    }
}
