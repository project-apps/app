/**
 * 
 */
$('.ssoLogin').click(function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).attr('href'),
			type: 'get',
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
	
	var loginSuccess = (data)=>{
		$('#loginModal').closest('li').addClass('hide');
		$('.user-toogle').removeClass('hide');
		$('li.user-toogle > a.dropdown-toggle').html(data.value.firstName+'&nbsp'+data.value.lastName);
	}