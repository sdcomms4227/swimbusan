<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수영장 지도";
	request.setAttribute("pageName",pageName);
%>
<jsp:include page="/include/head.jsp" />
<body>
	<jsp:include page="/include/header.jsp" />
	<div class="container">
		<h1><%=pageName%></h1>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>