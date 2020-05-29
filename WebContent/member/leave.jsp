<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "회원탈퇴";
	request.setAttribute("pageName", pageName);
	
	String userId = (String)session.getAttribute("userId");
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container py-5">
		<h2>${pageName}</h2>
		<hr />
		<form name="leaveform" class="leaveform" action="leavePro.jsp" method="post" onsubmit="return leaveSubmit()">
			<fieldset class="my-5">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPw" class="input-group-text">비밀번호</label>
					</div>
					<input type="password" class="form-control" name="userPw" id="userPw" maxlength="20" required autofocus>
				</div>
			</fieldset>
			<div class="text-center my-5">
				<input type="button" onclick="history.back()" class="btn btn-secondary" value="취소" />
				<input type="submit" class="btn btn-primary" value="비밀번호변경" />
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function leaveSubmit(){			
			return confirm("정말로 탈퇴하시겠습니까?");
		}
	</script>
</body>
</html>
