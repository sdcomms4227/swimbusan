<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="pageName" value="수영 정보" />
<jsp:include page="/include/head.jsp" />
<body>
	<jsp:include page="/include/header.jsp" />
	<div class="container">
		<h1>${pageName}</h1>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>