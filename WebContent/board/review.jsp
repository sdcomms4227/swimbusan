<%@page import="pool.PoolBean"%>
<%@page import="pool.PoolDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수영장 후기";
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

	BoardDAO boardDAO = new BoardDAO();

	int count = boardDAO.getBoardCount(search, category, boardId);	
	int pageSize = 10;
	String pageNum = (request.getParameter("pageNum") != null) ? request.getParameter("pageNum") : "1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize;
	
	List<BoardBean> list = null;

	if (count > 0) {
		list = boardDAO.getBoardList(search, category, startRow, pageSize, boardId);
	}
	
	SimpleDateFormat sdfmt = new SimpleDateFormat("yy.MM.dd");
	
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
			<table class="table table-hover text-center">
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:80px"/>
					<col style="width:160px"/>
					<col />
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
				</colgroup>
				<thead class="thead-light d-none d-lg-table-header-group">
					<tr>
						<th>번호</th>
						<th>수영장</th>
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
								int beanNum = boardBean.getBoardNum();
								int beanRe_lev = boardBean.getBoardRe_lev();
								String beanSubject = boardBean.getBoardSubject();
								String beanFile = boardBean.getBoardFile();
								String beanName = boardBean.getUserName();
								String beanDate = sdfmt.format(boardBean.getBoardDate());
								int beanCount = boardBean.getBoardCount();
								String beanCategory = boardBean.getBoardCategory();
								int beanRCount = boardBean.getReplyCount();
					%>
						<tr onclick="location.href='read.jsp?boardNum=<%=beanNum%>&pageNum=<%=pageNum%>'" style="cursor: pointer">
							<td class="d-none d-lg-table-cell"><%=beanNum%></td>
							<td class="d-none d-lg-table-cell"><%=beanCategory%></td>
							<td class="text-left">
								<%
									int marginLeft = 0;
									if (beanRe_lev > 0) {
										marginLeft = beanRe_lev * 10;
								%>
								<img src="<%=contextPath%>/images/re.gif" style="margin-left:<%=marginLeft%>px" class="mr-2" />
								<%
									}
								%>
								<%=beanSubject%>
								<%
									if(beanCategory!=null && !beanCategory.equals("")){
								%>
									<small class="d-lg-none text-muted">[<%=beanCategory%>]</small>
								<%
									}
								%>			
								<%
									if(beanFile!=null && !beanFile.equals("")){
								%>
									<svg class="bi bi-download ml-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M.5 8a.5.5 0 0 1 .5.5V12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V8.5a.5.5 0 0 1 1 0V12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8.5A.5.5 0 0 1 .5 8z"/>
									  <path fill-rule="evenodd" d="M5 7.5a.5.5 0 0 1 .707 0L8 9.793 10.293 7.5a.5.5 0 1 1 .707.707l-2.646 2.647a.5.5 0 0 1-.708 0L5 8.207A.5.5 0 0 1 5 7.5z"/>
									  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-1 0v-8A.5.5 0 0 1 8 1z"/>
									</svg>
								<%
									}
									if(beanRCount > 0){
								%>
									<small class="text-muted">[<%=beanRCount%>]</small>
								<%
									}
								%>
								<small class="d-block d-lg-none text-right mt-1 text-muted">
									<%=beanName%> | <%=beanDate%> | <%=beanCount%>
								</small>
							</td>
							<td class="d-none d-lg-table-cell"><%=beanName%></td>
							<td class="d-none d-lg-table-cell"><%=beanDate%></td>
							<td class="d-none d-lg-table-cell"><%=beanCount%></td>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan="6">등록된 게시글이 없습니다.</td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					<form action="<%=boardId%>.jsp" class="form-inline justify-content-center justify-content-lg-start">
						<div class="input-group mb-2 mb-sm-0 mr-sm-2">						
							<select class="form-control" name="category" onchange="this.form.submit()">
								<option value="">전체보기</option>									
								<%
									for(int i=0; i<cateList.size(); i++){
										PoolBean poolBean = cateList.get(i);
										String poolName = poolBean.getPoolName();
								%>
									<option value="<%=poolName%>" <%if(category.equals(poolName)) out.print("selected"); %>><%=poolName%></option>									
								<%
									}
								%>
								<option value="기타" <%if(category.equals("기타")) out.print("selected"); %>>기타</option>
							</select>
						</div>
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
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=startPage - pageBlock%>&search=<%=search%>&category=<%=category%>">이전</a>
							</li>
						<%
								for (int i = startPage; i <= endPage; i++) {
									String active = (pageNum == null && i == 1 || Integer.parseInt(pageNum) == i) ? "active" : "";
						%>
			   				<li class="page-item <%=active%>">
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=i%>&search=<%=search%>&category=<%=category%>"><%=i%></a>
							</li>
						<%
							}
							String disabled2 = (endPage < pageCount) ? "" : "disabled";
						%>
			   				<li class="page-item <%=disabled2%>">
								<a class="page-link" href="<%=boardId%>.jsp?pageNum=<%=startPage + pageBlock%>&search=<%=search%>&category=<%=category%>">다음</a>
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