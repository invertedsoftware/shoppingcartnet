using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    [MetadataType(typeof(StoreConfigurationMetadata))]
    public partial class StoreConfiguration
    {
    }

    [ScaffoldTable(false)]
    public class StoreConfigurationMetadata
    {

    }
}
