Shadowbox.init();

$(document).ready(function(){
	$(".gallery a").attr("rel","shadowbox[gallery]");
	sorttable.init();
	if(document.getElementById('period-head')){
		sorttable.innerSortFunction.apply(document.getElementById('period-head'), []); 
	}
	$('#container').masonry('reloadItems');
                    

});

$(".accordion-toggle").click(function(){
	$('#container').masonry('reloadItems');
});

$( "table" ).wrap( "<div class='table-responsive'></div>" );


$(function () {

    $('.footable').footable();
});

$.fn.redraw = function() {
    return this.hide(0, function(){$(this).show()});
};
$(document).ready(function() {
    $('body').redraw();
    $('header').redraw();
});