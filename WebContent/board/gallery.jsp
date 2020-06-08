<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "갤러리";
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
%>
<body>
	<jsp:include page="/include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
		<hr />
		<!-- 게시판 -->
		<article>
			<div class="gallery-grid">
				<%
					if (count > 0) {
						for (int i = 0; i < list.size(); i++) {
							BoardBean boardBean = list.get(i);
							String[] fileItems = boardBean.getBoardFile().split(",");
							int beanNum = boardBean.getBoardNum();
							String beanSubject = boardBean.getBoardSubject();
							String beanName = boardBean.getUserName();
							String beanDate = sdfmt.format(boardBean.getBoardDate());
				%>
					<div class="gallery-grid-item" onclick="location.href='read.jsp?boardNum=<%=beanNum%>&pageNum=<%=pageNum%>'" style="cursor: pointer">
						<img src="<%=contextPath%>/file/<%=fileItems[0]%>" class="d-block w-100" />
						<div class="caption">
							<div class="caption-inner text-center">
								<div>
									<p class="h4"><%=beanSubject%></p>
									<small><%=beanName%></small><br />
									<small><%=beanDate%></small>
								</div>
							</div>
						</div>
					</div>
				<%
						}
					}else{
				%>
					<div class="gallery-grid-item">
						등록된 게시글이 없습니다.
					</div>
				<%
					}
				%>
			</div>
			<hr />
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
	<script src="<%=contextPath%>/js/masonry.pkgd.min.js"></script>
	<script>
		$(document).ready(function(){
			setTimeout(function(){
				$(".gallery-grid").masonry({
					itemSelector : '.gallery-grid-item'
				}).addClass("active");
			},200)
		})
	</script>
</body>
</html>