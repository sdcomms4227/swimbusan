<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memberBean" class="member.MemberBean" />
<jsp:setProperty property="*" name="memberBean" />

<%
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.updateMember(memberBean);

	if (result == 1) {
%>
	<script>
		alert("수정이 완료되었습니다.");
		location.href = "index.jsp";
	</script>
<%
	}
%>