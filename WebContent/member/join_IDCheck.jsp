<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cpath = request.getContextPath();
	String id = request.getParameter("id");
	
	MemberDAO memberDao = new MemberDAO();
	int check = memberDao.idCheck(id);
	
	String pageTitle = "아이디 중복확인";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1" />
	<meta name="description" content="<%=pageTitle%>">
	<meta name="author" content="MinWooLEE">
	<meta name="format-detection" content="no">
	<meta name="format-detection" content="telephone=no, email=no, address=no">
	<title><%=pageTitle%></title>
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	<link rel="stylesheet" href="<%=cpath%>/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=cpath%>/css/style.css" />
</head>
<body>
	<div class="container">
		<form class="checkform py-5" action="join_IDCheck.jsp" method="post" name="checkform">	
			<div class="input-group">
				<div class="input-group-prepend">
					<label for="id" class="input-group-text">아이디</label>
				</div>
				<input type="text" class="form-control" name="id" id="id" value="<%=id%>" maxlength="20" required>
				<div class="input-group-append">
					<button class="btn btn-secondary" type="submit" onclick="winopen()">중복확인</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container text-center">
		<%
			if (check == 1) {
		%>
		
			<p class="alert alert-danger" role="alert"><mark class="px-2"><%=id%></mark>는 사용할 수 없습니다.</p>
		<%
			} else {
		%>
			<p class="alert alert-success" role="alert"><mark class="px-2"><%=id%></mark>는 사용이 가능합니다.</p>
			<button class="btn btn-secondary" type="button" onclick="result()">사용하기</button>
		<%
			}
		%>
	</div>
	<script>
		function result() {
			opener.document.joinform.id.value = document.checkform.id.value;
			window.close();
		}
	</script>
</body>
</html>