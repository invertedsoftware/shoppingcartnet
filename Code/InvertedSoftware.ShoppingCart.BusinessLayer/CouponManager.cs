using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    internal static class CouponManager
    {
        public static decimal GetCartCouponsAmount(Cart shoppingCart)
        {
            decimal couponsAmount = 0;
            CouponType couponType;
            CartItem item;
            foreach (Coupon coupon in shoppingCart.CartCoupons)
            {
                if (!Enum.TryParse<CouponType>(coupon.CouponTypeID.ToString(), out couponType))
                    continue;

                switch (couponType)
                {
                    case CouponType.AmountFromOrder:
                        couponsAmount += coupon.Amount;
                        break;
                    case CouponType.AmountFromProduct:
                        if (shoppingCart.CartItems.Count(i => i.ProductID == coupon.ProductID) > 0)
                            couponsAmount += coupon.Amount;
                        break;
                    case CouponType.BuyOneGetOneFree:
                        item = shoppingCart.CartItems.Where(i=>i.ProductID == coupon.ProductID).FirstOrDefault();
                        if(item == null)
                            continue;
                        if(item.Quantity % 2 == 0)
                            couponsAmount += (item.PricePerUnit + item.ProductOptions.Sum(o => o.PriceChange)) * item.Quantity / 2;
                        else if (item.Quantity > 2)
                            couponsAmount += (item.PricePerUnit + item.ProductOptions.Sum(o => o.PriceChange)) * (item.Quantity - 1) / 2;
                        break;
                    case CouponType.PercentFromOrder:
                        couponsAmount += shoppingCart.Subtotal * coupon.Amount / 100;
                        break;
                    case CouponType.PercentFromProduct:
                        item = shoppingCart.CartItems.Where(i=>i.ProductID == coupon.ProductID).FirstOrDefault();
                        if(item == null)
                            continue;
                        couponsAmount += (item.PricePerUnit + item.ProductOptions.Sum(o => o.PriceChange)) * coupon.Amount / 100;
                        break;
                    default:
                        break;
                }
            }
            return couponsAmount;
        }
    }
}
