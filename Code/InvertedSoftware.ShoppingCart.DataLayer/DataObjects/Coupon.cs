using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
	public class Coupon
	{
		public int CouponID { get; set; }
		public int CouponTypeID { get; set; }
		public int? ProductID { get; set; }
		public string CouponCode { get; set; }
		public string CouponDescription { get; set; }
		public decimal Amount { get; set; }
		public bool IsCouponUnique { get; set; }
		public bool IsCanBeCombined { get; set; }
		public DateTime IssuedDate { get; set; }
		public DateTime? ExpirationDate { get; set; }
		public bool Active { get; set; }
	}
}
