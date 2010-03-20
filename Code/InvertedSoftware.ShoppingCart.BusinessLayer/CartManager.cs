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
                return ShoppingCart.CartItems.Sum(I => I.Subtotal);
            }
        }

        public decimal Total
        {
            get
            {
                if (ShoppingCart == null || ShoppingCart.CartItems == null)
                    return 0;
                return SubTotal + ShoppingCart.Shipping + ShoppingCart.Tax;
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
                // Apply any discounts here
            }
            else
            {
                Product product = Products.GetProduct(productID);
                CartItem cartItem = new CartItem() { ProductID = productID, PricePerUnit = product.price, ProductName = product.ProductName, CatalogNumber = product.CatalogNumber, Quantity = 1, Subtotal = product.price };//Get from data layer
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

        private void ResetItemSubtotal(int productID)
        {
            var items = ShoppingCart.CartItems.Where(I => I.ProductID == productID);
            foreach (CartItem item in items)
                item.Subtotal = (item.PricePerUnit + item.ProductOptions.Sum(o => o.PriceChange)) * item.Quantity;
        }
    }
}
