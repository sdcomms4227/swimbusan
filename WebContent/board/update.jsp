<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수다방";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="/include/head.jsp" />
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");

	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	request.setCharacterEncoding("UTF-8");

	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	String pageNum = request.getParameter("pageNum");

	BoardDAO boardDAO = new BoardDAO();

	BoardBean boardBean = boardDAO.getBoard(boardNum);

	int updateNum = boardBean.getBoardNum();
	String updateName = boardBean.getUserName();
	String updateSubject = boardBean.getBoardSubject();
	String updateContent = "";
	String updateId = boardBean.getUserId();
	String updateBoardFile = boardBean.getBoardFile();

	if (boardBean.getBoardContent() != null) {
		updateContent = boardBean.getBoardContent().replace("\r\n", "<br>");
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
			<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="hidden" name="boardNum" value="<%=boardNum%>" />
				<table class="table">
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="userName" id="userName" value="<%=updateName%>" readonly />
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
					<tr>
						<th class="align-middle">
							<label for="boardSubject" class="m-0">제목</label>
						</th>
						<td>
							<input class="form-control" type="text" name="boardSubject" id="boardSubject" value="<%=updateSubject%>" />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="boardContent" class="m-0">글내용</label>
						</th>
						<td>
							<textarea class="form-control" name="boardContent" id="boardContent" cols="40" rows="13"><%=updateContent%></textarea>
						</td>
					</tr>
					<%
						if(updateBoardFile!=null && !updateBoardFile.equals("")){
					%>
					<tr>
						<th class="align-middle">첨부파일</th>
						<td colspan="5">
							<%=updateBoardFile%> <br />
						</td>
					</tr>
					<% } %>
					<tr>
						<th class="align-middle">
							<label class="m-0">파일첨부</label>
						</th>
						<td>
							<%
								if(updateBoardFile!=null && !updateBoardFile.equals("")){
							%>
								<p class="alert alert-danger" id="alert" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
							<%
								}
							%>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="boardFile" id="boardFile" onchange="checkFile(this)" />
								<label class="custom-file-label" for="boardFile">Choose file</label>
							</div>
						</td>
					</tr>
				</table>
				<div class="text-center my-5">
					<input type="button" value="취소" class="btn btn-secondary" onclick="history.back()" />
					<input type="submit" value="수정" class="btn btn-warning" />
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
		function checkFile(obj){
			if($("#alert").length){
				if($(obj).val().length > 0){
					$("#alert").fadeIn();
				}else{
					$("#alert").hide();
				}
			}
		}
	</script>
</body>
</html>















