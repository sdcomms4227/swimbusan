<%@page import="pool.PoolBean"%>
<%@page import="pool.PoolDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String boardId = (String) session.getAttribute("boardId");
	String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");

	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	String pageNum = request.getParameter("pageNum");
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));

	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = boardDAO.getBoard(boardNum, boardId);

	int updateNum = boardBean.getBoardNum();
	String updateName = (boardBean.getUserName() != null) ? boardBean.getUserName() : "";
	String updateCategory = (boardBean.getBoardCategory() != null) ? boardBean.getBoardCategory() : "";
	String updateSubject = (boardBean.getBoardSubject() != null) ? boardBean.getBoardSubject() : "";
	String updateContent = (boardBean.getBoardContent() != null) ? boardBean.getBoardContent().replace("<br>", "\r\n") : "";
	String updateId = (boardBean.getUserId() != null) ? boardBean.getUserId() : "";
	String updateBoardFile = (boardBean.getBoardFile() != null) ? boardBean.getBoardFile() : "";

	PoolDAO poolDAO = new PoolDAO();	
	List<PoolBean> cateList = poolDAO.getPoolNameList();
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
					<%
						if(boardId.equals("review")){
					%>
					<tr>
						<th class="align-middle">
							<label for="boardCategory" class="m-0">수영장</label>
						</th>
						<td>
							<select class="form-control" name="boardCategory" id="boardCategory" value="<%=updateCategory%>" required>
								<option value="">전체보기</option>									
								<%
									for(int i=0; i<cateList.size(); i++){
										PoolBean poolBean = cateList.get(i);
										String poolName = poolBean.getPoolName();
								%>
									<option value="<%=poolName%>" <%if(updateCategory.equals(poolName)) out.print("selected"); %>><%=poolName%></option>									
								<%
									}
								%>
								<option value="기타" <%if(updateCategory.equals("기타")) out.print("selected"); %>>기타</option>
							</select>
						</td>
					</tr>
					<% } %>
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
						if(boardId.equals("gallery")){
						
							String[] fileItems = updateBoardFile.split(",");
							for(int i=0;i<fileItems.length;i++){
					%>
						<tr>
							<th class="align-middle">이미지 첨부<%=i+1%></th>
							<td colspan="5">
								<%
									if(fileItems[i]!=null && !fileItems[i].equals("")){
								%>
									<input type="hidden" name="oldFile<%=i+1%>" value="<%=fileItems[i]%>" />
									<p>
										<img src="<%=contextPath%>/file/<%=fileItems[i]%>" class="mr-2" style="width:60px" />
										<%=fileItems[i]%>
									</p>
									<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
								<%
									}
								%>
								<div class="custom-file">
									<input class="custom-file-input" type="file" name="boardFile<%=i+1%>" id="boardFile<%=i+1%>" onchange="checkFile(this)" />
									<label class="custom-file-label" for="boardFile">Choose file</label>
								</div>
							</td>
						</tr>
					<%
							}
							for(int i=fileItems.length;i<3;i++){
					%>
						<tr>
							<th class="align-middle">이미지 첨부<%=i+1%></th>
							<td colspan="5">
								<div class="custom-file">
									<input class="custom-file-input" type="file" name="boardFile<%=i+1%>" id="boardFile<%=i+1%>" />
									<label class="custom-file-label" for="boardFile">Choose file</label>
								</div>
							</td>
						</tr>
					<%
							}
							
						}else{
					%>
						<tr>
							<th class="align-middle">
								<label class="m-0">파일첨부</label>
							</th>
							<td>
								<%
									if(updateBoardFile!=null && !updateBoardFile.equals("")){
								%>
									<p><%=updateBoardFile%></p>
									<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
								<%
									}
								%>
								<div class="custom-file">
									<input class="custom-file-input" type="file" name="boardFile" id="boardFile" onchange="checkFile(this)" />
									<label class="custom-file-label" for="boardFile">Choose file</label>
								</div>
							</td>
						</tr>
					<%
						}
					%>
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
			if($(obj).parent().prev().hasClass("alert")){
				if($(obj).val().length > 0){
					$(obj).parent().prev().fadeIn();
				}else{
					$(obj).parent().prev().hide();
				}
			}
		}
	</script>
</body>
</html>















