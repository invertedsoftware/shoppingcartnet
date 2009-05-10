﻿using System;
using System.Text;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.DataObjects;
using InvertedSoftware.ShoppingCart.BusinessLayer;
using InvertedSoftware.ShoppingCart.BusinessLayer.Controls;

public partial class ShoppingCart : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindCart();
            GoogleCheckoutControl1.Visible = Convert.ToBoolean(ConfigurationManager.AppSettings["GoogleCheckoutEnabled"]);
        }
    }

    public void BindCart()
    {
        MessageLiteral.Text = "Your Cart";
        CartRepeater.DataSource = this.Cart.CartItems;
        CartRepeater.DataBind();
        CartManager manager = new CartManager(this.Cart);
        this.Cart.Subtotal = manager.SubTotal;
        this.Cart.Total = manager.Total;
        if (this.Cart.CartItems.Count == 0)
        {
            MessageLiteral.Text += " is Empty";
            CheckoutButton.Enabled = false;
            UpdateButton.Enabled = false;
        }
        else
        {
            CheckoutButton.Enabled = true;
            UpdateButton.Enabled = true;
        }
    }

    protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        CartManager manager = new CartManager(this.Cart);
        manager.Remove(e.Item.ItemIndex);
        this.Cart = manager.ShoppingCart;
        BindCart();

    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        CartManager manager = new CartManager(this.Cart);
        foreach (RepeaterItem item in CartRepeater.Items)
        {
            int qty = 0;
            if (int.TryParse(((TextBox)item.FindControl("QuantityTextBox")).Text, out qty))
                manager.SetQuantity(item.ItemIndex, qty);
            else
                manager.Remove(item.ItemIndex);
        }
        this.Cart = manager.ShoppingCart;
        BindCart();
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void CheckoutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx");
    }

    public string GetProductOptions(int itemIndex)
    {
        StringBuilder sb = new StringBuilder();
        CartItem item = this.Cart.CartItems.ElementAt(itemIndex);
        foreach (ProductOption option in item.ProductOptions)
            sb.Append("<br>" + option.ProductOptionName);
        return sb.ToString();
    }

    public string GetCustomFields(int itemIndex)
    {
        StringBuilder sb = new StringBuilder();
        CartItem item = this.Cart.CartItems.ElementAt(itemIndex);
        foreach (CustomField field in item.CustomFields)
            sb.Append("<br>" + field.CustomFieldName + ": " + field.CustomFieldValue);
        return sb.ToString();
    }
}
