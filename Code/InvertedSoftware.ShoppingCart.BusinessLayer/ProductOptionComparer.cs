using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class ProductOptionComparer : IEqualityComparer<ProductOption>
    {
        public bool Equals(ProductOption x, ProductOption y)
        {
            if (Object.ReferenceEquals(x, y))
                return true;

            if (Object.ReferenceEquals(x, null) || Object.ReferenceEquals(y, null))
                return false;

            return x.ProductOptionName == y.ProductOptionName && 
                x.ProductOptionGroup == y.ProductOptionGroup &&
                x.ProductOptionID == y.ProductOptionID;
        }

        public int GetHashCode(ProductOption productOption)
        {
            if (Object.ReferenceEquals(productOption, null))
                return 0;

            int hashProductOptionName = productOption.ProductOptionName == null ? 0 : productOption.ProductOptionName.GetHashCode();
            int hashProductOptionID = productOption.ProductOptionID.GetHashCode();
            return hashProductOptionName ^ hashProductOptionID;
        }
    }
}
