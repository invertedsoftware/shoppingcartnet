using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.Database;

namespace InvertedSoftware.ShoppingCart.DataLayer.Cache
{
    public class CacheManager
    {
        const double CacheDuration = 5.0;

        private object GetCacheItem(string cacheKey)
        {
            return HttpRuntime.Cache[cacheKey];
        }

        private void AddCacheItem(string cacheKey, object value)
        {
            System.Web.Caching.Cache DataCache = HttpRuntime.Cache;
            DataCache.Insert(cacheKey, value, null, DateTime.Now.AddMinutes(CacheDuration), TimeSpan.Zero);
        }

        public ListItemCollection GetCachedLookupTable(LookupDataEnum LookupData)
        {
            // See if the item is in the cache
            ListItemCollection LookupDataCollection = GetCacheItem(Enum.GetName(typeof(LookupDataEnum), LookupData)) as ListItemCollection;
            if (LookupDataCollection == null)
            {
                // Item not found in cache - retrieve it and insert it into the cache
                LookupDataCollection = LookupTables.GetLookupTable(LookupData, true);
                AddCacheItem(Enum.GetName(typeof(LookupDataEnum), LookupData), LookupDataCollection);
            }

            return LookupDataCollection;
        }

        public ListItemCollection GetCachedCategories(int? parentCategoryID)
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
    }
}
