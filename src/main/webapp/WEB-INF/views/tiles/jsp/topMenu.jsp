 <%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!-- <form class="form-group mb-0"> -->
<input type="text" placeholder="Search">
<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse" aria-expanded="false" aria-controls="navbarCollapse">
    <span class="navbar-toggler-icon"></span>
</button>
<!-- </form> -->
<div class="collapse navbar-collapse" id="navbarCollapse">
	<div class="navbar-nav">
        <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link active">Home</a>
        <a href="${pageContext.request.contextPath}/course/java" class="nav-item nav-link">Java</a>
        <a href="${pageContext.request.contextPath}/course/nodejs" class="nav-item nav-link">NodeJS</a>
        <a href="#" class="nav-item nav-link">About</a>
        <a href="#" class="nav-item nav-link">Contact</a>
    </div>
    <div class="navbar-nav ml-auto">
        <c:choose>
			<c:when test="${sessionScope.authuser ne null}">
			 	<div class="nav-item dropdown user-toogle">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.authuser.name}</a>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/loginReg" id="logginRegModalGenerator" data-toggle="modal"class="nav-item nav-link" >Login|Register </a></li>
				<div class="nav-item dropdown user-toogle hide">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
			</c:otherwise>
		</c:choose>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
					    <a class="dropdown-item" href="#">Profile</a>
					    <a class="dropdown-item" href="#">Settings</a>
					    <div class="dropdown-divider"></div>
					  	<a href="<c:url value="/logout"/>"class="dropdown-item">Logout</a>
					</div>
				</div>
	</div>
</div>
  
      
				
