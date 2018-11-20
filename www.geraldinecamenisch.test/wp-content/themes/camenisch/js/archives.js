function deep_archive_search(){

	var dateArray = $("#month-choice").val().split("/");
	var search_term = ['projects','dev.deep.ch'];

	for(var k=0;k<2;k++){
		for (var i=dateArray.length-1; i>=0; i--) {
		    if (dateArray[i] === search_term[k]) {
		        dateArray.splice(i, 1);
		        break;       //<-- Uncomment  if only the first term has to be removed
		    }
		}
	}

	var data = {
		'action': 'deep_archive_search',
		'dateArray': dateArray,
		'year': dateArray[4],
		'month': dateArray[5]
	};

	$.post(scripts_data.ajaxurl, data, function(response){
		response = jQuery.parseJSON(response);
		$('#archives-table').html(response.archive_result);
	});
	$('select[name=""]').change(function(){
		deep_archive_search();
	});
}



$(document).ready(function(){

	$('select#month-choice').change(function() {
		deep_archive_search();
		console.log("month changed");
	});
});
