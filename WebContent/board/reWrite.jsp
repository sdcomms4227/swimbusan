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
	String name = (String)session.getAttribute("name");

	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
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
			<form action="reWritePro.jsp" method="post">
				<input type="hidden" name="num" value="<%=num%>" />
				<input type="hidden" name="re_ref" value="<%=re_ref%>" />
				<input type="hidden" name="re_lev" value="<%=re_lev%>" />
				<input type="hidden" name="re_seq" value="<%=re_seq%>" />
				<table id="notice">
					<colgroup>
						<col style="width: 25%" />
						<col />
					</colgroup>
					<tr>
						<td>이름</td>
						<td class="left">
							<input type="text" name="name" value="<%=name%>" readonly />
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
							<input type="text" name="subject" value="[답글]" />
						</td>
					</tr>
					<tr>
						<td>글내용</td>
						<td class="left">
							<textarea name="content" cols="40" rows="13"></textarea>
						</td>
					</tr>
				</table>
				<div id="table_search">
					<input type="submit" value="답글작성" class="btn" />
					<input type="reset" value="다시작성" class="btn" />
					<input type="button" value="이전으로" class="btn" onclick="history.back()" />				
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