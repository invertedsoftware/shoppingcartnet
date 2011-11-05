function GetProductHistory() {
    var service = new ShoppingCartnetServices.HistoryService();
    service.GetProductHistory(GetProductHistorySucceeded, GetProductHistoryFailed, null);
}

function GetProductHistorySucceeded(result, userContext, methodName) {
    if (result.length == 0 || result.length == undefined)
        return;
    var historyHTML = "";
    for (var i = 0; i < result.length; i++) {
        historyHTML += "<div style='display:inline'><div style='display:inline'><a href='Product.aspx?Product=" + escape(result[i].ProductName) + "'><img src='ProductImages/" + result[i].Thumbnail + "' alt='" + result[i].ProductName + "' style='border-style:none' width='75' height='75' /></a></div></div>";
    }
    $("#viewHistory").html(historyHTML);
}

function GetProductHistoryFailed(result, userContext, methodName) {
    alert(result.get_message());
}

function AddProductToViewHistory(product) {
    var service = new ShoppingCartnetServices.HistoryService();
    service.AddProductToViewHistory(product);
}

function ChangeHistorySettings(historyOn) {
    var service = new ShoppingCartnetServices.HistoryService();
    service.ChangeHistorySettings(historyOn);
}
