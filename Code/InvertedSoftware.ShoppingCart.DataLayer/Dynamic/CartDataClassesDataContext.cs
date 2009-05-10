using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.Dynamic
{
    public partial class CartDataClassesDataContext : System.Data.Linq.DataContext
    {
        public CartDataClassesDataContext() :
            base(ConfigurationManager.ConnectionStrings["StringConnection"].ConnectionString)
        {
            OnCreated();
        }
    }
}
