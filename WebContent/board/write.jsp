<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수다방";
	request.setAttribute("pageName",pageName);
%>
<jsp:include page="/include/head.jsp" />
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");
	String userName = (String)session.getAttribute("userName");

	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}
%>
<body>
	<jsp:include page="/include/header.jsp" />
	<section class="container py-5">
		<h2><%=pageName%></h2>
		<!-- 게시판 -->
		<article class="mt-3">
			<form action="writePro.jsp" method="post">
				<input type="hidden" name="userId" value="<%=userId%>" />
				<table class="table">
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="userName" id="userName" value="<%=userName%>" readonly />
						</td>
					</tr>
					<% if(userId == null) {%>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">비밀번호</label>
						</th>
						<td>
							<input class="form-control" type="password" name="boardPw" />
						</td>
					</tr>
					<% } %>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">제목</label>
						</th>
						<td>
							<input class="form-control" type="text" name="boardSubject" />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">내용</label>
						</th>
						<td>
							<textarea class="form-control" name="boardContent" cols="40" rows="13"></textarea>
						</td>
					</tr>
				</table>
				<div id="table_search">
					<button type="submit"  class="btn btn-primary">글쓰기</button>
					<button type="reset" class="btn btn-secondary">다시작성</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='notice.jsp'">글목록</button>
				</div>
			</form>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>