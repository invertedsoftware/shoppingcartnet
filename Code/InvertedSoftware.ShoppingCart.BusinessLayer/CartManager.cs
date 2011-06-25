using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.BusinessLayer;



namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class CartManager
    {
        public Cart ShoppingCart { get; set; }

        public CartManager(Cart cart)
        {
            this.ShoppingCart = cart;
            if (this.ShoppingCart == null)
                this.ShoppingCart = new Cart();
        }

        public decimal SubTotal
        {
            get
            {
                if (ShoppingCart == null || ShoppingCart.CartItems == null)
                    return 0;
                return ShoppingCart.CartItems.Sum(I => I.Subtotal) - ShoppingCart.Discounts;
            }
        }

        public decimal Discounts
        {
            get
            {
                if (ShoppingCart == null || ShoppingCart.CartItems == null)
                    return 0;
                if (ShoppingCart.CartCoupons.Count > 0 && Total > 0)
                    return CouponManager.GetCartCouponsAmount(ShoppingCart);
                return 0;
            }
        }

        public decimal Total
        {
            get
            {
                if (ShoppingCart == null || ShoppingCart.CartItems == null)
                    return 0;
                return SubTotal + ShoppingCart.Shipping + ShoppingCart.Tax - ShoppingCart.Discounts;
            }
        }

        public int Count
        {
            get 
            {
                if (ShoppingCart == null || ShoppingCart.CartItems == null)
                    return 0;
                return ShoppingCart.CartItems.Count;
            }
        }

        public void Add(int productID)
        {
            if (Contains(productID, new List<ProductOption>(), new List<CustomField>()))
            {
                ShoppingCart.CartItems.Where(I => I.ProductID == productID).First().Quantity++;
                ResetItemSubtotal(productID);
            }
            else
            {
                Product product = Products.GetProduct(productID); //Get from data layer
                CartItem cartItem = new CartItem()
                {
                    ProductID = productID,
                    PricePerUnit = product.SalePrice == 0 ? product.Price : product.SalePrice,
                    ProductName = product.ProductName,
                    CatalogNumber = product.CatalogNumber,
                    IsDownloadable = product.IsDownloadable,
                    DownloadURL = product.DownloadURL,
                    IsDownloadKeyRequired = product.IsDownloadKeyRequired,
                    IsDownloadKeyUnique = product.IsDownloadKeyUnique,
                    Quantity = 1,
                    Subtotal = product.Price
                };
                Add(cartItem);
            }
        }

        public void Add(CartItem cartItem)
        {
            //Add options logic here
            if (Contains(cartItem.ProductID, cartItem.ProductOptions, cartItem.CustomFields))
                ShoppingCart.CartItems.Where(I => I.ProductID == cartItem.ProductID).First().Quantity += cartItem.Quantity;
            else
                ShoppingCart.CartItems.Add(cartItem);
            ResetItemSubtotal(cartItem.ProductID);

        }

        public void AddCoupon(Coupon coupon)
        {
            // Check if this coupon can be combined with other coupons. if not, check for other coupons
            if (!coupon.IsCanBeCombined && ShoppingCart.CartCoupons.Count(c => !c.IsCanBeCombined) > 0)
                throw new Exception("This offer cannot be combined with other offers.");
            if (coupon.ExpirationDate.HasValue && coupon.ExpirationDate.Value.CompareTo(DateTime.Now) < 0)
                throw new Exception("This offer is expired.");
            if (ShoppingCart.CartCoupons.Count(c => c.CouponID == coupon.CouponID) > 0)
                throw new Exception("This offers is already in the cart.");
            ShoppingCart.CartCoupons.Add(coupon);
        }

        public void RemoveCoupon(int couponID)
        {
            ShoppingCart.CartCoupons.RemoveWhere(c => c.CouponID == couponID);
        }

        public void Remove(int cartItemIndex)
        {
            ShoppingCart.CartItems.Remove(ShoppingCart.CartItems.ElementAt(cartItemIndex));  
        }

        public bool Contains(int productID, List<ProductOption> productOptions, List<CustomField> customFields)
        {
            if(ShoppingCart.CartItems.Where(I => I.ProductID == productID).Count() > 0 &&
                ShoppingCart.CartItems.Where(I => I.ProductID == productID).FirstOrDefault().ProductOptions.SequenceEqual(productOptions, new ProductOptionComparer())&&
                ShoppingCart.CartItems.Where(I => I.ProductID == productID).FirstOrDefault().CustomFields.SequenceEqual(customFields, new CustomFieldComparer()))
                return true;
            return false;
        }

        public void SetQuantity(int cartItemIndex, int quantity)
        {
            ShoppingCart.CartItems.ElementAt(cartItemIndex).Quantity = quantity;
            ResetItemSubtotal(ShoppingCart.CartItems.ElementAt(cartItemIndex).ProductID);
        }

        public bool IsCartDownloadable()
        {
            if (ShoppingCart.CartItems.Count(I => !I.IsDownloadable) > 0)
                return false;
            return true;
        }

        public bool IsCartFreeShipping()
        {
            if (ShoppingCart.CartCoupons.Count(c => c.CouponTypeID == (int)CouponType.FreeShippingOrder && (c.Amount == 0 || c.Amount >= ShoppingCart.Subtotal )) > 0)
                return true;
            // If all the items have a free shipping coupon, the cart has free shipping
            foreach (CartItem item in ShoppingCart.CartItems)
            {
                if (ShoppingCart.CartCoupons.Count(c => c.ProductID == item.ProductID) == 0
                    || ShoppingCart.CartCoupons.Count(c => c.ProductID == item.ProductID && c.CouponTypeID != (int)CouponType.FreeShippingProduct) > 0)
                    return false;
            }

            return true;
        }

        private void ResetItemSubtotal(int productID)
        {
            var items = ShoppingCart.CartItems.Where(I => I.ProductID == productID);
            foreach (CartItem item in items)
                item.Subtotal = (item.PricePerUnit + item.ProductOptions.Sum(o => o.PriceChange)) * item.Quantity;
        }
    }
}
