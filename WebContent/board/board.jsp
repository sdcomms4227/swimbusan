<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수다방";
	request.setAttribute("pageName",pageName);
%>
<jsp:include page="/include/head.jsp" />
<%
	request.setCharacterEncoding("UTF-8");

	String search = (request.getParameter("search")!=null) ? request.getParameter("search") : "";	
	
	BoardDAO boardDao = new BoardDAO();
	
	int count = boardDao.getBoardCount();
	
	int pageSize = 10;
	
	String pageNum = (request.getParameter("pageNum") != null) ? request.getParameter("pageNum") : "1";

	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage - 1) * pageSize;
	
	List<BoardBean> list = null;
	
	if (count > 0) {
		list = boardDao.getBoardList(startRow, pageSize, search);
	}
%>
<body>
	<jsp:include page="/include/header.jsp" />
	<section class="container py-5">
		<div class="row">
			<div class="col-10"><h2><%=pageName%></h2></div>
			<div class="col-2 text-right"><p>Total : <%=count%></p></div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			
			<table class="table table-hover text-center">
				<colgroup>
					<col />
					<col style="width:60%"/>
					<col />
					<col />
					<col />
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (count > 0) {
							for (int i = 0; i < list.size(); i++) {
								BoardBean boardBean = list.get(i);
					%>
					<tr onclick="location.href='content.jsp?num=<%=boardBean.getBoardNum()%>&pageNum=<%=pageNum%>'" style="cursor:pointer">
						<td><%=boardBean.getBoardNum()%></td>
						<td class="text-left">
							<%
								int wid = 0;
								if(boardBean.getBoardRe_lev() > 0){
									wid = boardBean.getBoardRe_lev() * 10;
							%>
							<img src="../images/center/re.gif" style="margin-left:<%=wid%>px" />
							<%
								}
							%>
							<%=boardBean.getBoardSubject()%>
						</td>
						<td><%=boardBean.getUserName()%></td>
						<td><%=new SimpleDateFormat("yyyy.MM.dd").format(boardBean.getBoardDate())%></td>
						<td><%=boardBean.getBoardCount()%></td>
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
				<div class="col-4">
				</div>
				<div class="col-4">
					<form action="board.jsp">
						<div class="input-group">
							<input type="text" name="search" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">검색</button> 
							</div>
						</div>
					</form>
				</div>
				<div class="col-4 text-right">
					<%
						String userId = (String) session.getAttribute("userId");
						if (userId != null) {
					%>
						<div class="form-group">
							<input type="button" value="글쓰기" class="btn btn-secondary pull-right" onclick="location.href='write.jsp'" />
						</div>
					<%
						}
					%>
				</div>
			</div>
			
			<div id="page_control">
				<%
					if (count > 0) {
						//전체 페이지수 구하기 	글 20개 한 페이지에 보여줄 글 수 10개 => 2 페이지
						//					글 25개 한 페이지에 보여줄 글 수 10개 => 3 페이지
						//조건 삼항 연산자	조건 ? 참 : 거짓
						//전체 페이지 수 = 전체글 수 / 한 페이지에 보여줄 글 수 + (전체글 수를 한 페이지에 보여줄 글 수로 나눈 나머지 값)
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

						//한 블럭에 묶여질 페이지 번호 수 설정
						int pageBlock = 5;

						//시작페이지 번호 구하기
						//1~10 => 1, 11~20 => 11, 21~30 => 21
						//((선택한 페이지 번호 / 한 블럭에 보여지는 페이지 번호 수) - (선택한 페이지 번호를 한 화면에 보여줄 페이지수로 나눈 나머지 값)) * 한 블럭에 보여줄 페이지 수 + 1
						int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

						//끝페이지 번호 구하기
						//1~10 => 10, 11~20 => 20. 21~30 => 30
						//시작페이지 번호 + 현재블럭에 보여줄 페이지 수 - 1
						int endPage = startPage + pageBlock - 1;

						//끝페이지 번호가 전체페이지 수보다 클 때
						if (endPage > pageCount) {
							//끝페이지 번호를 전체페이지수로 저장
							endPage = pageCount;
						}

						//[이전] 시작페이지 번호가 한 화면에 보여줄 페이지수보다 클 때..
						if (startPage > pageBlock) {
				%>
				<a href="noticeSearch.jsp?pageNum=<%=startPage - pageBlock%>&search=<%=search%>">[이전]</a>
				<%
					}
						//[1][2][3]...[10]
						for (int i = startPage; i <= endPage; i++) {
							String active = (pageNum == null && i == 1 || Integer.parseInt(pageNum) == i)
									? "class='active'"
									: "";
				%>
				<a href="noticeSearch.jsp?pageNum=<%=i%>&search=<%=search%>" <%=active%>>
					[<%=i%>]
				</a>
				<%
					}

						//[다음] 끝페이지 번호가 전체 페이지수보다 작을 때..
						if (endPage < pageCount) {
				%>
				<a href="noticeSearch.jsp?pageNum=<%=startPage + pageBlock%>&search=<%=search%>">[다음]</a>
				<%
					}
					}
				%>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>