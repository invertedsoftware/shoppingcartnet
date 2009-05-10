using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    [MetadataType(typeof(OrderStatusMetadata))]
    public partial
    class OrderStatus
    {
    }

    [ScaffoldTable(false)]
    public class OrderStatusMetadata
    {

    }
}
