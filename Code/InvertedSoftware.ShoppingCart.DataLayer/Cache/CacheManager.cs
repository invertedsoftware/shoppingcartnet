using System;
using System.Web;
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
            return HttpRuntime.Cache[cacheKey];
        }

        private static void AddCacheItem(string cacheKey, object value)
        {
            HttpRuntime.Cache.Insert(cacheKey, value, null, DateTime.Now.AddMinutes(CacheDuration), TimeSpan.Zero, CacheItemPriority.Normal, null);
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

        public static ListItemCollection GetCachedCategories(int? parentCategoryID)
        {
            // See if the item is in the cache
            ListItemCollection categoryCollection = GetCacheItem("categories-parent" + parentCategoryID) as ListItemCollection;
            if (categoryCollection == null)
            {
                // Item not found in cache - retrieve it and insert it into the cache
                categoryCollection = Categories.GetCategories(parentCategoryID, true);
                AddCacheItem("categories-parent" + parentCategoryID, categoryCollection);
            }

            return categoryCollection;
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
