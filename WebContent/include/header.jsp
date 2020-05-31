<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	String pageId = (String) request.getAttribute("pageId");
	String groupId = (String) request.getAttribute("groupId");
%>
<header class="navbar navbar-expand-lg navbar-light">
	<div class="container d-flex justify-content-between">
		<a class="navbar-brand mr-5" href="<%=contextPath%>/index.jsp">
			<strong>SwimBusan</strong>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarGnb" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-between" id="navbarGnb">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("map")) out.print("active");%>" href="<%=contextPath%>/pool/map.jsp">수영장 지도</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("pool")) out.print("active");%>" href="<%=contextPath%>/pool/pool.jsp">수영장 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("review")) out.print("active");%>" href="<%=contextPath%>/board/review.jsp">수영장 후기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("info")) out.print("active");%>" href="<%=contextPath%>/board/info.jsp">수영 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("board")) out.print("active");%>" href="<%=contextPath%>/board/board.jsp">수다방</a>
				</li>
			</ul>
			<ul class="nav">
				<%
					if (userId == null) {
				%>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("login")) out.print("active");%>" href="<%=contextPath%>/member/login.jsp">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%if (pageId.equals("join")) out.print("active");%>" href="<%=contextPath%>/member/join.jsp">회원가입</a>
				</li>
				<%
					} else {
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="loggedDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span><%=userName%> 님</span><span class="caret"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="loggedDropdown">
						<a class="dropdown-item" href="<%=contextPath%>/member/modify.jsp">회원정보수정</a>
						<a class="dropdown-item" href="<%=contextPath%>/member/change.jsp">비밀번호변경</a>
						<a class="dropdown-item" href="<%=contextPath%>/member/leave.jsp">회원탈퇴</a>
						<a class="dropdown-item" href="<%=contextPath%>/member/logout.jsp">로그아웃</a>
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</header>