using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataAttributes
{
    [Flags]
    public enum CrudFieldType
    {
        Create = 0x1,
        Read = 0x2,
        Update = 0x4,
        Delete = 0x8,
        DontUse = 0x10,
        All = 0x20
    }

    public class CrudField : Attribute
    {
        public CrudFieldType UsedFor { get; set; }
    }
}
