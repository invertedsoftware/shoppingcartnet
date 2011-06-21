using System;
using System.Runtime.Caching;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using System.Web.Caching;

namespace InvertedSoftware.ShoppingCart.DataLayer.Cache
{
    public static class CacheManager
    {
        const double CacheDuration = 5.0;

        private static object GetCacheItem(string cacheKey)
        {
            return MemoryCache.Default.Get(cacheKey);
        }

        private static void AddCacheItem(string cacheKey, object value)
        {
            MemoryCache.Default.Add(new CacheItem(cacheKey, value), new CacheItemPolicy() { SlidingExpiration = TimeSpan.FromMinutes(10), Priority = System.Runtime.Caching.CacheItemPriority.Default });
        }

        public static ListItemCollection GetCachedLookupTable(LookupDataEnum LookupData)
        {
            return GetCachedLookupTable(LookupData, true);
        }

        public static ListItemCollection GetCachedLookupTable(LookupDataEnum LookupData, bool AddEmptyItem)
        {
            // See if the item is in the cache
            ListItemCollection LookupDataCollection = GetCacheItem(Enum.GetName(typeof(LookupDataEnum), LookupData)) as ListItemCollection;
            if (LookupDataCollection == null)
            {
                // Item not found in cache - retrieve it and insert it into the cache
                LookupDataCollection = LookupTables.GetLookupTable(LookupData, AddEmptyItem);
                AddCacheItem(Enum.GetName(typeof(LookupDataEnum), LookupData), LookupDataCollection);
            }

            return LookupDataCollection;
        }

        public static List<Category> GetCachedCategories()
        {
            // See if the item is in the cache
            List<Category> categories = (List<Category>)GetCacheItem("categories");
            if (categories == null)
            {
                // Item not found in cache - retrieve it and insert it into the cache
                categories = Categories.GetCategories();
                AddCacheItem("categories", categories);
            }

            return categories;
        }

        public static List<Category> GetCachedChildCategories(int? parentCategoryID)
        {
            return GetCachedCategories().Where(c => c.ParentCategoryID == parentCategoryID).ToList();
        }

        public static Product GetProduct(int productID)
        {
            Product product = (Product)GetCacheItem("Product" + productID);
            if (product == null)
            {
                product = Products.GetProduct(productID);
                AddCacheItem("Product" + productID, product);
            }
            return product;
        }

        public static List<ProductOption> GetProductOptions(int productID)
        {
            List<ProductOption> productOptions = (List<ProductOption>)GetCacheItem("productOptions" + productID);
            if (productOptions == null)
            {
                productOptions = Products.GetProductOptions(productID);
                AddCacheItem("productOptions" + productID, productOptions);
            }
            return productOptions;
        }
    }
}
