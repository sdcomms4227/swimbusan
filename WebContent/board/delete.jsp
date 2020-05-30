<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수다방";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="../include/head.jsp" />
<%
	String boardNum = request.getParameter("boardNum");
	String pageNum = request.getParameter("pageNum");
%>
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
		<hr />
		<form name="deleteform" class="deleteform" action="deletePro.jsp" method="post" onsubmit="return deleteSubmit()">
			<input type="hidden" name="boardNum" value="<%=boardNum%>" />
			<input type="hidden" name="pageNum" value="<%=pageNum%>" />
			<p class="alert alert-danger text-center mt-5" role="alert">비밀번호를 입력해주세요.</p>
			<fieldset class="my-5">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="boardPw" class="input-group-text">비밀번호</label>
					</div>
					<input type="password" class="form-control" name="boardPw" id="boardPw" maxlength="20" required autofocus>
				</div>
			</fieldset>
			<div class="text-center my-5">
				<button type="button" onclick="history.back()" class="btn btn-secondary">취소</button>
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function deleteSubmit() {
			return confirm("정말로 삭제하시겠습니까?");
		}
	</script>
</body>
</html>
