<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	BoardDAO dao = new BoardDAO();
	
	dao.updateReadCount(num);
	
	BoardBean boardbean = dao.getBoard(num);
	
	int DBNum = boardbean.getNum();
	int DBReadcount = boardbean.getReadcount();
	String DBName = boardbean.getName();
	Timestamp DBDate = boardbean.getDate();
	String DBSubject = boardbean.getSubject();
	String DBContent = "";
	String DBId = boardbean.getId();
	
	if(boardbean.getContent() != null){
		DBContent = boardbean.getContent().replace("\r\n", "<br>");
	}
	int DBRe_ref = boardbean.getRe_ref();
	int DBRe_lev = boardbean.getRe_lev();
	int DBRe_seq = boardbean.getRe_seq();
%>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="/inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li>
					<a href="#">Notice</a>
				</li>
				<li>
					<a href="#">Public News</a>
				</li>
				<li>
					<a href="#">Driver Download</a>
				</li>
				<li>
					<a href="#">Service Policy</a>
				</li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article>
			<h1>Notice Content</h1>
			<table id="notice">
				<colgroup>
					<col style="width:20%" />
					<col style="width:30%" />
					<col style="width:20%" />
					<col style="width:30%" />
				</colgroup>				
				<tr>
					<td>글번호</td>
					<td><%=DBNum%></td>
					<td>조회수</td>
					<td><%=DBReadcount%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=DBName%></td>
					<td>작성일</td>
					<td><%=DBDate%></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3" class="left"><%=DBSubject%></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td colspan="3" class="left"><%=DBContent%></td>
				</tr>
			</table>
			<div id="table_search">
				<%
					String id = (String)session.getAttribute("id");
					if(id!=null && id.equals(DBId)){
				%>
					<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&num=<%=DBNum%>'" />
					<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&num=<%=DBNum%>'" />
				<%
					}
					if(id!=null){
				%>
					<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?num=<%=DBNum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'" />
				<%
					}
				%>
				<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" />				
			</div>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="/inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>