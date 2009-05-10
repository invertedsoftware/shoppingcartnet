using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class CustomFieldComparer : IEqualityComparer<CustomField>
    {
        public bool Equals(CustomField x, CustomField y)
        {
            if (Object.ReferenceEquals(x, y))
                return true;

            if (Object.ReferenceEquals(x, null) || Object.ReferenceEquals(y, null))
                return false;

            return x.CustomFieldTypeName == y.CustomFieldTypeName &&
                x.CustomFieldValue == y.CustomFieldValue;
        }

        public int GetHashCode(CustomField customField)
        {
            if (Object.ReferenceEquals(customField, null))
                return 0;

            int hashCustomFieldTypeName = customField.CustomFieldTypeName == null ? 0 : customField.CustomFieldTypeName.GetHashCode();
            int hashCustomFieldID = customField.CustomFieldID.GetHashCode();
            return hashCustomFieldTypeName ^ hashCustomFieldID;
        }
    }
}
