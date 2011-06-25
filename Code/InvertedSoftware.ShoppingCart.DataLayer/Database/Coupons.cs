using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Helpers;

namespace InvertedSoftware.ShoppingCart.DataLayer.Database
{
	public enum CouponType
	{
		PercentFromProduct = 1,
		AmountFromProduct = 2,
		PercentFromOrder = 3,
		AmountFromOrder = 4,
		FreeShippingProduct = 5,
		FreeShippingOrder = 6,
		BuyOneGetOneFree = 7
	}

	public static class Coupons
	{
		#region Select
		public static Coupon GetCoupon(string couponCode)
		{
			Coupon coupon = new Coupon();

			SqlParameter CouponCodeSqlParameter = new SqlParameter("@CouponCode", SqlDbType.VarChar, 200) { Value = couponCode };
			
			try
			{
				using (SqlDataReader reader = SqlHelper.ExecuteReader(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "GetCoupon", CouponCodeSqlParameter))
				{
					while (reader.Read())
						ObjectHelper.LoadAs<Coupon>(reader, coupon);
				}
			}
			catch (Exception e)
			{
				throw new Exception("Error Getting Coupon", e);
			}
			return coupon;
		}
		#endregion

		#region Update
		public static void DeactivateCoupon(int couponID)
		{
			SqlParameter CouponIDSqlParameter = new SqlParameter("@CouponID", SqlDbType.Int) { Value = couponID };

			try
			{
				SqlHelper.ExecuteNonQuery(SqlHelper.mainConnectionString, CommandType.StoredProcedure, "DeactivateCoupon", CouponIDSqlParameter);
			}
			catch (Exception e)
			{
				throw new Exception("Error Getting Coupon", e);
			}
		}
		#endregion
	}
}
