using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public enum LookupDataEnum
    {
        NoBinding,
        GetOrderStatus,
        GetShippingPoviders,
        GetCountries,
        GetStates,
        GetProvinces
    }

    public static class LookupTables
    {
        public static ListItemCollection GetLookupTable(LookupDataEnum LookupData, bool AddEmptyItem)
        {
            ListItemCollection LookupDataCollection = new ListItemCollection();
            if (AddEmptyItem) LookupDataCollection.Add(new ListItem("-Select-", ""));

            SqlParameter ActiveSqlParameter = new SqlParameter("@Active", SqlDbType.Bit);
            ActiveSqlParameter.Value = true;

            try
            {
                using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, Enum.GetName(typeof(LookupDataEnum), LookupData), ActiveSqlParameter))
                {
                    while (rdr.Read())
                    {
                        ListItem item = new ListItem();
                        item.Value = rdr[0].ToString();
                        item.Text = rdr[1].ToString();
                        LookupDataCollection.Add(item);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting lookup data", e);
            }

            return LookupDataCollection;
        }
    }
}
