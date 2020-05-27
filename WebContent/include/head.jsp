<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cpath = request.getContextPath();
	String userId = (session.getAttribute("userId") != null) ? (String) session.getAttribute("userId") : null;
	String userName = (session.getAttribute("userName") != null) ? (String) session.getAttribute("userName") : null;
	String pageName = (request.getAttribute("pageName") != null) ? (String) request.getAttribute("pageName") : null;
	String pageTitle = (pageName != null) ? pageName + " | SwimBusan" : "SwimBusan";

	String pageId = null;
	String groupId = null;
	String[] uri = request.getRequestURI().split("/");
	
	System.out.println(uri.toString());
		
	if (uri.length >= 2) {
		pageId = uri[uri.length - 1].replace(".jsp", "");
		groupId = uri[uri.length - 2];
	}

	request.setAttribute("pageId", pageId);
	request.setAttribute("groupId", groupId);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1" />
	<meta name="description" content="<%=pageTitle%>">
	<meta name="author" content="MinWooLEE">
	<meta name="format-detection" content="no">
	<meta name="format-detection" content="telephone=no, email=no, address=no">
	<title><%=pageTitle%></title>
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	<link rel="stylesheet" href="<%=cpath%>/css/bootstrap.min.css" />
	<%
		if (groupId != null && !groupId.equals("") && !groupId.equals("swimbusan")) {
	%>
	<link rel="stylesheet" href="<%=cpath%>/css/<%=groupId%>.css" />
	<%
		}
	%>
	<link rel="stylesheet" href="<%=cpath%>/css/style.css" />
	<script src="<%=cpath%>/js/jquery-3.4.1.min.js"></script>
	<script src="<%=cpath%>/js/bootstrap.min.js"></script>
</head>