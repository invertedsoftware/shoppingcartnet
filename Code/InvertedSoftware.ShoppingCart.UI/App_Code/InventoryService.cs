using System;
using System.Data.Services;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Web;

using InvertedSoftware.ShoppingCart.DataLayer.Entities;

public class InventoryService : DataService<Entities>
{
    // This method is called only once to initialize service-wide policies.
    public static void InitializeService(IDataServiceConfiguration config)
    {
        // TODO: set rules to indicate which entity sets and service operations are visible, updatable, etc.
        // Examples:
        config.SetEntitySetAccessRule("*", EntitySetRights.AllRead);
        config.SetServiceOperationAccessRule("*", ServiceOperationRights.AllRead);
    }
}
