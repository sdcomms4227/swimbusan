<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "메인";
	request.setAttribute("pageName", pageName);
%>
<jsp:include page="./include/head.jsp" />
<body>
	<jsp:include page="./include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
	</section>
	<jsp:include page="./include/footer.jsp" />
</body>
</html>