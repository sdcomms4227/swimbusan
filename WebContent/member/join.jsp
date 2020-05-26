<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="pageName" value="회원가입" scope="request" />
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container">
		<form class="form-join" action="joinAction.jsp" method="post">
			<h3 class="mb-5">${pageName}</h3>
			<fieldset>
				<legend>필수 입력</legend>
				<hr />
				<div class="form-group row">
					<label for="userId" class="col-sm-3 col-form-label">아이디</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userId" id="userId" maxlength="20" required autofocus />
					</div>
				</div>
				<div class="form-group row">
					<label for="userPw" class="col-sm-3 col-form-label">비밀번호</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" name="userPw" id="userPw" maxlength="20" required />
					</div>
				</div>
				<div class="form-group row">
					<label for="userPw2" class="col-sm-3 col-form-label">비밀번호 확인</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" name="userPw2" id="userPw2" maxlength="20" required />
					</div>
				</div>
				<div class="form-group row">
					<label for="userName" class="col-sm-3 col-form-label">이름</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userName" id="userName" maxlength="20" required />
					</div>
				</div>
				<div class="form-group row">
					<label for="userEmail" class="col-sm-3 col-form-label">이메일</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" name="userEmail" id="userEmail" maxlength="50" required placeholder="mail@mail.com" />
					</div>
				</div>
			</fieldset>
			<fieldset class="mt-5">
				<legend>부가 입력</legend>
				<hr />
				<div class="form-group row">
					<label for="userZipcode" class="col-sm-3 col-form-label">우편번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userZipcode" id="userZipcode" maxlength="5" />
					</div>
				</div>
				<div class="form-group row">
					<label for="userAddress1" class="col-sm-3 col-form-label">주소</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="userAddress1" id="userAddress1" maxlength="100" />
						<input type="text" class="form-control mt-1" name="userAddress2" id="userAddress2" maxlength="100" />
					</div>
				</div>
				<div class="form-group row">
					<label for="userPhone" class="col-sm-3 col-form-label">휴대폰</label>
					<div class="col-sm-9">
						<input type="number" class="form-control" name="userPhone" id="userPhone" maxlength="13" />
					</div>
				</div>
				<div class="form-group row">
					<label for="userAge" class="col-sm-3 col-form-label">나이</label>
					<div class="col-sm-9">
						<input type="number" class="form-control" name="userAge" id="userAge" maxlength="3" />
					</div>
				</div>
				<div class="form-group row">
					<label for="userGender1" class="col-sm-3 col-form-label">성별</label>
					<div class="col-sm-9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active">
								<input type="radio" name="userGender" id="userGender1" value="남자" checked />
								<span>남자</span>
							</label>
							<label class="btn btn-secondary">
								<input type="radio" name="userGender" id="userGender2" value="여자" />
								<span>여자</span>
							</label>
						</div>
					</div>
				</div>
			</fieldset>
			<div class="text-center mt-5">
				<input type="button" onclick="history.back()" class="btn btn-lg btn-secondary" value="취소" />
				<input type="submit" class="btn btn-lg btn-primary" value="회원가입" />
			</div>
		</form>
	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
