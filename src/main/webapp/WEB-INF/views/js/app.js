if (!jQuery) {throw new TypeError("jQuery is required.");};
(function ($, window, document, undefined) {
	'use strict';

	/*$('#loginModal').click(function(e){
		e.preventDefault();
		$.ajax({
			url:$(this).attr('href'),
		}).done(function(response){
			$('#modal').empty().html(response);
			$('#appModal').modal('show');
		});
	});
*/
	$('#signinupModal').click(function(e){
		e.preventDefault();
		$.ajax({
			url:$(this).attr('href'),
		}).done(function(response){
			$('#modal').empty().html(response);
			$('#appModal').modal('show');
		}).fail(function(data){
			console.log(data);
		});
	});

/*	$('#loginForm').submit(function(e){
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
	*/
})(jQuery, window, document);

$(window, document, undefined).ready(function() {

	  $('.input').blur(function() {
	    var $this = $(this);
	    if ($this.val())
	      $this.addClass('used');
	    else
	      $this.removeClass('used');
	  });
	  
	});
$('#login').on('click' , function(){
    $('#tab1').addClass('login-shadow');
   $('#tab2').removeClass('signup-shadow');
});

$('#tab2').on('click' , function(){
    $('#tab2').addClass('signup-shadow');
   $('#tab1').removeClass('login-shadow');


});


