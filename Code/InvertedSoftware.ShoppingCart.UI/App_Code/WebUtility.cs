using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

using InvertedSoftware.ShoppingCart.Common;

/// <summary>
/// Summary description for WebUtility
/// </summary>
public class WebUtility
{
    public static string InputText(string text, int maxLength)
    {
        text = text.Trim();
        if (string.IsNullOrEmpty(text))
            return string.Empty;
        if (text.Length > maxLength)
            text = text.Substring(0, maxLength);
        text = Regex.Replace(text, "[\\s]{2,}", " ");	//two or more spaces
        text = Regex.Replace(text, "(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "\n");	//<br>
        text = Regex.Replace(text, "(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ");	//&nbsp;
        text = Regex.Replace(text, "<(.|\\n)*?>", string.Empty);	//any other tags
        text = text.Replace("'", "''");
        return text;
    }

    public static int LoadInt32FromQueryString(string queryStringKey)
    {
        int queryStringValue = -1;
        if (!string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[queryStringKey]))
        {
            if (!int.TryParse(HttpContext.Current.Request.QueryString[queryStringKey], out queryStringValue))
            {
                queryStringValue = -1;
            }
        }
        return queryStringValue;
    }

    public static int LoadInt32FromPostString(string queryStringKey)
    {
        int queryStringValue = -1;
        if (!string.IsNullOrEmpty(HttpContext.Current.Request.Form[queryStringKey]))
        {
            if (!int.TryParse(HttpContext.Current.Request.Form[queryStringKey], out queryStringValue))
            {
                queryStringValue = -1;
            }
        }
        return queryStringValue;
    }

    public static string LoadStringFromQueryString(string queryStringKey, int maxLength, bool filter)
    {
        string queryString = string.Empty;
        if (!string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[queryStringKey]))
        {
            queryString = HttpContext.Current.Request.QueryString[queryStringKey];
            if (filter) queryString = InputText(queryString, maxLength);
        }
        return queryString;
    }

    public static string EncodeParamForQueryString(string paramToEncode)
    {
        return HttpUtility.UrlEncode(Utils.GetEncodedString(paramToEncode));
    }

    public static int GetDecodedIntFromQueryString(string queryStringKey)
    {
        return Utils.GetDecodedInt(HttpContext.Current.Request.QueryString[queryStringKey]);
    }
}
