<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "로그인";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="section-member">
		<form name="loginform" class="loginform text-center" action="loginPro.jsp" method="post">
			<h3 class="mb-5">${pageName}</h3>
			<div class="form-label-group">
				<input type="text" class="form-control" placeholder="아이디" name="userId" id="userId" maxlength="20" required autofocus />
				<label for="userId">아이디</label>
			</div>
			<div class="form-label-group">
				<input type="password" class="form-control mb-3" placeholder="비밀번호" name="userPw" id="userPw" maxlength="20" required />
				<label for="userPw">비밀번호</label>
			</div>
			<button type="submit" class="btn btn-lg btn-primary btn-block mb-5">로그인</button>
			<button type="button" class="btn btn-link" onclick="location.href='join.jsp'">회원가입</button>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>