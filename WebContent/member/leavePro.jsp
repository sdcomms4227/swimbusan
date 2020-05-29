<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	String userId = (String)session.getAttribute("userId");
	String userPw = request.getParameter("userPw");

	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.deleteMember(userId,userPw);

	if (result == 1) {
		session.invalidate();
%>
	<script>
		alert("정상적으로 탈퇴되었습니다.");
		location.href = "<%=contextPath%>/index.jsp";
	</script>
<%
	}else if(result == -1){
		
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
	}
%>