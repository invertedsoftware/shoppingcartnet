using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    [MetadataType(typeof(CustomFieldTypeMetadata))]
    public partial class CustomFieldType
    {
    }

    [ReadOnly(true)]
    public class CustomFieldTypeMetadata
    {

    }

}
