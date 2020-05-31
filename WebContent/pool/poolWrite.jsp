<%@page import="pool.PoolBean"%>
<%@page import="pool.PoolDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수영장 정보";
	request.setAttribute("pageName", pageName);
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");

	if (userId == null || !userId.equals("admin")) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}
%>
<body>
	<jsp:include page="/include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<form action="poolWritePro.jsp" method="post">
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="poolName" class="m-0">수영장 이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="poolName" id="poolName" required />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolZipcode" class="m-0">우편번호</label>
						</th>
						<td>
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="poolZipcode" id="poolZipcode" maxlength="5" placeholder="00000">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" onclick="daumPostcode()">우편번호 찾기</button>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">주소1</label>
						</th>
						<td>
							<input type="text" class="form-control" name="poolAddress1" id="poolAddress1" maxlength="50">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolAddress2" class="m-0">주소2</label>
						</th>
						<td>
							<input type="text" class="form-control" name="poolAddress2" id="poolAddress2" maxlength="50">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolTel" class="m-0">전화번호</label>
						</th>
						<td>
							<input type="tel" class="form-control" name="poolTel" id="poolTel" maxlength="20" placeholder="000-0000-0000~0">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolUrl" class="m-0">홈페이지</label>
						</th>
						<td>
							<input type="tel" class="form-control" name="poolUrl" id="poolUrl" maxlength="50" placeholder="http://www.naver.com">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolContent" class="m-0">상세정보</label>
						</th>
						<td>
							<textarea class="form-control" name="poolContent" id="poolContent" cols="40" rows="13" required></textarea>
						</td>
					</tr>
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</form>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("poolAddress1").value += extraAddr;

					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('poolZipcode').value = data.zonecode;
					document.getElementById("poolAddress1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("poolAddress2").focus();
				}
			}).open();
		}
	</script>
</body>
</html>