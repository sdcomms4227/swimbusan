<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="boardbean" class="board.BoardBean" />
<jsp:setProperty property="*" name="boardbean" />
<%
	boardbean.setDate(new Timestamp(System.currentTimeMillis()));
	boardbean.setIp(request.getRemoteAddr());
	boardbean.setId((String)session.getAttribute("id"));
	BoardDAO boarddao = new BoardDAO();
	boarddao.reInsertBoard(boardbean); 
	response.sendRedirect("notice.jsp");
%>