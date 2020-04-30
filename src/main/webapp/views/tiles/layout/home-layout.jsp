<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> 
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
"http://www.w3.org/TR/html4/loose.dtd">    
<html lang="en">    
<head>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
<title><tiles:insertAttribute name="title" ignore="true" /></title> 
<link rel="stylesheet" href="<c:url value='/views/bootstrap/4.4.1/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/views/css/app.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">
</head>
<body>
	<div class="jumbotron jumbotron-fluid mb-0">
		<div class="container">
    		<tiles:insertAttribute name="header" />
    	</div>
	</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-3 sticky-top">
		<div class="container-fluid">
			<tiles:insertAttribute name="topMenu" />
		</div>
	</nav> 
	<div class="container-fluid">		
		<div class="wrapper d-flex">
			<div class="container">
				<div id="content">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
	    </div>
    </div>
	<div class="modal-container"></div>  
	 
	<div style="clear:both">
		<tiles:insertAttribute name="footer" />
	</div>    
	   
<div class="alert text-center cookiealert" role="alert">
    <b>Do you like cookies?</b> &#x1F36A; We use cookies to ensure you get the best experience on our website. <a href="https://cookiesandyou.com/" target="_blank">Learn more</a>
    <button type="button" class="btn btn-primary btn-sm acceptcookies" aria-label="Close">
        I agree
    </button>
</div> 	
<script	type="text/javascript" src="<c:url value='/views/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="<c:url value='/views/bootstrap/4.4.1/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/views/js/app.js'/>"></script>
<script type="text/javascript" src="<c:url value='/views/js/login.js'/>"></script>
<script src="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.js"></script>
</body>    
</html>    