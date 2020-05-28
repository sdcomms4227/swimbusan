<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "회원정보수정";
	request.setAttribute("pageName", pageName);
	
	String userId = (String)session.getAttribute("userId");
	
	MemberDAO memberDAO = new MemberDAO();
	MemberBean memberBean = memberDAO.getMember(userId);
	
	String userPw = memberBean.getUserPw();
	String userName = memberBean.getUserName();
	String userEmail = memberBean.getUserEmail();
	int userZipcode = memberBean.getUserZipcode();
	String userAddress1 = memberBean.getUserAddress1();
	String userAddress2 = memberBean.getUserAddress2();
	String userPhone = memberBean.getUserPhone();
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container py-5">
		<form name="joinform" class="joinform" action="modifyPro.jsp" method="post">
			<h2>${pageName}</h2>
			<hr />
			<fieldset class="my-5">
				<legend class="mb-3">필수 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userId" class="input-group-text">아이디</label>
					</div>
					<input type="text" class="form-control" name="userId" id="userId" value="<%=userId%>" maxlength="20" readonly>
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="winopen()">아이디 중복확인</button>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPw" class="input-group-text">비밀번호</label>
					</div>
					<input type="password" class="form-control" name="userPw" id="userPw" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userName" class="input-group-text">이름</label>
					</div>
					<input type="text" class="form-control" name="userName" id="userName" value="<%=userName%>" maxlength="20" required>
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userEmail" class="input-group-text">이메일</label>
					</div>
					<input type="text" class="form-control" name="userEmail" id="userEmail" value="<%=userEmail%>" maxlength="50" required placeholder="mail@mail.com">
				</div>
			</fieldset>
			<fieldset class="my-5">
				<legend class="mb-3">부가 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userZipcode" class="input-group-text">우편번호</label>
					</div>
					<input type="text" class="form-control" name="userZipcode" id="userZipcode" value="<%=userZipcode%>" maxlength="5" placeholder="00000">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress1" class="input-group-text">주소1</label>
					</div>
					<input type="text" class="form-control" name="userAddress1" id="userAddress1" value="<%=userAddress1%>" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress2" class="input-group-text">주소2</label>
					</div>
					<input type="text" class="form-control" name="userAddress2" id="userAddress2" value="<%=userAddress2%>" maxlength="50">
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userPhone" class="input-group-text">휴대폰2</label>
					</div>
					<input type="text" class="form-control" name="userPhone" id="userPhone" value="<%=userPhone%>" maxlength="13" placeholder="010-0000-0000">
				</div>
			</fieldset>
			<div class="text-center my-5">
				<input type="button" onclick="history.back()" class="btn btn-secondary" value="취소" />
				<input type="submit" class="btn btn-primary" value="회원정보수정" />
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function winopen(){
			if(document.joinform.userId.value == ""){				
				alert("아이디를 입력해주세요.");				
				document.f.id.focus();				
				return;
			}
			
			var formId = document.joinform.userId.value;
			window.open("join_IDCheck.jsp?userId=" + formId, "", "width=400,height=200");
		}
	</script>
</body>
</html>
