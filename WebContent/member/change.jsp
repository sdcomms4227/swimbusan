<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "비밀번호변경";
	request.setAttribute("pageName", pageName);
	
	String userId = (String) session.getAttribute("userId");
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
		<hr />
		<form name="changeform" class="changeform" action="changePro.jsp" method="post" onsubmit="return changeSubmit()">
			<fieldset class="my-5">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPw" class="input-group-text">기존 비밀번호</label>
					</div>
					<input type="password" class="form-control" name="userPw" id="userPw" maxlength="20" required autofocus>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="newPw" class="input-group-text">새 비밀번호</label>
					</div>
					<input type="password" class="form-control" name="newPw" id="newPw" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="newPw2" class="input-group-text">새 비밀번호 확인</label>
					</div>
					<input type="password" class="form-control" name="newPw2" id="newPw2" maxlength="20" required>
				</div>
			</fieldset>
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
				<button type="submit" class="btn btn-primary">비밀번호변경</button>
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function changeSubmit() {
			if (document.changeform.newPw.value != document.changeform.newPw2.value) {
				alert("새 비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	</script>
</body>
</html>
