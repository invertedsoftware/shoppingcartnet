// Written by Gal Ratner.
// Inverted Software
// http://www.invertedsoftware.com/tutorials/JAVASCRIPT-Numeric-Paging.html

function showPager(currentPage, pageSize, totalRecords, totalPages){
    var linkToPage = "<a href='" + document.location.pathname + "?Page=";
    var pageParameters = getPageParams();
	var pagerHTML = "";
	
	if(currentPage > 0)
		pagerHTML += linkToPage + "0" + pageParameters + "'>...</a> ";
	
	// Current navigation will dispaly 4 pages before and 4 pages after the current page
	var linksGenerated = 0;
	var lastLinkGenerated = 0;
	for(var i = (currentPage - 4); i < (currentPage + 4); i++){
		if(i < totalPages && i >= 0){ // If the page exist show a link to it	
			
			if(i == currentPage) pagerHTML += "<strong>" + linkToPage + i + pageParameters + "'>" + (i + 1) + "</a></strong> ";
			else pagerHTML += linkToPage + i + pageParameters + "'>" + (i + 1) + "</a> ";
			linksGenerated++;
			lastLinkGenerated = i;
		}

	}
	
	//Complete any missing pages
	for(var i = 1; i <= (9 - linksGenerated); i++){
	    if(lastLinkGenerated < (totalPages - 1)){
	        lastLinkGenerated++;
		    pagerHTML += linkToPage + lastLinkGenerated + pageParameters + "'>" + (lastLinkGenerated + 1) + "</a> ";
		}
	}
	
	if(currentPage < totalPages - 1)
		pagerHTML += linkToPage + (totalPages - 1) + pageParameters +"'>...</a>";

	document.getElementById("PagerDiv").innerHTML = pagerHTML;
}

function getPageParams(){
    var regexPage = new RegExp( "[?&]Page=([^&$]*)");
    var pageParameters = document.location.search.replace(regexPage, "");
    return pageParameters.replace('?', '&');
}