<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="${contextpath}/views/js/jquery-3.4.1.min.js"></script>
<script src="${contextpath}/views/js/login.js" type="text/javascript"></script>
<script type="text/javascript">
var authUserFirstLastName = "<c:out value='${authUserFirstLastName}'/>";
loginSuccess(authUserFirstLastName, 'social');
window.close();
</script>
</head>
<body>
</body>
</html>