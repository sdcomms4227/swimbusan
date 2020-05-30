<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	session.invalidate();
%>
<script>
	alert("로그아웃 되었습니다.");	
	location.href = "<%=contextPath%>/index.jsp";
</script>