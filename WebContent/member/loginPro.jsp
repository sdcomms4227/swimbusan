<%@page import="member.MemberBean"%>
<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");

	MemberDAO memberdao = new MemberDAO();

	int check = memberdao.userCheck(userId, userPw);

	if (check == 1) {
		session.setAttribute("userId", userId);

		MemberBean memberBean = memberdao.getMember(userId);
		session.setAttribute("userName", memberBean.getUserName());
		
		response.sendRedirect(contextPath + "/index.jsp");

	} else if (check == 0) {
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
	} else if (check == -1) {
%>
	<script>
		alert("아이디가 존재하지 않습니다.");
		history.back();
	</script>
<%
	}
%>