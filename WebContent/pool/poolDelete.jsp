<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수영장 정보";
	request.setAttribute("pageName", pageName);
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");

	if (userId == null || !userId.equals("admin")) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	String poolNum = request.getParameter("poolNum");
	String pageNum = request.getParameter("pageNum");
%>
<body>
	<form name="deleteform" class="deleteform" action="poolDeletePro.jsp" method="post" onsubmit="return deleteSubmit()">
		<input type="hidden" name="poolNum" value="<%=poolNum%>" />
		<input type="hidden" name="pageNum" value="<%=pageNum%>" />
	</form>
	<script>
		window.onload = function(){		
			var deleteConfirm =  confirm("정말로 삭제하시겠습니까?");
			if(deleteConfirm){
				document.deleteform.submit();
			}else{
				history.back();
			}
		}
	</script>
</body>
</html>
