using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Linq;
using System.Text;


using InvertedSoftware.ShoppingCart.DataLayer.Database;
using InvertedSoftware.ShoppingCart.DataLayer.Cache;

namespace InvertedSoftware.ShoppingCart.BusinessLayer.Controls
{
    public class LookupDataDropDownList : DropDownList
    {
        private LookupDataEnum lookupType;

        protected override void OnLoad(EventArgs e)
        {
            if (!this.Page.IsPostBack) DataBind();
            base.OnLoad(e);
        }

        public override void DataBind()
        {
            if (LookupType == LookupDataEnum.NoBinding)
            {
                this.DataSource = null;
                return;
            }

            CacheManager cache = new CacheManager();
            try
            {
                this.DataSource = cache.GetCachedLookupTable(LookupType);
                this.DataTextField = "Text";
                this.DataValueField = "Value";

            }
            catch (Exception e)
            {
                this.Items.Add(new ListItem("Error Getting Data..."));
            }

            try
            {
                base.DataBind();
            }
            catch (Exception e)
            {

            }


        }


        public LookupDataEnum LookupType
        {
            get { return lookupType; }
            set { lookupType = value; }
        }
    }
}
