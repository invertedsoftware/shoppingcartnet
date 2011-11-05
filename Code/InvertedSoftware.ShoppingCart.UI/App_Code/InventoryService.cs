using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.DataLayer.Database;

[ServiceContract(Namespace = "ShoppingCartnetServices")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
[ServiceBehavior(IncludeExceptionDetailInFaults = true)]
public class InventoryService
{
	/// <summary>
	/// This will return 1 if the product is in stock and can be sold.
	/// 0 if the product is not in an inventory level that is equal or larger than the requested quantity and can not be sold.
	/// 2 if this order will be a pre order
	/// </summary>
	/// <param name="ProductID"></param>
	/// <param name="ProductOptions"></param>
	/// <returns></returns>
	[WebGet]
	[OperationContract]
	public int GetProductStockStatus(int ProductID, object[] ProductOptions, int Quantity)
	{
		WebOperationContext.Current.OutgoingResponse.Headers.Add("Cache-Control", "no-cache");

		int productStockStatus = 1;
		List<int> productOptions = new List<int>();
		Array.ForEach(ProductOptions, (o) => productOptions.Add(Convert.ToInt32(o)));

		InvertedSoftware.ShoppingCart.DataLayer.DataObjects.Inventory inventory = InvertedSoftware.ShoppingCart.DataLayer.Database.Inventory.GetProductInventory(ProductID, productOptions);
		InventoryAction inventoryAction;
		Enum.TryParse(inventory.InventoryActionID.ToString(), out inventoryAction);

		switch (inventoryAction)
		{
			case InventoryAction.StopSellingOption:
				if (inventory.ProductAmountInStock < Quantity)
					productStockStatus = 0;
				break;
			case InventoryAction.StopSellingProduct:
				if (inventory.ProductAmountInStock < Quantity)
					productStockStatus = 0;
				break;
			case InventoryAction.ShowPreOrderOption:
				if (inventory.ProductAmountInStock < Quantity)
					productStockStatus = 2;
				break;
			case InventoryAction.ShowPreOrderProduct:
				if (inventory.ProductAmountInStock < Quantity)
					productStockStatus = 2;
				break;
			default:
				productStockStatus = 1;
				break;
		}

		return productStockStatus;
	}
}
