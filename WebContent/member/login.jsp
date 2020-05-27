<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="20" required autofocus />
				<label for="id">아이디</label>
			</div>
			<div class="form-label-group">
				<input type="password" class="form-control mb-3" placeholder="비밀번호" name="pw" id="pw" maxlength="20" required />
				<label for="pw">비밀번호</label>
			</div>
			<button type="submit" class="btn btn-lg btn-primary btn-block mb-5">로그인</button>
			<a href="join.jsp" class="btn btn-link" role="button">회원가입</a>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>