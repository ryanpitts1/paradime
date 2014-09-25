// This is a complete hack to get the geocoder params to stick with the ransack sort_link.
// This will need to be "unhacked" down the road when a better solution is found.

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

$(document).ready(function(){
	if (getUrlVars()["location"] && getUrlVars()["within"]){
		var location = getUrlVars()["location"];
		var within = getUrlVars()["within"];
		
		$('.search-sort-by > a').each(function(){
			var link = $(this).attr('href');
			link = link+'&location='+location+'&within='+within;
			$(this).attr('href',link);
		});
	}
});