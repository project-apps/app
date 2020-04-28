/**
 * 
 */
var popupWindow;
$('.ssoLogin').click(function(e){
	e.preventDefault();
	var _this = $(this);
	$.ajax({
		url:$(this).attr('href'),
	}).done(function(response){
		if(response){
			popupWindow = window.open(response, "popupWindow", "width=600,height=600,scrollbars=yes");
		}
		
	}).fail(function(data){
		console.log(data);
		_this.closest('form').find('.errorSpan').empty().append(data).css('visibility','visible');
	});
	
});
//var _this;
$('#loginForm').submit(function(e){
	e.preventDefault();
	var _this = $(this);
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
		if(data.status=="CREATED"){
			loginSuccess(data);
			$('#loginRegModal').modal('hide');
		}else{
			_this.closest('form').find('.errorSpan').empty().append(data.value).css('visibility','visible');
		}
	}).fail(function(data){
		_this.closest('form').find('.errorSpan').empty().append(JSON.stringify(data)).css('visibility','visible');
	});
});
$('#signupForm').submit(function(e){
	e.preventDefault();
	var _this =$(this);
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
			$('#loginRegModal').modal('hide');
		}else{
			_this.closest('form').find('.errorSpan').empty().append(data.value).css('visibility','visible');
		}
	}).fail(function(data){
		_this.closest('form').find('.errorSpan').empty().append(JSON.stringify(data)).css('visibility','visible');
	});
});
var loginSuccess = (authUserFirstLastName, source)=>{
	if(source=='social'){
		var opener = window.opener;
		if(opener){
			opener.$('.loginRegModal').modal('toggle');
			opener.$('#logginRegModalGenerator').closest('li').addClass('hide');
			opener.$('.user-toogle').removeClass('hide');
			opener.$('div.user-toogle > a.dropdown-toggle').html(authUserFirstLastName);
		}
	}else{
		$('.loginRegModal').modal('toggle');
		$('#logginRegModalGenerator').closest('li').addClass('hide');
		$('.user-toogle').removeClass('hide');
		$('div.user-toogle > a.dropdown-toggle').html(authUserFirstLastName);		
	}
	
}

