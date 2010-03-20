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
    public class Customers
    {
        #region Select
        public static Customer GetCustomer(int customerID)
        {
            Customer customer = new Customer();

            SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int);
            CustomerIDSqlParameter.Value = customerID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomer", CustomerIDSqlParameter))
                {
                    while (reader.Read())
                        ObjectHelper.LoadAs<Customer>(reader, customer);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting customer", e);
            }
            return customer;
        }

        public static Customer GetCustomer(Guid MemberID)
        {
            Customer customer = new Customer();

            SqlParameter MemberIDSqlParameter = new SqlParameter("@MemberID", SqlDbType.UniqueIdentifier);
            MemberIDSqlParameter.Value = MemberID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomer", MemberIDSqlParameter))
                {
                    while (reader.Read())
                        ObjectHelper.LoadAs<Customer>(reader, customer);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting customer", e);
            }
            return customer;
        }

        public static string GetCustomerEmail(int customerID)
        {
            string email = string.Empty;

            SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int);
            CustomerIDSqlParameter.Value = customerID;

            try
            {
                email = Convert.ToString(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomerEmail", CustomerIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting customer email", e);
            }
            return email;
        }

        public static int GetCustomerID(Guid MemberID)
        {
            int customerID = -1;
            try
            {
                SqlParameter MemberIDSqlParameter = new SqlParameter("@MemberID", SqlDbType.UniqueIdentifier);
                MemberIDSqlParameter.Value = MemberID;
                customerID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomerID", MemberIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting customer ID", e);
            }
            return customerID;
        }

        public static Guid GetCustomerMemberID(int customerID)
        {
            Guid memberID;
            try
            {
                SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int);
                CustomerIDSqlParameter.Value = customerID;

                memberID = new Guid(Convert.ToString(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCustomerMemberID", CustomerIDSqlParameter)));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting member ID", e);
            }
            return memberID;
        }

        public static bool IsEmailExists(string email)
        {
            bool emailExists = false;
            try
            {
                SqlParameter EmailSqlParameter = new SqlParameter("@Email", SqlDbType.VarChar, 50);
                EmailSqlParameter.Value = email;
                emailExists = Convert.ToBoolean(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "IsEmailExists", EmailSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting Email exists", e);
            }
            return emailExists;
        }

        public int CustomerCount { get; set; }

        public List<Customer> GetCustomers(int pageIndex, int maximumRows)
        {
            List<Customer> customerList = new List<Customer>();

            SqlParameter[] paramArray = new SqlParameter[3];

            SqlParameter PageIndexSqlParameter = new SqlParameter("@PageIndex", SqlDbType.Int);
            PageIndexSqlParameter.Value = pageIndex;
            paramArray[0] = PageIndexSqlParameter;

            SqlParameter PageSizeSqlParameter = new SqlParameter("@PageSize", SqlDbType.Int);
            PageSizeSqlParameter.Value = maximumRows;
            paramArray[1] = PageSizeSqlParameter;

            SqlParameter TotalRecordsSqlParameter = new SqlParameter("@TotalRecords", SqlDbType.Bit);
            TotalRecordsSqlParameter.Direction = ParameterDirection.ReturnValue;
            paramArray[2] = TotalRecordsSqlParameter;

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {
                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "GetCustomers", paramArray);
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<Customer>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        Customer customer;
                        while (rdr.Read())
                        {
                            customer = new Customer();
                            ObjectHelper.LoadAs<Customer>(rdr, customer, props, columnList);
                            customerList.Add(customer);
                        }
                    }
                    CustomerCount = Convert.ToInt32(TotalRecordsSqlParameter.Value);
                    cmd.Parameters.Clear();
                }
                catch (Exception e)
                {
                    throw new Exception("Error getting Customers", e);
                }
            }

            return customerList;
        }
        #endregion

        #region Insert
        public static int AddCustomer(Customer customer)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(customer);
                customer.CustomerID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddCustomer", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding Customer", e);
            }
            return customer.CustomerID;
        }
        #endregion

        #region Update
        public static void UpdateCustomer(Customer customer)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties(customer);
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateCustomer", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Updating Customer", e);
            }
        }
        #endregion
    }
}
