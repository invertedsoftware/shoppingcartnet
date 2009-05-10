using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InvertedSoftware.ShoppingCart.DataLayer.DataObjects
{
    public class CustomField
    {
        public int CustomFieldID {get;set;}
		public int ProductID {get;set;}
		public string CustomFieldName {get;set;}
        public string CustomFieldValue { get; set; }
		public string CustomFieldTypeName {get;set;}
		public bool IsRequired {get;set;}
        public bool Active { get; set; }
    }
}
