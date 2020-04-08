/**
 * 
 */
var popupWindow;
$('.ssoLogin').click(function(e){
	e.preventDefault();
	$.ajax({
		url:$(this).attr('href'),
	}).done(function(response){
		popupWindow = window.open(response, "popupWindow", "width=600,height=600,scrollbars=yes");
		//$('#modal').empty().html(response);
		$('#appModal').modal('hide');
	}).fail(function(data){
		console.log(data);
		$('#errorSpan').empty().append(data).css('visibility','visible');
	});
	
});
