<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> 
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<body>
<!-- ------- LOGIN ------- -->
<!-- Modal -->
<div class="modal fade bs-modal-sm log-sign" id="signinupModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	  <!--   <div class="modal-header">
<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	     </div> -->
    	<div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li id="tab1" class=" active tab-style login-shadow "><a href="#signin" data-toggle="tab">Log In</a></li>
              <li id="tab2" class=" tab-style "><a href="#signup" data-toggle="tab">Sign Up</a></li>
            </ul>
        </div>
      <div class="modal-body">
		<div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="signin">
            <form name="loginForm" id="loginForm" action="login" method="POST" class="form-horizontal">
<span class="errorSpan" style="color: red; visibility: hidden;" ></span>
            <fieldset>
               <div class="group">
<input required="required" class="input" type="text" name="username"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Email address</label></div>
            <!-- Password input-->
            <div class="group">
<input required="required" class="input" type="password" name="password"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Password</label>
    		</div>
<em>minimum 6 characters</em>
		<div class="forgot-link">
			<a href="#forgot" data-toggle="modal" data-target="#forgot-password"> I forgot my password</a>
		</div>
		<div class="control-group">
			<label class="control-label" for="signin"></label>
			<div class="controls">
				<button id="signin" name="signin" class="btn btn-primary btn-block">Log In</button>
			</div>
		</div>
		</fieldset>
		</form>
        </div>
<!-- ------- SINGUP ------- -->
		<div class="tab-pane fade" id="signup">
			<form name="signupForm" id="signupForm" action="user" method="POST" class="form-horizontal">
<span class="errorSpan" style="color: red; visibility: hidden;" ></span>
            	<fieldset>
            		<div class="group">
<input required="required" class="input" type="text" name="firstName"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">First Name</label>
    				</div>
      				<div class="group">
<input required="required" class="input" type="text" name="lastName"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Last Name</label></div>
            		<div class="group">
<input required="required" class="input" type="text" name="email"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Email</label></div>
            		<div class="group">
<input required="required" class="input" type="password" name="password"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Password</label></div>
    <em>1-8 Characters</em>
    				<div class="group">
<input required="required" class="input" type="password"><span class="highlight"></span><span class="bar"></span>
    <label class="label" for="date">Confirm Password</label></div>
            		<div class="control-group">
<label class="control-label" for="confirmsignup"></label>
						<div class="controls">
<button id="confirmsignup" name="confirmsignup" class="btn btn-primary btn-block">Sign Up</button>
              			</div>
            		</div>
            </fieldset>
          </form>
<div class="social-line"> 
            <a href="${contextpath}/login/oauth2/facebook" class="ssoLogin"><i class="fa fa-facebook"></i></a> 
            <a href="${contextpath}/login/oauth2/google" class="ssoLogin"><i class="fa fa-google-plus"></i></a> 
            <a href="${contextpath}/login/oauth2/twitter" class="ssoLogin"><i class="fa fa-twitter"></i></a>
            <a href="${contextpath}/login/oauth2/github" class="ssoLogin" data-toggle="modal"><i class="fa fa-github"></i></a> 
</div>
      </div>
    </div>
      </div>
      <!--<div class="modal-footer">
      <center>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </center>
      </div>-->
    </div>
  </div>
</div>
<!--modal2-->
<div class="modal fade bs-modal-sm" id="forgot-password" tabindex="0" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Password will be sent to your email</h4>
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
</div>
<!-- ------- LOGIN Ends ------- -->
<script src="${contextpath}/views/js/app.js" type="text/javascript"></script>
<script src="${contextpath}/views/js/login.js" type="text/javascript"></script>
</body>
