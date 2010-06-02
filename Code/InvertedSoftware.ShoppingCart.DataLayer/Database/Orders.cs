using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

using InvertedSoftware.ShoppingCart.DataLayer.Helpers;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.DataAttributes;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
    public class Orders
    {
        #region Select
        public static Order GetOrder(int orderID)
        {
            Order order = new Order();

            SqlParameter OrderIDSqlParameter = new SqlParameter("@OrderID", SqlDbType.Int);
            OrderIDSqlParameter.Value = orderID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetOrder", OrderIDSqlParameter))
                {
                    while (reader.Read())
                    {
                        ObjectHelper.LoadAs<Order>(reader, order);
                        order.OrderItems = GetOrderItems(orderID);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting order", e);
            }
            return order;
        }

        public static List<OrderItem> GetOrderItems(int orderID)
        {
            List<OrderItem> orderItems = new List<OrderItem>();

            SqlParameter OrderIDSqlParameter = new SqlParameter("@OrderID", SqlDbType.Int);
            OrderIDSqlParameter.Value = orderID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetOrderProducts", OrderIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<OrderItem>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    OrderItem orderItem;
                    while (reader.Read())
                    {
                        orderItem = new OrderItem();
                        ObjectHelper.LoadAs<OrderItem>(reader, orderItem, props, columnList);
                        orderItem.OptionList = GetOrderItemOptionList(orderItem.OrderProductID);
                        orderItem.OrderProductCustomFieldList = GetOrderItemCustomFields(orderItem.OrderProductID);
                        orderItems.Add(orderItem);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting order items", e);
            }
            return orderItems;
        }

        public static List<OrderProductOption> GetOrderItemOptionList(int orderProductID)
        {
            List<OrderProductOption> orderProductOptions = new List<OrderProductOption>();

            SqlParameter OrderProductIDSqlParameter = new SqlParameter("@OrderProductID", SqlDbType.Int);
            OrderProductIDSqlParameter.Value = orderProductID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetOrderProductOptions", OrderProductIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<OrderProductOption>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    OrderProductOption orderProductOption;
                    while (reader.Read())
                    {
                        orderProductOption = new OrderProductOption();
                        ObjectHelper.LoadAs<OrderProductOption>(reader, orderProductOption, props, columnList);
                        orderProductOptions.Add(orderProductOption);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting order product options", e);
            }
            return orderProductOptions;
        }

        public static List<OrderProductCustomField> GetOrderItemCustomFields(int orderProductID)
        {
            List<OrderProductCustomField> orderProductCustomFields = new List<OrderProductCustomField>();

            SqlParameter OrderProductIDSqlParameter = new SqlParameter("@OrderProductID", SqlDbType.Int);
            OrderProductIDSqlParameter.Value = orderProductID;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetOrderProductCustomFields", OrderProductIDSqlParameter))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<OrderProductCustomField>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    OrderProductCustomField orderProductCustomField;
                    while (reader.Read())
                    {
                        orderProductCustomField = new OrderProductCustomField();
                        ObjectHelper.LoadAs<OrderProductCustomField>(reader, orderProductCustomField, props, columnList);
                        orderProductCustomFields.Add(orderProductCustomField);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting order product custom fields", e);
            }
            return orderProductCustomFields;
        }

        /// <summary>
        /// Used for flat shipping or handling charges
        /// </summary>
        /// <param name="shippingProviderID"></param>
        /// <returns></returns>
        public static decimal GetShippingCosts(int shippingProviderID)
        {
            decimal shippingCosts = 0;

            SqlParameter ShippingProviderIDSqlParameter = new SqlParameter("@ShippingProviderID", SqlDbType.Int);
            ShippingProviderIDSqlParameter.Value = shippingProviderID;

            try
            {
                shippingCosts = Convert.ToDecimal(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetShippingCosts", ShippingProviderIDSqlParameter));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting Shipping Costs", e);
            }
            return shippingCosts;
        }

        /// <summary>
        /// Used to calculate shipping on an individual product
        /// </summary>
        /// <param name="countryID"></param>
        /// <param name="stateID"></param>
        /// <param name="provinceID"></param>
        /// <param name="productID"></param>
        /// <param name="shippingProviderID"></param>
        /// <returns></returns>
        public static decimal GetProductShippingCosts(int countryID, int? stateID, int? provinceID, int productID , int shippingProviderID)
        {
            decimal shippingCosts = 0;
            SqlParameter[] paramArray = new SqlParameter[5];

            SqlParameter CountryIDSqlParameter = new SqlParameter("@CountryID", SqlDbType.Int);
            CountryIDSqlParameter.Value = countryID;
            paramArray[0] = CountryIDSqlParameter;

            SqlParameter StateIDSqlParameter = new SqlParameter("@StateID", SqlDbType.Int);
            if (stateID.HasValue)
                StateIDSqlParameter.Value = stateID.Value;
            else
                StateIDSqlParameter.Value = DBNull.Value;
            paramArray[1] = StateIDSqlParameter;

            SqlParameter ProvinceIDSqlParameter = new SqlParameter("@ProvinceID", SqlDbType.Int);
            if (provinceID.HasValue)
                ProvinceIDSqlParameter.Value = provinceID.Value;
            else
                ProvinceIDSqlParameter.Value = DBNull.Value;
            paramArray[2] = ProvinceIDSqlParameter;

            SqlParameter ProductIDSqlParameter = new SqlParameter("@ProductID", SqlDbType.Int);
            ProductIDSqlParameter.Value = productID;
            paramArray[3] = ProductIDSqlParameter;

            SqlParameter ShippingProviderIDSqlParameter = new SqlParameter("@ShippingProviderID", SqlDbType.Int);
            ShippingProviderIDSqlParameter.Value = shippingProviderID;
            paramArray[4] = ShippingProviderIDSqlParameter;

            try
            {
                shippingCosts = Convert.ToDecimal(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetProductShipping", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error getting Shipping Product Costs", e);
            }
            return shippingCosts;
        }

        public static List<Tax> GetTaxes(int countryID, int? stateID, int? provinceID)
        {
            List<Tax> taxes = new List<Tax>();
            SqlParameter[] paramArray = new SqlParameter[3];

            SqlParameter CountryIDSqlParameter = new SqlParameter("@CountryID", SqlDbType.Int);
            CountryIDSqlParameter.Value = countryID;
            paramArray[0] = CountryIDSqlParameter;

            SqlParameter StateIDSqlParameter = new SqlParameter("@StateID", SqlDbType.Int);
            if (stateID.HasValue)
                StateIDSqlParameter.Value = stateID.Value;
            else
                StateIDSqlParameter.Value = DBNull.Value;
            paramArray[1] = StateIDSqlParameter;

            SqlParameter ProvinceIDSqlParameter = new SqlParameter("@ProvinceID", SqlDbType.Int);
            if (provinceID.HasValue)
                ProvinceIDSqlParameter.Value = provinceID.Value;
            else
                ProvinceIDSqlParameter.Value = DBNull.Value;
            paramArray[2] = ProvinceIDSqlParameter;

            try
            {
                using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetTaxes", paramArray))
                {
                    PropertyInfo[] props = ObjectHelper.GetCachedProperties<Tax>();
                    List<string> columnList = ObjectHelper.GetColumnList(reader);
                    Tax tax;
                    while (reader.Read())
                    {
                        tax = new Tax();
                        ObjectHelper.LoadAs<Tax>(reader, tax, props, columnList);
                        taxes.Add(tax);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error getting taxes", e);
            }
            return taxes;
        }

        public int OrderCount { get; set; }

        public List<OrderDisplay> GetOrders(int customerID, DateTime startDate, DateTime endDate, bool Active, int startRowIndex, int maximumRows)
        {
            int PageIndex = Convert.ToInt32(startRowIndex / maximumRows);

            List<OrderDisplay> orderList = new List<OrderDisplay>();

            SqlParameter[] paramArray = new SqlParameter[6];

            SqlParameter PageIndexSqlParameter = new SqlParameter("@PageIndex", SqlDbType.Int);
            PageIndexSqlParameter.Value = PageIndex;
            paramArray[0] = PageIndexSqlParameter;

            SqlParameter PageSizeSqlParameter = new SqlParameter("@PageSize", SqlDbType.Int);
            PageSizeSqlParameter.Value = maximumRows;
            paramArray[1] = PageSizeSqlParameter;

            SqlParameter CustomerIDSqlParameter = new SqlParameter("@CustomerID", SqlDbType.Int);
            CustomerIDSqlParameter.Value = customerID;
            paramArray[2] = CustomerIDSqlParameter;

            SqlParameter StartDateSqlParameter = new SqlParameter("@StartDate", SqlDbType.DateTime);
            StartDateSqlParameter.Value = startDate;
            paramArray[3] = StartDateSqlParameter;

            SqlParameter EndDateSqlParameter = new SqlParameter("@EndDate", SqlDbType.DateTime);
            EndDateSqlParameter.Value = endDate;
            paramArray[4] = EndDateSqlParameter;

            SqlParameter TotalRecordsSqlParameter = new SqlParameter("@TotalRecords", SqlDbType.Bit);
            TotalRecordsSqlParameter.Direction = ParameterDirection.ReturnValue;
            paramArray[5] = TotalRecordsSqlParameter;

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = new SqlConnection(SqlHelper.mainConnectionString))
            {

                try
                {
                    SqlHelper.PrepareCommand(cmd, conn, null, CommandType.StoredProcedure, "GetOrders", paramArray);
                    using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        PropertyInfo[] props = ObjectHelper.GetCachedProperties<OrderDisplay>();
                        List<string> columnList = ObjectHelper.GetColumnList(rdr);
                        OrderDisplay order;
                        while (rdr.Read())
                        {
                            order = new OrderDisplay();
                            ObjectHelper.LoadAs<OrderDisplay>(rdr, order, props, columnList);
                            orderList.Add(order);
                        }
                    }
                    OrderCount = Convert.ToInt32(TotalRecordsSqlParameter.Value);
                    cmd.Parameters.Clear();
                }
                catch (Exception e)
                {
                    throw new Exception("Error getting orders", e);
                }
            }

            return orderList;
        }

        public int GetOrderCount(int customerID, DateTime startDate, DateTime endDate, bool Active)
        {
            return OrderCount;
        }
        #endregion

        #region Insert
        public static int AddOrder(Order order)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<Order>(order, CrudFieldType.Create);
                order.OrderID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddOrder", paramArray));
                foreach (OrderItem orderItem in order.OrderItems)
                {
                    orderItem.OrderID = order.OrderID;
                    AddOrderItem(orderItem);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding order", e);
            }
            return order.OrderID;
        }

        public static int AddOrderItem(OrderItem orderItem)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties <OrderItem>(orderItem, CrudFieldType.Create);
                orderItem.OrderProductID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddOrderProduct", paramArray));
                foreach (OrderProductOption option in orderItem.OptionList)
                    AddOrderProductOption(orderItem.OrderProductID, option.ProductOptionID);
                foreach (OrderProductCustomField field in orderItem.OrderProductCustomFieldList)
                {
                    field.OrderProductID = orderItem.OrderProductID;
                    AddOrderCustomField(field);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding order item", e);
            }
            return orderItem.OrderProductID;
        }

        public static int AddOrderProductOption(int orderProductID, int productOptionID)
        {
            int orderProductOptionID = -1;
            try
            {
                SqlParameter[] paramArray = new SqlParameter[2];

                SqlParameter OrderProductIDSqlParameter = new SqlParameter("@OrderProductID", SqlDbType.Int);
                OrderProductIDSqlParameter.Value = orderProductID;
                paramArray[0] = OrderProductIDSqlParameter;

                SqlParameter ProductOptionIDSqlParameter = new SqlParameter("@ProductOptionID", SqlDbType.Int);
                ProductOptionIDSqlParameter.Value = productOptionID;
                paramArray[1] = ProductOptionIDSqlParameter;

                orderProductOptionID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddOrderProductOption", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding Order Product Option", e);
            }
            return orderProductOptionID;
        }

        public static int AddOrderCustomField(OrderProductCustomField orderProductCustomField)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<OrderProductCustomField>(orderProductCustomField, CrudFieldType.Create);
                orderProductCustomField.OrderProductCustomFieldID = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "AddOrderProductCustomField", paramArray));
            }
            catch (Exception e)
            {
                throw new Exception("Error Adding Order Product Custom Field", e);
            }
            return orderProductCustomField.OrderProductCustomFieldID;
        } 
        #endregion

        #region Update
        public static void UpdateOrderStatus(int orderID, int orderStatusID)
        {
            SqlParameter[] paramArray = new SqlParameter[5];

            SqlParameter OrderIDSqlParameter = new SqlParameter("@OrderID", SqlDbType.Int);
            OrderIDSqlParameter.Value = orderID;
            paramArray[0] = OrderIDSqlParameter;

            SqlParameter OrderStatusIDSqlParameter = new SqlParameter("@OrderStatusID", SqlDbType.Int);
            OrderStatusIDSqlParameter.Value = orderStatusID;
            paramArray[1] = OrderStatusIDSqlParameter;

            try
            {
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateOrderStatus", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Updating order Status", e);
            }
        }

        public static void UpdateOrder(Order order)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<Order>(order, CrudFieldType.Update);
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateOrder", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Updating order", e);
            }
        }

        public static void UpdateOrderItem(OrderItem orderItem)
        {
            try
            {
                SqlParameter[] paramArray = ObjectHelper.GetSQLParametersFromPublicProperties<OrderItem>(orderItem, CrudFieldType.Update);
                SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "UpdateOrderItem", paramArray);
            }
            catch (Exception e)
            {
                throw new Exception("Error Updating order item", e);
            }
        }
        #endregion

    }
}
