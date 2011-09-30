using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;




namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
	public static class GiftRegistries
	{
		#region Select
		public static GiftRegistry GetGiftRegistry(int giftRegistryID, int customerID, string email, bool fillProducts = true)
		{
			GiftRegistry giftRegistry = new GiftRegistry();
			SqlParameter[] paramArray = new SqlParameter[3];

			SqlParameter GiftRegistryIDSqlParameter = new SqlParameter("@GiftRegistryID", SqlDbType.Int) { Value = giftRegistryID };
			paramArray[0] = GiftRegistryIDSqlParameter;

			SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int) { Value = customerID };
			paramArray[1] = CustomerIDSqlParameter;

			SqlParameter EmailIDSqlParameter = new SqlParameter("@Email", SqlDbType.VarChar, 50);
			if (string.IsNullOrWhiteSpace(email))
				EmailIDSqlParameter.Value = DBNull.Value;
			else
				EmailIDSqlParameter.Value = email;
			paramArray[2] = EmailIDSqlParameter;

			try
			{
				using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetGiftRegistry", paramArray))
				{
					while (reader.Read())
					{
						ObjectHelper.LoadAs<GiftRegistry>(reader, giftRegistry);
						if (fillProducts)
							giftRegistry.Products = GetGiftRegistryProducts(giftRegistry.GiftRegistryID);
					}
				}
			}
			catch (Exception e)
			{
				throw new Exception("Error Getting Gift Registry", e);
			}
			return giftRegistry;
		}

		public static List<GiftRegistryProduct> GetGiftRegistryProducts(int GiftRegistryID)
		{
			List<GiftRegistryProduct> giftRegistryProducts = new List<GiftRegistryProduct>();

			SqlParameter GiftRegistryIDSqlParameter = new SqlParameter("@GiftRegistryID", SqlDbType.Int) { Value = GiftRegistryID };

			try
			{
				using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetGiftRegistryProducts", GiftRegistryIDSqlParameter))
				{
					PropertyInfo[] props = ObjectHelper.GetCachedProperties<GiftRegistryProduct>();
					List<string> columnList = ObjectHelper.GetColumnList(reader);
					GiftRegistryProduct giftRegistryProduct;
					while (reader.Read())
					{
						giftRegistryProduct = new GiftRegistryProduct();
						ObjectHelper.LoadAs<GiftRegistryProduct>(reader, giftRegistryProduct, props, columnList);
						giftRegistryProducts.Add(giftRegistryProduct);
					}
				}
			}
			catch (Exception e)
			{
				throw new Exception("Error getting Gift Registry Products", e);
			}
			return giftRegistryProducts;
		}
		#endregion

		#region Insert
		public static int AddGiftRegistry(GiftRegistry giftRegistry)
		{
			try
			{
				SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<GiftRegistry>(giftRegistry, CrudFieldType.Create);
				giftRegistry.GiftRegistryID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddGiftRegistry", paramArray));
			}
			catch (Exception e)
			{
				throw new Exception("Error Adding Gift Registry", e);
			}
			return giftRegistry.GiftRegistryID;
		}

		public static int AddGiftRegistryProduct(GiftRegistryProduct giftRegistryProduct)
		{
			try
			{
				SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<GiftRegistryProduct>(giftRegistryProduct, CrudFieldType.Create);
				giftRegistryProduct.GiftRegistryProductID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddGiftRegistryProduct", paramArray));
			}
			catch (Exception e)
			{
				throw new Exception("Error Adding Gift Registry product", e);
			}
			return giftRegistryProduct.GiftRegistryProductID;
		}
		#endregion

		#region Update

		public static void UpdateRegistryProductActive(int giftRegistryID, int giftRegistryProductID, bool active)
		{
			SqlParameter[] paramArray = new SqlParameter[] { 
				new SqlParameter("@GiftRegistryID", SqlDbType.Int) { Value = giftRegistryID },
				new SqlParameter("@GiftRegistryProductID", SqlDbType.Int) { Value = giftRegistryProductID },
				new SqlParameter("@Active", SqlDbType.Bit) { Value = active }
			};

			try
			{
				SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateRegistryProductActive", paramArray);
			}
			catch (Exception e)
			{
				throw new Exception("Error Updating Registry Product Active", e);
			}
		}
		#endregion

		#region Delete
		public static void RemoveGiftRegistry(int customerID)
		{
			SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int) { Value = customerID };

			try
			{
				SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "RemoveGiftRegistry", CustomerIDSqlParameter);
			}
			catch (Exception e)
			{
				throw new Exception("Error deleting Gift Registry", e);
			}
		}

		public static void RemoveGiftRegistryProduct(int customerID, int giftRegistryProductID)
		{
			SqlParameter[] paramArray = new SqlParameter[] { 
				new SqlParameter("@CustomerID", SqlDbType.Int) { Value = customerID },
				new SqlParameter("@GiftRegistryProductID", SqlDbType.Int) { Value = giftRegistryProductID }
			};

			try
			{
				SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "RemoveGiftRegistryProduct", paramArray);
			}
			catch (Exception e)
			{
				throw new Exception("Error deleting Gift Registry Product", e);
			}
		}
		#endregion
	}
}
