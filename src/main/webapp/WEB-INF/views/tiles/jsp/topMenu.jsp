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
                <a href="#" class="nav-item nav-link active">Home</a>
                <a href="#" class="nav-item nav-link">Services</a>
                <a href="#" class="nav-item nav-link">About</a>
                <a href="#" class="nav-item nav-link">Contact</a>
            </div>
            <div class="navbar-nav ml-auto">
                <c:choose>
					<c:when test="${sessionScope.authuser ne null}">
					    <li class="nav-item dropdown">
		                    <a href="#" class="nav-link dropdown-toggle"  data-toggle="dropdown"><span class="fa fa-user"/></a>
		                    <div class="dropdown-menu dropdown-menu-right">
		                        <a href="#" class="dropdown-item">${sessionScope.authuser.name}</a>
		                        <a href="#" class="dropdown-item">Profile</a>
		                        <div class="dropdown-divider"></div>
		                        <a href="<c:url value="/logout"/>"class="dropdown-item">Logout</a>
		                    </div>
		                </li>
					</c:when>
					<c:otherwise>
					 	<li><a href="${pageContext.request.contextPath}/user/loginReg" id="logginRegModalGenerator" data-toggle="modal"class="nav-item nav-link" >Login|Register </a></li>
					    
						<li class="nav-item dropdown hide">
		                    <a href="#" class="nav-link dropdown-toggle"  data-toggle="dropdown"><span class="fa fa-user"/></a>
		                    <div class="dropdown-menu dropdown-menu-right">
		                        <a href="#" class="dropdown-item">Rajan Mishra</a>
		                        <a href="#" class="dropdown-item">Profile</a>
		                        <div class="dropdown-divider"></div>
		                        <a href="<c:url value="/logout"/>"class="dropdown-item">Logout</a>
		                    </div>
		                </li>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
	  
       
					
