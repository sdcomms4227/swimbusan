<%@page import="member.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "아이디 중복확인";
	request.setAttribute("pageName", pageName);

	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");

	MemberDAO memberDAO = new MemberDAO();
	int check = memberDAO.idCheck(userId);
%>
<jsp:include page="../include/head.jsp" />
<body>
	<div class="container">
		<form class="checkform py-5" action="join_IdCheck.jsp" method="post" name="checkform">
			<div class="input-group">
				<div class="input-group-prepend">
					<label for="userId" class="input-group-text">아이디</label>
				</div>
				<input type="text" class="form-control" name="userId" id="userId" value="<%=userId%>" maxlength="20" required>
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary">중복확인</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container text-center">
		<%
			if (check == 1) {
		%>
			<p class="alert alert-danger" role="alert">사용할 수 없습니다.</p>
		<%
			} else {
		%>
			<p class="alert alert-success" role="alert">사용이 가능합니다.</p>
			<button type="button" class="btn btn-primary" onclick="useId()">사용하기</button>
		<%
			}
		%>
	</div>
	<script>
		function useId() {
			opener.document.joinform.userId.value = document.checkform.userId.value;
			opener.document.joinform.idCheckState.value = 1;
			window.close();
		}
	</script>
</body>
</html>