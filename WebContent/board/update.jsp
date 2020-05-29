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
	String id = (String)session.getAttribute("id");

	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	BoardDAO dao = new BoardDAO();
	
	BoardBean boardbean = dao.getBoard(num);
	
	int DBNum = boardbean.getNum();
	String DBName = boardbean.getName();
	String DBSubject = boardbean.getSubject();
	String DBContent = "";
	String DBId = boardbean.getId();
	
	if(boardbean.getContent() != null){
		DBContent = boardbean.getContent().replace("\r\n", "<br>");
	}
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
			<form action="updatePro.jsp" method="post">
				<input type="hidden" name="num" value="<%=num%>" />
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<table id="notice">
					<colgroup>
						<col style="width: 25%" />
						<col />
					</colgroup>
					<tr>
						<td>이름</td>
						<td class="left">
							<input type="text" name="name" value="<%=DBName%>" readonly />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="left">
							<input type="password" name="passwd" />
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td class="left">
							<input type="text" name="subject" value="<%=DBSubject%>" />
						</td>
					</tr>
					<tr>
						<td>글내용</td>
						<td class="left">
							<textarea name="content" cols="40" rows="13"><%=DBContent%></textarea>
						</td>
					</tr>
				</table>
				<div id="table_search">
					<input type="submit" value="글수정" class="btn" />
					<input type="reset" value="다시작성" class="btn" />
					<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" />				
				</div>
			</form>
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