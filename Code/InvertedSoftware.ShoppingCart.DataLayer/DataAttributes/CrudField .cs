using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataAttributes
{
    [Flags]
    public enum CrudFieldType
    {
        Create = 0,
        Read = 2,
        Update = 4,
        Delete = 8,
        DontUse = 16
    }

    public class CrudField : Attribute
    {
        public CrudFieldType UsedFor { get; set; }
    }
}
