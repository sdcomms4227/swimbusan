<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String boardId = (String) session.getAttribute("boardId");
	String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%

	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	String pageNum = request.getParameter("pageNum");

	BoardDAO boardDao = new BoardDAO();

	boardDao.updateCount(boardNum, boardId);

	BoardBean boardBean = boardDao.getBoard(boardNum, boardId);

	int readNum = boardBean.getBoardNum();
	int readCount = boardBean.getBoardCount();
	String readName = boardBean.getUserName();
	Timestamp readDate = boardBean.getBoardDate();
	String readSubject = boardBean.getBoardSubject();
	String readContent = "";
	String readBoardFile = boardBean.getBoardFile();
	String readId = boardBean.getUserId();
	String readCategory = boardBean.getBoardCategory();

	if (boardBean.getBoardContent() != null) {
		readContent = boardBean.getBoardContent().replace("\r\n", "<br>");
	}
	int readRe_ref = boardBean.getBoardRe_ref();
	int readRe_lev = boardBean.getBoardRe_lev();
	int readRe_seq = boardBean.getBoardRe_seq();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String userId = (String) session.getAttribute("userId");
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
			<table class="table readtable">
				<colgroup>
					<col style="width: 8%" />
					<col style="width: 52%" />
					<col style="width: 8%" />
					<col style="width: 16%" />
					<col style="width: 8%" />
					<col style="width: 8%" />
				</colgroup>
				<tr>
					<td colspan="6" class="h4 p-3 readsubject">
						<%=readSubject%>
						<%
							if(readCategory!=null && !readCategory.equals("")){
						%>
							<small class="text-muted">[<%=readCategory%>]</small>
						<%
							}
						%>
					</td>
				</tr>
				<tr class="d-none d-lg-table-row">
					<th class="align-middle">작성자</th>
					<td><%=readName%></td>
					<th class="align-middle">작성일</th>
					<td><%=sdf.format(readDate)%></td>
					<th class="align-middle">조회수</th>
					<td><%=readCount%></td>
				</tr>
				<tr class="d-lg-none">
					<th class="align-middle">작성자</th>
					<td colspan="5"><%=readName%></td>
				</tr>
				<tr class="d-lg-none">
					<th class="align-middle">작성일</th>
					<td colspan="5"><%=sdf.format(readDate)%></td>
				</tr>
				<tr class="d-lg-none">
					<th class="align-middle">조회수</th>
					<td colspan="5"><%=readCount%></td>
				</tr>
				<tr>
					<td colspan="6" class="py-5"><%=readContent%></td>
				</tr>
				<%
					if(readBoardFile!=null && !readBoardFile.equals("")){
				%>
				<tr>
					<th class="align-middle">첨부파일</th>
					<td colspan="5">
						<%=readBoardFile%>
						<a href="<%=contextPath%>/download.do?fileName=<%=readBoardFile%>" class="btn btn-sm btn-info ml-2">다운로드</a>
					</td>
				</tr>
				<% } %>
			</table>
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary" onclick="location.href='<%=boardId%>.jsp?pageNum=<%=pageNum%>'">목록</button>
				<%
					if (userId != null && userId.equals(readId)) {
				%>
				<button type="button" class="btn btn-warning" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&boardNum=<%=readNum%>'">수정</button>
				<button type="button" class="btn btn-danger" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&boardNum=<%=readNum%>'">삭제</button>
				<%
					}
					if (userId != null) {
				%>
				<button type="button" class="btn btn-primary" onclick="document.reWriteform.submit()">답글쓰기</button>
				<%
					}
				%>
			</div>			
		</article>
		<!-- 게시판 -->				
		<form action="reWrite.jsp" method="post" name="reWriteform">
			<input type="hidden" name="boardCategory" value="<%=readCategory%>" />
			<input type="hidden" name="boardSubject" value="<%=readSubject%>" />
			<input type="hidden" name="boardNum" value="<%=readNum%>" />
			<input type="hidden" name="boardRe_ref" value="<%=readRe_ref%>" />
			<input type="hidden" name="boardRe_lev" value="<%=readRe_lev%>" />
			<input type="hidden" name="boardRe_seq" value="<%=readRe_seq%>" />
		</form>
	</section>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>