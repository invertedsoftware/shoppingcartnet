using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

using InvertedSoftware.ShoppingCart.Common;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public static class ExperienceManager
    {
        /// <summary>
        /// Get or create a history cookie
        /// </summary>
        /// <returns></returns>
        public static HttpCookie GetHistoryCookie()
        {
            var historyCookie = HttpContext.Current.Request.Cookies[Utils.HISTORY_COOKIE_NAME];
            if (historyCookie == null)
            {
                historyCookie = new HttpCookie(Utils.HISTORY_COOKIE_NAME)
                {
                    Expires = DateTime.Now.AddMonths(1)
                };
                historyCookie.Values[Utils.HISTORY_COOKIE_ENABLED] = true.ToString();
            }
            return historyCookie;
        }
    }
}
