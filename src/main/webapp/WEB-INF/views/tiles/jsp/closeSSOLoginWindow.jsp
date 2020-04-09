<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="${pageContext.request.contextPath}/views/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/views/js/login.js" type="text/javascript"></script>
<script type="text/javascript">
var authUserFrstLastName = "<c:out value='${authUserFrstLastName}'/>";
loginSuccess(authUserFrstLastName, 'social');
window.close();
</script>
</head>
<body>
</body>
</html>