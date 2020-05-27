<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "회원가입";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container py-5">
		<form name="joinform" class="joinform" action="joinPro.jsp" method="post">
			<h2>${pageName}</h2>
			<hr />
			<fieldset class="my-5">
				<legend class="mb-3">필수 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="id" class="input-group-text">아이디</label>
					</div>
					<input type="text" class="form-control" name="id" id="id" maxlength="20" required autofocus>
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="winopen()">아이디 중복확인</button>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="pw" class="input-group-text">비밀번호</label>
					</div>
					<input type="password" class="form-control" name="pw" id="pw" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="pw2" class="input-group-text">비밀번호 확인</label>
					</div>
					<input type="password" class="form-control" name="pw2" id="pw2" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="name" class="input-group-text">이름</label>
					</div>
					<input type="text" class="form-control" name="name" id="name" maxlength="20" required>
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="email" class="input-group-text">이메일</label>
					</div>
					<input type="text" class="form-control" name="email" id="email" maxlength="50" required placeholder="mail@mail.com">
				</div>
			</fieldset>
			<fieldset class="my-5">
				<legend class="mb-3">부가 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="zipcode" class="input-group-text">우편번호</label>
					</div>
					<input type="text" class="form-control" name="zipcode" id="zipcode" maxlength="5" placeholder="00000">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="address1" class="input-group-text">주소1</label>
					</div>
					<input type="text" class="form-control" name="address1" id="address1" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="address2" class="input-group-text">주소2</label>
					</div>
					<input type="text" class="form-control" name="address2" id="address2" maxlength="50">
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="phone" class="input-group-text">휴대폰2</label>
					</div>
					<input type="text" class="form-control" name="phone" id="phone" maxlength="13" placeholder="010-0000-0000">
				</div>
			</fieldset>
			<div class="text-center my-5">
				<input type="button" onclick="history.back()" class="btn btn-secondary" value="취소" />
				<input type="submit" class="btn btn-primary" value="회원가입" />
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function winopen(){
			if(document.joinform.id.value == ""){				
				alert("아이디를 입력해주세요.");				
				document.f.id.focus();				
				return;
			}
			
			var fid = document.joinform.id.value;
			window.open("join_IDCheck.jsp?id=" + fid, "", "width=400,height=200");
		}
	</script>
</body>
</html>
