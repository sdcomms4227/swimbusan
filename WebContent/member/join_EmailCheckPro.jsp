<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String emailKey = (String)session.getAttribute("emailKey");
	String userKey = request.getParameter("userKey");

	if (emailKey.equals(userKey)) {
%>
	<script>
		alert("정상적으로 인증되었습니다.");
		opener.document.joinform.emailCheckState.value = 1;
		window.close();
	</script>
<%
	}else{
%>
	<script>
		alert("인증번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
	}
%>