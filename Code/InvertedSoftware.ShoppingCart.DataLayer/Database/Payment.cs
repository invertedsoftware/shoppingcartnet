using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Payment
    {
        public string GetCountryCode(int countryID)
        {
            string countryCode = string.Empty;

            SqlParameter CountryIDSqlParameter = new SqlParameter("@CountryID", SqlDbType.Int);
            CountryIDSqlParameter.Value = countryID;

            try
            {
                countryCode = Convert.ToString(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCountryCode", CountryIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting Country Code", e);
            }
            return countryCode;
        }

        public string GetStateCode(int stateID)
        {
            string stateCode = string.Empty;

            SqlParameter StateIDSqlParameter = new SqlParameter("@StateID", SqlDbType.Int);
            StateIDSqlParameter.Value = stateID;

            try
            {
                stateCode = Convert.ToString(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetStateCode", StateIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting State Code", e);
            }
            return stateCode;
        }

        public string GetProvinceCode(int provinceID)
        {
            string provinceCode = string.Empty;

            SqlParameter ProvinceIDSqlParameter = new SqlParameter("@ProvinceID", SqlDbType.Int);
            ProvinceIDSqlParameter.Value = provinceID;

            try
            {
                provinceCode = Convert.ToString(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProvinceCode", ProvinceIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting Province Code", e);
            }
            return provinceCode;
        }
    }
}
