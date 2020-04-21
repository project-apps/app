<%@ page session="true"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
		<h5>
			<a href="index.html" class="logo">${menu}</a>
		</h5>
		<hr/>
		
	
		<ul class="nav submenu-toogle flex-column overflow-auto">
		  <!-- <li class="nav-item">
		      <a class="nav-link" href="#">Link-1</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link-2</a>
		      <ul>
		      	<li><a class="nav-link" href="#">Link-2.1</a></li>
		      	<li><a class="nav-link" href="#">Link-2.2</a></li>
		      </ul>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link-3</a>
		      <ul>
		      	<li><a class="nav-link" href="#">Link-3.1</a></li>
		      	<li>
		      		<a class="nav-link" href="#">Link-3.2</a>
		      		<ul>
		      			<li><a class="nav-link" href="#">Link-3.2.1</a></li>
		      			<li><a class="nav-link" href="#">Link-3.2.2</a></li>		
		      		</ul>
		      	</li>
		      </ul>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link disabled" href="#">Disabled</a>
		    </li> -->
	  </ul>

<!-- 		<div class="mb-5">
			<h3 class="h6 mb-3">Subscribe for newsletter</h3>
			<form action="#" class="subscribe-form">
				<div class="form-group d-flex">
					<div class="icon">
						<span class="icon-paper-plane"></span>
					</div>
					<input type="text" class="form-control"
						placeholder="Enter Email Address">
				</div>
			</form>
		</div> -->

<!-- 		<div class="footer">
			<p>
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
				Copyright &copy;
				<script>document.write(new Date().getFullYear());</script>
				All rights reserved | This template is made with <i
					class="icon-heart" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank">Colorlib.com</a>
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
			</p>
		</div> -->
<script	src="${pageContext.request.contextPath}/views/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: '<c:url value="${menuUri}"/>',
		}).done(function(data) {
			if(data){
				var children = data.children;
				for(var i=0; i< children.length; i++){
					var row = children[i];
					var obj =  '<li class="nav-item"><a class="nav-link" href="#">'+JSON.stringify(row)+'</a></li>';
					$('ul.submenu-toogle').append(obj);	
				}
			}else{
			}
		}).fail(function(data){
		});
	});
	function parseSubMenu(data){
		var children = data.children;
		for(var i=0; i< children.length; i++){
			var row = children[i];
		}
	}
</script>

