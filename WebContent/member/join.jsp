<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "회원가입";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="../include/head.jsp" />
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container py-5">
		<h2>${pageName}</h2>
		<hr />
		<form name="joinform" class="joinform" action="joinPro.jsp" method="post" onsubmit="return joinSubmit()">
			<input type="hidden" name="idCheckState" value="0" />
			<input type="hidden" name="emailCheckState" value="0" />
			<fieldset class="my-5">
				<legend class="mb-3">필수 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userId" class="input-group-text">아이디</label>
					</div>
					<input type="text" class="form-control" name="userId" id="userId" maxlength="20" required autofocus>
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="idCheck()">아이디 중복확인</button>
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
						<label for="userPw2" class="input-group-text">비밀번호 확인</label>
					</div>
					<input type="password" class="form-control" name="userPw2" id="userPw2" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userName" class="input-group-text">이름</label>
					</div>
					<input type="text" class="form-control" name="userName" id="userName" maxlength="20" required>
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userEmail" class="input-group-text">이메일</label>
					</div>
					<input type="email" class="form-control" name="userEmail" id="userEmail" maxlength="50" required placeholder="mail@mail.com">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="emailCheck()">이메일 인증</button>
					</div>
				</div>
			</fieldset>
			<fieldset class="my-5">
				<legend class="mb-3">부가 입력</legend>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userZipcode" class="input-group-text">우편번호</label>
					</div>
					<input type="text" class="form-control" name="userZipcode" id="userZipcode" maxlength="5" placeholder="00000">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button" onclick="daumPostcode()">우편번호 찾기</button>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress1" class="input-group-text">주소1</label>
					</div>
					<input type="text" class="form-control" name="userAddress1" id="userAddress1" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress2" class="input-group-text">주소2</label>
					</div>
					<input type="text" class="form-control" name="userAddress2" id="userAddress2" maxlength="50">
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<label for="userPhone" class="input-group-text">휴대폰2</label>
					</div>
					<input type="text" class="form-control" name="userPhone" id="userPhone" maxlength="13" placeholder="010-0000-0000">
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
		function idCheck(){
			var joinId = document.joinform.userId.value;
			
			if(joinId == ""){				
				alert("아이디를 입력해주세요.");				
				document.joinform.userId.focus();				
				return;
			}
			
			window.open("join_IdCheck.jsp?userId=" + joinId, "", "width=400,height=200");
		}
		function emailCheck(){
			var joinEmail = document.joinform.userEmail.value;
			
			if(joinEmail == ""){				
				alert("이메일을 입력해주세요.");				
				document.joinform.userEmail.focus();				
				return;
			}
			
			window.open("join_EmailCheck.jsp?userEmail=" + joinEmail, "", "width=400,height=200");
		}
		function joinSubmit(){
			if(document.joinform.idCheckState.value!=1){
				confirm("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(document.joinform.userPw.value != document.joinform.userPw2.value){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if(document.joinform.emailCheckState.value!=1){
				confirm("이메일 인증을 해주세요.");
				return false;
			}
		}
	</script>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function daumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("userAddress1").value += extraAddr;
	                
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('userZipcode').value = data.zonecode;
	                document.getElementById("userAddress1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("userAddress2").focus();
	            }
	        }).open();
	    }
	</script>

</body>
</html>
