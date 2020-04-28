<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> 
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>    
    
<div class="modal fade loginRegModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog cascading-modal" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	       <!--  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		<div class="modal-body">
			<ul class="nav nav-tabs">
			    <li class="nav-item">
			      <a class="nav-link active" href="#login">Login</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#signup">Register</a>
			    </li>
			</ul>
	<!-- Tab panes -->
			<div class="tab-content">
				<div id="login" class="container tab-pane active"><br>
					<form name="loginForm" id="loginForm" action="login" method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="email">Email address:</label> 
							<input type="text"  name="username" class="form-control" placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label> 
							<input type="password" name="password" class="form-control" placeholder="Enter password">
							<div class="forgot-link">
								<a href="#forgot" data-toggle="modal" data-target="#forgot-password"> Forgot password</a>
							</div>
						</div>
						
						<div class="form-group form-check">
							<label class="form-check-label"> 
							<input class="form-check-input" type="checkbox"> Remember me
							</label>
						</div>
						<button type="submit" class="btn btn-primary btn-block">Login</button>
					</form>
				</div>
			    <div id="signup" class="container tab-pane fade"><br>
					<form name="signupForm" id="signupForm" action="user" method="POST" class="form-horizontal">
						<div class="form-row">
						<div class="form-group col-md-6">
							<label for="firstName">First Name:</label> 
							<input type="text" class="form-control" placeholder="First Name" name="firstName">
						</div>
						<div class="form-group col-md-6">
							<label for="lastName">Last Name:</label> 
							<input type="text" class="form-control" placeholder="Last Name" name="lastName">
						</div>
						</div>
						<div class="form-group">
							<label for="email">Email address:</label> 
							<input type="email" class="form-control" placeholder="Enter email" name="email">
						</div>
						<div class="form-row">
						<div class="form-group col-md-6">
							<label for="pwd">Password:</label> 
							<input type="password" class="form-control" placeholder="Enter password" name="password">
						</div>
						<div class="form-group col-md-6">
							<label for="pwd">Confirm Password:</label> 
							<input type="password" class="form-control" placeholder="Confirm password" id="cnfpwd">
						</div>
						</div>
						<button type="submit" class="btn btn-primary btn-block">Submit</button>
					</form>
			    </div>
			 </div>
	      </div>
	     <div class="modal-footer align-self-center">
            <a href="${contextpath}/auth/login/facebook" class="ssoLogin"><i class="fa fa-facebook"></i></a> 
            <a href="${contextpath}/auth/login/google" class="ssoLogin"><i class="fa fa-google-plus"></i></a> 
            <a href="${contextpath}/auth/login/twitter" class="ssoLogin"><i class="fa fa-twitter"></i></a>
            <a href="${contextpath}/auth/login/github" class="ssoLogin"><i class="fa fa-github"></i></a> 
	      </div>
	    </div>
  </div>
</div>

<!-- <div class="modal fade" id="forgot-password" tabindex="0" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
	<div class="modal-dialog cascading-modal" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	       <h5 class="modal-title" id="exampleModalLabel">Password will be sent to your email</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		<div class="modal-body">
			<form class="form-horizontal">
        	<fieldset>
        		<div class="group">
<input required="required" class="input" type="text"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Email address</label></div>
        		<div class="control-group">
<label class="control-label" for="forpassword"></label>
              	<div class="controls">
<button id="forpasswodr" name="forpassword" class="btn btn-primary btn-block">Send</button>
              	</div>
            </div>
          </fieldset>
		</form>
	    </div>
	    </div>
  	</div>
</div> -->
<script src="${contextpath}/views/js/login.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>