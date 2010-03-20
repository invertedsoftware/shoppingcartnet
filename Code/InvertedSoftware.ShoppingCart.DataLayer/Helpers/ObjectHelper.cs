using System;
using System.Data.SqlClient;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.Helpers
{
    internal class ObjectHelper
    {
        // Dictionary to store cached properites
        private static IDictionary<string, PropertyInfo[]> propertiesCache = new Dictionary<string, PropertyInfo[]>();
        // Help with locking
        private static ReaderWriterLockSlim propertiesCacheLock = new ReaderWriterLockSlim();
        /// <summary>
        /// Get an array of PropertyInfo for this type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns>PropertyInfo[] for this type</returns>
        public static PropertyInfo[] GetCachedProperties<T>()
        {
            PropertyInfo[] props;
            if (propertiesCacheLock.TryEnterUpgradeableReadLock(100))
            {
                try
                {
                    if (!propertiesCache.TryGetValue(typeof(T).FullName, out props))
                    {
                        props = typeof(T).GetProperties();
                        if (propertiesCacheLock.TryEnterWriteLock(100))
                        {
                            try
                            {
                                propertiesCache.Add(typeof(T).FullName, props);
                            }
                            finally
                            {
                                propertiesCacheLock.ExitWriteLock();
                            }
                        }
                    }
                }
                finally
                {
                    propertiesCacheLock.ExitUpgradeableReadLock();
                }
                return props;
            }
            else
            {
                return typeof(T).GetProperties();
            }
        }

        /// <summary>
        /// Return the current row in the reader as an object
        /// </summary>
        /// <param name="reader">The Reader</param>
        /// <param name="objectToReturnType">The type of object to return</param>
        /// <returns>Object</returns>
        [Obsolete("Use LoadAs<T>(SqlDataReader reader, T objectToLoad)", false)]
        public static T GetAs<T>(SqlDataReader reader)
        {
            // Create a new Object
            T newObjectToReturn = Activator.CreateInstance<T>();
            LoadAs<T>(reader, newObjectToReturn);
            return newObjectToReturn;
        }

        /// <summary>
        /// Load the current row in a DataReader into an object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="reader"></param>
        /// <param name="objectToLoad"></param>
        public static void LoadAs<T>(SqlDataReader reader, T objectToLoad)
        {
            if(objectToLoad == null)
                objectToLoad = Activator.CreateInstance<T>();
            // Get all the properties in our Object
            PropertyInfo[] props = GetCachedProperties<T>();
            // For each property get the data from the reader to the object
            List<string> columnList = GetColumnList(reader);
            for (int i = 0; i < props.Length; i++)
            {
                if (columnList.Contains(props[i].Name) && reader[props[i].Name] != DBNull.Value)
                    typeof(T).InvokeMember(props[i].Name, BindingFlags.SetProperty, null, objectToLoad, new Object[] { reader[props[i].Name] });
            }
        }

        /// <summary>
        /// Load the current row in a DataReader into an object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="reader"></param>
        /// <param name="objectToLoad"></param>
        /// <param name="props"></param>
        /// <param name="columnList"></param>
        public static void LoadAs<T>(SqlDataReader reader, T objectToLoad, PropertyInfo[] props, List<string> columnList)
        {
            if (objectToLoad == null)
                objectToLoad = Activator.CreateInstance<T>();
            if (props == null)
                props = GetCachedProperties<T>();
            if (columnList == null)
                columnList = GetColumnList(reader);

            for (int i = 0; i < props.Length; i++)
            {
                if (columnList.Contains(props[i].Name) && reader[props[i].Name] != DBNull.Value)
                    typeof(T).InvokeMember(props[i].Name, BindingFlags.SetProperty, null, objectToLoad, new Object[] { reader[props[i].Name] });
            }
        }

        /// <summary>
        /// Return a list from the current reader
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="reader">The reader</param>
        /// <returns></returns>
        [Obsolete("Use LoadAs<T>(SqlDataReader reader, T objectToLoad, PropertyInfo[] props, List<string> columnList)", false)]
        public static List<T> GetAsList<T>(SqlDataReader reader)
        {
            List<T> objetList = new List<T>();
            // Get all the properties in our Object
            PropertyInfo[] props = GetCachedProperties<T>();
            // For each property get the data from the reader to the object
            List<string> columnList = GetColumnList(reader);
            while (reader.Read())
            {
                // Create a new Object
                T newObjectToReturn = Activator.CreateInstance<T>();
                for (int i = 0; i < props.Length; i++)
                {
                    if (columnList.Contains(props[i].Name) && reader[props[i].Name] != DBNull.Value)
                        typeof(T).InvokeMember(props[i].Name, BindingFlags.SetProperty, null, newObjectToReturn, new Object[] { reader[props[i].Name] });
                }
                objetList.Add(newObjectToReturn);
            }
            return objetList;
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

        public static SqlParameter[] GetSQLParametersFromPublicProperties(object dataObject, CrudFieldType usedFor)
        {
            Type type = dataObject.GetType();
            PropertyInfo[] props = type.GetProperties();
            List<SqlParameter> paramList = new List<SqlParameter>();
            for (int i = 0; i < props.Length; i++)
            {
                if (props[i].PropertyType.IsValueType || props[i].PropertyType.Name == "String")
                {
                    object fieldValue = type.InvokeMember(props[i].Name, BindingFlags.GetProperty, null, dataObject, null);
                    CrudField usedForAttr = Attribute.GetCustomAttribute(props[i], typeof(CrudField)) as CrudField;
                    if (usedForAttr != null && (usedForAttr.UsedFor & usedFor) == usedForAttr.UsedFor)
                    {
                        SqlParameter sqlParameter = new SqlParameter("@" + props[i].Name, fieldValue);
                        paramList.Add(sqlParameter);
                    }
                    else if (usedForAttr == null)
                    {
                        SqlParameter sqlParameter = new SqlParameter("@" + props[i].Name, fieldValue);
                        paramList.Add(sqlParameter);
                    }
                }
            }
            return paramList.ToArray();
        }


        /// <summary>
        /// Get a list of column names from the reader
        /// </summary>
        /// <param name="reader">The reader</param>
        /// <returns></returns>
        public static List<string> GetColumnList(SqlDataReader reader)
        {
            List<string> columnList = new List<string>();
            System.Data.DataTable readerSchema = reader.GetSchemaTable();
            for (int i = 0; i < readerSchema.Rows.Count; i++)
                columnList.Add(readerSchema.Rows[i]["ColumnName"].ToString());
            return columnList;
        }
    }
}
