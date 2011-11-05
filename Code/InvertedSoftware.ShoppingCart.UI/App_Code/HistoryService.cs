using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

using InvertedSoftware.ShoppingCart.Common;
using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.BusinessLayer;

[ServiceContract(Namespace = "ShoppingCartnetServices")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class HistoryService
{
	[WebGet]
	[OperationContract]
	public void AddProductToViewHistory(string ProductID)
	{
		var historyCookie = ExperienceManager.GetHistoryCookie();

		if (!Convert.ToBoolean(historyCookie.Values[Utils.HISTORY_COOKIE_ENABLED]))
			return;

		string products = historyCookie.Values[Utils.HISTORY_COOKIE_DATA];
		if (string.IsNullOrWhiteSpace(products))
			products = ProductID;
		else
		{
			// Add a product to the top of the string
			if (products.IndexOf(ProductID) == -1)
				products = ProductID + "|" + products;
			//  make sure history contains only the last 5 products
			string[] history = products.Split('|');
			if (history.Length > 5)
			{
				Array.Resize(ref history, 5);
				products = String.Join("|", history);
			}
		}
		historyCookie.Values[Utils.HISTORY_COOKIE_DATA] = products;
		HttpContext.Current.Response.Cookies.Add(historyCookie);
	}

	[WebGet]
	[OperationContract]
	public void ChangeHistorySettings(bool HistoryOn)
	{
		var historyCookie = ExperienceManager.GetHistoryCookie();
		historyCookie.Values[Utils.HISTORY_COOKIE_ENABLED] = HistoryOn.ToString();
		HttpContext.Current.Response.Cookies.Add(historyCookie);
	}

	[WebGet]
	[OperationContract]
	public List<ProductDisplay> GetProductHistory()
	{
		WebOperationContext.Current.OutgoingResponse.Headers.Add("Cache-Control", "no-cache");
		var historyCookie = ExperienceManager.GetHistoryCookie();
		string products = historyCookie.Values[Utils.HISTORY_COOKIE_DATA];
	   if (string.IsNullOrWhiteSpace(products))
		   return new List<ProductDisplay>();
	   else
		   return Products.GetProductViewHistory(products.Trim());
	}

}
