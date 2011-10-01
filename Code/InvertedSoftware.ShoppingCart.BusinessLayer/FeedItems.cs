using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel.Syndication;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.Common;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class FeedItems
    {
        public SyndicationFeed GetCategoryProducts(int categoryID)
        {
            SyndicationFeed feed = new SyndicationFeed("Category Products", "Category Products", new Uri(StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL)), string.Empty, DateTime.Now);
            List<SyndicationItem> items = new List<SyndicationItem>();
            Products products = new Products();
            List<Product> productList = products.GetProducts(categoryID, 0, 500);

            foreach (Product product in productList)
            {
                SyndicationItem item = new SyndicationItem(product.ProductName, product.Description, new Uri(StoreConfiguration.GetConfigurationValue(ConfigurationKey.StoreURL) + "/Product.aspx?Product=" + product.ProductName), string.Empty, DateTime.Now);
                items.Add(item);
            }

            feed.Items = items;
            return feed;
        }
    }
}
