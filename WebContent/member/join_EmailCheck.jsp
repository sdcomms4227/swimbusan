<%@page import="member.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "이메일 인증하기";
	request.setAttribute("pageName", pageName);
	
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");

	String userEmail = request.getParameter("userEmail");
	String emailKey = (request.getAttribute("emailKey") != null) ? Integer.toString((int) request.getAttribute("emailKey")) : null;
	session.setAttribute("emailKey", emailKey);
%>
<jsp:include page="../include/head.jsp" />
<body>
	<div class="container">
		<%
			if (emailKey != null && !emailKey.equals("")) {
		%>
			<form class="checkform py-5" action="<%=contextPath%>/member/join_EmailCheckPro.jsp" method="post" name="checkform">
				<p class="alert alert-success">이메일로 전송된 인증번호를 입력해주세요.</p>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userKey" class="input-group-text">인증번호</label>
					</div>
					<input type="text" class="form-control" name="userKey" id="userKey" maxlength="4" required>
				</div>
				<div class="text-center my-5">
					<button type="submit" class="btn btn-primary">인증번호 확인</button>
				</div>
			</form>
			<p class="alert alert-danger">테스트를 위해 인증번호 출력 : <%=emailKey%></p>
		<%
			} else {
		%>
			<form class="checkform py-5" action="<%=contextPath%>/mailSend" method="post" name="checkform">
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userEmail" class="input-group-text">이메일</label>
					</div>
					<input type="text" class="form-control" name="userEmail" id="userEmail" value="<%=userEmail%>" maxlength="50" required>
				</div>
				<div class="text-center my-5">
					<button type="submit" class="btn btn-primary">인증번호 보내기</button>
				</div>
			</form>
		<%
			}
		%>
	</div>
</body>
</html>