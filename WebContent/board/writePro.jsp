<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");

	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String boardPw = request.getParameter("boardPw");
	String boardSubject = request.getParameter("boardSubject");
	String boardContent = request.getParameter("boardContent");
	String boardIp = request.getRemoteAddr();

	BoardBean boardBean = new BoardBean();
	boardBean.setUserId(userId);
	boardBean.setUserName(userName);
	boardBean.setBoardPw(boardPw);
	boardBean.setBoardSubject(boardSubject);
	boardBean.setBoardContent(boardContent);
	boardBean.setBoardIp(boardIp);

	BoardDAO boardDAO = new BoardDAO();

	boardDAO.insertBoard(boardBean);

	response.sendRedirect("board.jsp");
%>