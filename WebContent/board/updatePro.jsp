<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="boardbean" class="board.BoardBean" />
<jsp:setProperty property="*" name="boardbean" />
<%
	BoardDAO boarddao = new BoardDAO();

	int check = boarddao.updateBoard(boardbean);

	if (check == 1) {
%>
<script>
	alert("수정성공");
	location.href="notice.jsp?pageNum=<%=pageNum%>";
</script>
<%
	} else {
%>
<script>
	alert("비밀번호틀림")
	history.back();
</script>
<%
	}
%>