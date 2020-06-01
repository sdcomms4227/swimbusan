<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");

	String boardId = (String) session.getAttribute("boardId");
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	String boardPw = request.getParameter("boardPw");
	String pageNum = request.getParameter("pageNum");

	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.deleteBoard(boardNum, boardPw, boardId);

	if (result == 1) {
%>
	<script>
		alert("정상적으로 삭제되었습니다.");
		location.href = "<%=boardId%>.jsp?pageNum=<%=pageNum%>";
	</script>
<%
	} else if (result == -1) {
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
	} else if (result == 0) {
%>
	<script>
		alert("게시글이 존재하지 않습니다.");
		history.back();
	</script>
<%
	}
%>