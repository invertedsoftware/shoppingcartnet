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
    public class Categories
    {
        public ListItemCollection GetCategories(int? parentCategoryID, bool active)
        {
            ListItemCollection categoryCollection = new ListItemCollection();
            SqlParameter[] paramArray = new SqlParameter[2];

            SqlParameter ParentCategoryIDSqlParameter = new SqlParameter("@ParentCategoryID", SqlDbType.Int);
            if (parentCategoryID.HasValue)
                ParentCategoryIDSqlParameter.Value = parentCategoryID.Value;
            else
                ParentCategoryIDSqlParameter.Value = DBNull.Value;
            paramArray[0] = ParentCategoryIDSqlParameter;

            SqlParameter ActiveSqlParameter = new SqlParameter("@Active", SqlDbType.Bit);
            ActiveSqlParameter.Value = active;
            paramArray[1] = ActiveSqlParameter;

            try
            {

                using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCategories", paramArray))
                {
                    while (rdr.Read())
                    {
                        ListItem item = new ListItem();
                        item.Value = rdr["CategoryID"].ToString();
                        item.Text = rdr["CategoryName"].ToString();
                        categoryCollection.Add(item);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting categories", e);
            }

            return categoryCollection;
        }
    }
}
