<%@page import="pool.PoolDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");

	String poolId = (String) session.getAttribute("poolId");
	int poolNum = Integer.parseInt(request.getParameter("poolNum"));
	String poolPw = request.getParameter("poolPw");
	String pageNum = request.getParameter("pageNum");

	PoolDAO poolDAO = new PoolDAO();
	int result = poolDAO.deletePool(poolNum);

	if (result == 1) {
%>
	<script>
		alert("정상적으로 삭제되었습니다.");
		location.href = "pool.jsp?pageNum=<%=pageNum%>";
	</script>
<%
	} else if (result == 0) {
%>
	<script>
		alert("게시글이 존재하지 않습니다.");
		history.back();
	</script>
<%
	}
%>