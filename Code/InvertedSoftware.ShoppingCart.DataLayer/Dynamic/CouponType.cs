using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    [MetadataType(typeof(CouponTypeMetadata))]
    public partial class CouponType
    {
    }

    [ReadOnly(true)]
    public class CouponTypeMetadata
    {

    }
  
}
