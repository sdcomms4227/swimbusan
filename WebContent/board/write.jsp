<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String boardId = (String) session.getAttribute("boardId");
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");

	if (userId == null) {
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
			<form action="writePro.jsp" method="post" enctype="multipart/form-data">
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="userName" id="userName" value="<%=userName%>" readonly />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="boardPw" class="m-0">비밀번호</label>
						</th>
						<td>
							<input class="form-control" type="password" name="boardPw" id="boardPw" required />
						</td>
					</tr>
					<%
						if(boardId.equals("review")){
					%>
					<tr>
						<th class="align-middle">
							<label for="boardCategory" class="m-0">수영장</label>
						</th>
						<td>
							<select class="form-control" name="boardCategory" id="boardCategory" required>
								<option value="">선택해주세요.</option>
								<option value="사직수영장">사직수영장</option>
								<option value="강서구국민체육센터">강서구국민체육센터</option>
								<option value="금정국민체육센터">금정국민체육센터</option>
								<option value="기장군국민체육센터">기장군국민체육센터</option>
								<option value="남구국민체육센터">남구국민체육센터</option>
								<option value="동구국민체육문예센터">동구국민체육문예센터</option>
								<option value="동래구국민체육센터">동래구국민체육센터</option>
								<option value="부산진구국민체육센터">부산진구국민체육센터</option>
								<option value="북구국민체육센터">북구국민체육센터</option>
								<option value="사상구국민체육센터">사상구국민체육센터</option>
								<option value="사하구국민체육센터">사하구국민체육센터</option>
								<option value="부산국민체육센터">부산국민체육센터</option>
								<option value="수영구국민체육센터">수영구국민체육센터</option>
								<option value="연제구국민체육센터">연제구국민체육센터</option>
								<option value="영도국민체육센터">영도국민체육센터</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
					<% } %>
					<tr>
						<th class="align-middle">
							<label for="boardSubject" class="m-0">제목</label>
						</th>
						<td>
							<input class="form-control" type="text" name="boardSubject" id="boardSubject" required />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="boardContent" class="m-0">내용</label>
						</th>
						<td>

							<textarea class="form-control" name="boardContent" id="boardContent" cols="40" rows="13" required></textarea>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label class="m-0">파일첨부</label>
						</th>
						<td>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="boardFile" id="boardFile" />
								<label class="custom-file-label" for="boardFile">Choose file</label>
							</div>
						</td>
					</tr>
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-primary">글쓰기</button>
				</div>
			</form>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
	<script src="<%=contextPath%>/js/bs-custom-file-input.js"></script>
	<script>
		$(document).ready(function() {
			bsCustomFileInput.init()
		})
	</script>
</body>
</html>