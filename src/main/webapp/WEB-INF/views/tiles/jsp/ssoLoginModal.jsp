<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<body>
<!-- ------- LOGIN ------- -->
<!-- Modal -->
<div class="modal fade bs-modal-sm log-sign" id="appModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">SSO Login</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
        	${ssoTargetUrl}
        </form>
      </div>
    </div>
  </div>
</div>
<!-- ------- LOGIN Ends ------- -->
<script src="${pageContext.request.contextPath}/views/js/app.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/views/js/login.js" type="text/javascript"></script>
</body>
