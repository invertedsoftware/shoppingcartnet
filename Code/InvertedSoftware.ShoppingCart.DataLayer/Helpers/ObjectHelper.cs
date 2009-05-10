using System;
using System.Data.SqlClient;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.Helpers
{
    internal class ObjectHelper
    {
        public static Object GetAs(SqlDataReader reader, Type objectToReturnType)
        {
            // Create a new Object
            Object newObjectToReturn = Activator.CreateInstance(objectToReturnType);
            // Get all the properties in our Object
            PropertyInfo[] props = objectToReturnType.GetProperties();
            // For each property get the data from the reader to the object
            for (int i = 0; i < props.Length; i++)
            {
                if (ColumnExists(reader, props[i].Name) && reader[props[i].Name] != DBNull.Value) 
                    objectToReturnType.InvokeMember(props[i].Name, BindingFlags.SetProperty, null, newObjectToReturn, new Object[] { reader[props[i].Name] });
            }
            return newObjectToReturn;
        }

        public static SqlParameter[] GetSQLParametersFromPublicProperties(object dataObject)
        {
            Type type = dataObject.GetType();
            PropertyInfo[] props = type.GetProperties();
            SqlParameter[] paramArray = new SqlParameter[props.Length];

            for (int i = 0; i < props.Length; i++)
            {
                if (props[i].PropertyType.Namespace.Equals("System.Collections.Generic"))
                    continue;
                object fieldValue = type.InvokeMember(props[i].Name, BindingFlags.GetProperty, null, dataObject, null);
                if (fieldValue != null)
                {
                    SqlParameter sqlParameter = new SqlParameter();
                    sqlParameter.ParameterName = "@" + props[i].Name;
                    sqlParameter.Value = fieldValue;
                    paramArray[i] = sqlParameter;
                }
            }

            return paramArray;
        }

      
        public static bool ColumnExists(SqlDataReader reader, string columnName)
        {
            reader.GetSchemaTable().DefaultView.RowFilter = "ColumnName= '" + columnName + "'";
            return (reader.GetSchemaTable().DefaultView.Count > 0);
        }
    }
}
