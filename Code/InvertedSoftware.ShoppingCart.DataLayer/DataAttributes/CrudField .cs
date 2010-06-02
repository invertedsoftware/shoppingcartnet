using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataAttributes
{
    [Flags]
    public enum CrudFieldType
    {
        Create = 0x0,
        Read = 0x1,
        Update = 0x2,
        Delete = 0x4,
        DontUse = 0x8,
        All = 0x10
    }

    public class CrudField : Attribute
    {
        public CrudFieldType UsedFor { get; set; }
    }
}
