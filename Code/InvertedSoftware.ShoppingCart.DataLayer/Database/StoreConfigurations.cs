using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.Helpers;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
	public static class StoreConfigurations
	{
		public static void LoadStoreConfiguration()
		{
			try
			{
				using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetStoreConfiguration"))
				{
					ConfigurationKey configurationKey;

					while (reader.Read())
					{
						if (Enum.TryParse<ConfigurationKey>(reader.GetString(0), out configurationKey))
							StoreConfiguration.UpdateValue(configurationKey, reader.GetString(1));
					}
				}
			}
			catch (Exception e)
			{
				throw new Exception("Error Loading Configuration", e);
			}
		}

		public static void UpdateConfigurationValue(ConfigurationKey configurationKey, string configurationValue)
		{
			if (configurationValue == null)
				configurationValue = string.Empty;

			SqlParameter[] paramArray = new SqlParameter[] { 
				new SqlParameter("@ConfigKey", SqlDbType.VarChar, 50) { Value = configurationKey.ToString() },
				new SqlParameter("@ConfigValue", SqlDbType.VarChar, 800) { Value = configurationValue }
			};

			try
			{
				SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "SetStoreConfiguration", paramArray);
			}
			catch (Exception e)
			{
				throw new Exception("Error Updating Configuration value", e);
			}
		}

		public static void SaveAll()
		{
			foreach (ConfigurationKey configKey in Enum.GetValues(typeof(ConfigurationKey)))
				UpdateConfigurationValue(configKey, StoreConfiguration.GetConfigurationValue(configKey));
		}
	}
}
