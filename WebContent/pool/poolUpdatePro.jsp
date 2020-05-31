<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = (String) session.getAttribute("userId");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String encoding = "UTF-8";

	if (userId == null || !userId.equals("admin")) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}
	
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="poolDAO" class="pool.PoolDAO" />
<jsp:useBean id="poolBean" class="pool.PoolBean" />
<jsp:setProperty property="*" name="poolBean" />
<%

	int result = poolDAO.updatePool(poolBean);

	if (result == 1) {
%>
	<script>
		alert("정상적으로 수정되었습니다.");
		location.href="pool.jsp?pageNum=<%=pageNum%>";
	</script>
<%
	}else if(result == 0){
%>
	<script>
		alert("이미 등록된 수영장입니다.");
		history.back();
	</script>
<%
	}
%>