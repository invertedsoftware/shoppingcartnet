var inventoryChecked = false;

function GetProductStockStatus(ProductID, Quantity) {
    var service = new ShoppingCartnetServices.InventoryService();
    
    // Get the selected options
    var ProductOptions = $("select");
    var options = new Array(0);
    var j = 0;
    for (var i = 0; i < ProductOptions.length; i++) {
        if (ProductOptions[i].id.indexOf("OptionDropDownList") > -1) {
            options[j] = ProductOptions[i].options[ProductOptions[i].selectedIndex].value;
            j++;
        }
    }

    service.GetProductStockStatus(ProductID, options, Quantity, GetProductStockStatusSucceeded, GetProductStockStatusFailed, null);
}

function GetProductStockStatusSucceeded(result, userContext, methodName) {
    //Submit the form or show a message and then submit the form
    inventoryChecked = true;
    if (result == 0) {
        // Cannot sell this product
        $("#messageDiv").html("We are sorry, but, this combination of options is currently not available or has a lower quantity in stock then the amount you specified. Please change the current option selection or quantity.");
        if ($("#facebox").data("overlay") != null) {
            $("#facebox").data("overlay").load();
        } else {
            $("#facebox").overlay({
                top: '20%',
                mask: {
                    color: '#fff',
                    loadSpeed: 200,
                    opacity: 0.5
                },
                closeOnClick: false,
                load: true
            });
        }
        inventoryChecked = false;
    } else if (result == 2) {
        // Pre order
        $("#messageDiv").html("We are sorry, but, this combination of options is currently not available or has a lower quantity in stock then the amount you specified. Your order will be placed in a Pre-Order status and will be fulfilled as soon as this product is back in stock.");
        if ($("#facebox").data("overlay") != null) {
            $("#facebox").data("overlay").load();
        } else {
            $("#facebox").overlay({
                top: '20%',
                mask: {
                    color: '#fff',
                    loadSpeed: 200,
                    opacity: 0.5
                },
                closeOnClick: false,
                load: true,
                onClose: function () {
                    $('#AddButton').click();
                }
            });
        }
      
    } else {
        $('#AddButton').click();
    }
}

function GetProductStockStatusFailed(result, userContext, methodName) {
    alert(result.get_message());
}
