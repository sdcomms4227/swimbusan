<%@ page import="dbcp.DBConnectionMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="dao" class="mybean.SawonDao" />
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	dao.delSawon(no);
%>
<script>
	alert("잘 삭제되었습니다.");
	location.href = "index.jsp";
</script>