<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
	<head>
	<style>
.dropdown:hover .dropdown-menu {
  display: block;
}
</style>
	</head>
<!-- Header -->
	<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/app/home" style="font-size: 22px;">
				<span class="label label-success">My Application</span></a>
			</div>
			<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
				<form class="navbar-form navbar-right" role="search" action="search" method="GET">
					<div class="form-group">
						<input type="text" name="s" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
<ul id="nav" class="nav navbar-nav nav-pills clearfix right" role="tablist">
<c:choose>
	<c:when test="${sessionScope.user ne null}">
    <li class="dropdown user-toogle"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
    	${sessionScope.user.name}</a>
	<ul id="products-menu" class="dropdown-menu clearfix" role="menu">
            <li><a href="">Profile</a></li>
            <li><a href="<c:url value="/user/logout"  />">Logout</a></li>
        </ul>
    </li>
	</c:when>
	<c:otherwise>
    <li><a href="${pageContext.request.contextPath}/user/signinup" id="signinupModal" data-toggle="modal" data-target=".log-sign">SignIn|SignUp</a></li>
   <!-- <button class="btn btn-primary btn-lg" href="#signup" data-toggle="modal" data-target=".log-sign">Sign In/Register</button> -->
    <li class="dropdown user-toogle hide"><a href="#" class="dropdown-toggle" data-toggle="dropdown"></a>
	<ul id="products-menu" class="dropdown-menu clearfix" role="menu">
            <li><a href="">Profile</a></li>
            <li><a href="<c:url value="/user/logout"  />">Logout</a></li>
        </ul>
    </li>
	</c:otherwise>
</c:choose>
</ul>
							
				<ul class="nav navbar-nav">
					<li><a href="https://w3lessons.info/about">About</a></li>
					<li><a href="https://w3lessons.info/contact">Contact</a></li>
				</ul>
			</nav>
		</div>
	</header>
	</html>
	