<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수다방";
	request.setAttribute("pageName", pageName);
	session.setAttribute("boardName", pageName);
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");
	String boardId = (String) request.getAttribute("pageId");
	session.setAttribute("boardId", boardId);
	String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
	String category = (request.getParameter("category") != null) ? request.getParameter("category") : "";

	BoardDAO boardDao = new BoardDAO();

	int count = boardDao.getBoardCount(search, category, boardId);
	int pageSize = 10;
	String pageNum = (request.getParameter("pageNum") != null) ? request.getParameter("pageNum") : "1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize;
	
	List<BoardBean> list = null;

	if (count > 0) {
		list = boardDao.getBoardList(search, category, startRow, pageSize, boardId);
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
			<table class="table table-hover text-center">
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:80px"/>
					<col />
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
				</colgroup>
				<thead class="thead-light d-none d-lg-table-header-group">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (count > 0) {
							for (int i = 0; i < list.size(); i++) {
								BoardBean boardBean = list.get(i);
					%>
					<tr onclick="location.href='read.jsp?boardNum=<%=boardBean.getBoardNum()%>&pageNum=<%=pageNum%>'" style="cursor: pointer">
						<td class="d-none d-lg-table-cell"><%=boardBean.getBoardNum()%></td>
						<td class="text-left">
							<%
								int wid = 0;
										if (boardBean.getBoardRe_lev() > 0) {
											wid = boardBean.getBoardRe_lev() * 10;
							%>
							<img src="<%=contextPath%>/images/re.gif" style="margin-left:<%=wid%>px" class="mr-2" />
							<%
								}
							%>
							<%=boardBean.getBoardSubject()%>
							
							<%
								if(boardBean.getBoardFile()!=null && !boardBean.getBoardSubject().equals("")){
							%>
								<svg class="bi bi-download ml-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M.5 8a.5.5 0 0 1 .5.5V12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V8.5a.5.5 0 0 1 1 0V12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8.5A.5.5 0 0 1 .5 8z"/>
								  <path fill-rule="evenodd" d="M5 7.5a.5.5 0 0 1 .707 0L8 9.793 10.293 7.5a.5.5 0 1 1 .707.707l-2.646 2.647a.5.5 0 0 1-.708 0L5 8.207A.5.5 0 0 1 5 7.5z"/>
								  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-1 0v-8A.5.5 0 0 1 8 1z"/>
								</svg>
							<%} %>
							<small class="d-block d-lg-none text-right mt-1 text-muted">
								<%=boardBean.getUserName()%> | <%=new SimpleDateFormat("yy.MM.dd").format(boardBean.getBoardDate())%> | <%=boardBean.getBoardCount()%>
							</small>
						</td>
						<td class="d-none d-lg-table-cell"><%=boardBean.getUserName()%></td>
						<td class="d-none d-lg-table-cell"><%=new SimpleDateFormat("yy.MM.dd").format(boardBean.getBoardDate())%></td>
						<td class="d-none d-lg-table-cell"><%=boardBean.getBoardCount()%></td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					<form action="<%=boardId%>.jsp" class="form-inline justify-content-center justify-content-lg-start">
						<input type="hidden" name="category" value="" />
						<div class="input-group">
							<input type="text" name="search" size="24" maxlength="24" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
					<%
						if (userId != null) {
					%>
					<div class="form-group text-center text-lg-right">
						<button type="button" class="btn btn-secondary" onclick="location.href='write.jsp'">글쓰기</button>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-12">				
					<ul class="pagination justify-content-center">
						<%
							if (count > 0) {
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
								int pageBlock = 5;
								int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
								int endPage = startPage + pageBlock - 1;
		
								if (endPage > pageCount) {
									endPage = pageCount;
								}
		
								String disabled1 = (startPage > pageBlock) ? "" : "disabled";
						%>
			   				<li class="page-item <%=disabled1%>">
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=startPage - pageBlock%>&search=<%=search%>">이전</a>
							</li>
						<%
								for (int i = startPage; i <= endPage; i++) {
									String active = (pageNum == null && i == 1 || Integer.parseInt(pageNum) == i) ? "active" : "";
						%>
			   				<li class="page-item <%=active%>">
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=i%>&search=<%=search%>"><%=i%></a>
							</li>
						<%
							}
							String disabled2 = (endPage < pageCount) ? "" : "disabled";
						%>
			   				<li class="page-item <%=disabled2%>">
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=startPage + pageBlock%>&search=<%=search%>">다음</a>
							</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>