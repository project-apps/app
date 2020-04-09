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

$('#loginForm').submit(function(e){
	e.preventDefault();
	var formData = {}
	$.each(this, function(i, v){
		var input = $(v);
		formData[input.attr("name")] = input.val();
	});
	$.ajax({
		url: $(this).attr('action'),
		type: $(this).attr('method'),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		data: JSON.stringify(formData),
	}).done(function(data) {
		if(data.status=="OK"){
			loginSuccess(data);
			$('#appModal').modal('hide');
		}else{
			$('#errorSpan').empty().append(data.value).css('visibility','visible');
		}
	}).fail(function(data){
		alert(JSON.stringify(data));
	});
});
var loginSuccess = (userName, source)=>{
	if(source=='social'){
		var opener = window.opener;
		if(opener){
			opener.$('#signinupModal').closest('li').addClass('hide');
			opener.$('.user-toogle').removeClass('hide');
			opener.$('li.user-toogle > a.dropdown-toggle').html(userName);
		}
	}else{
		$('#signinupModal').closest('li').addClass('hide');
		$('.user-toogle').removeClass('hide');
		$('li.user-toogle > a.dropdown-toggle').html(userName);		
	}
	
}

