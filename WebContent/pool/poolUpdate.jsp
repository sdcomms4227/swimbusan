<%@page import="pool.PoolBean"%>
<%@page import="pool.PoolDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String pageName = "수영장 정보";
request.setAttribute("pageName", pageName);
String contextPath = request.getContextPath();
request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");

	if (userId == null || !userId.equals("admin")) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	String pageNum = request.getParameter("pageNum");
	int poolNum = Integer.parseInt(request.getParameter("poolNum"));

	PoolDAO poolDAO = new PoolDAO();

	PoolBean poolBean = poolDAO.getPool(poolNum);

	int updateNum = poolBean.getPoolNum();
	String updateName = (poolBean.getPoolName() != null) ? poolBean.getPoolName() : "";
	String updateZipcode = (poolBean.getPoolZipcode() != 0) ? Integer.toString(poolBean.getPoolZipcode()) : "";
	String updateAddress1 = (poolBean.getPoolAddress1() != null) ? poolBean.getPoolAddress1() : "";
	String updateAddress2 = (poolBean.getPoolAddress2() != null) ? poolBean.getPoolAddress2() : "";
	String updateTel = (poolBean.getPoolTel() != null) ? poolBean.getPoolTel() : "";
	String updateUrl = (poolBean.getPoolUrl() != null) ? poolBean.getPoolUrl() : "";
	String updateContent = (poolBean.getPoolContent() != null) ? poolBean.getPoolContent().replace("<br>", "\r\n") : "";
%>
<body>
	<jsp:include page="/include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2><%=pageName%></h2>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<form action="poolUpdatePro.jsp" method="post">
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="hidden" name="poolNum" value="<%=poolNum%>" />
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="poolName" class="m-0">수영장 이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="poolName" id="poolName" value="<%=updateName%>" required />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolZipcode" class="m-0">우편번호</label>
						</th>
						<td>
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="poolZipcode" id="poolZipcode" value="<%=updateZipcode%>" maxlength="5" placeholder="00000">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" onclick="daumPostcode()">우편번호 찾기</button>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">주소1</label>
						</th>
						<td>
							<input type="text" class="form-control" name="poolAddress1" id="poolAddress1" value="<%=updateAddress1%>" maxlength="50">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolAddress2" class="m-0">주소2</label>
						</th>
						<td>
							<input type="text" class="form-control" name="poolAddress2" id="poolAddress2" value="<%=updateAddress2%>" maxlength="50">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolTel" class="m-0">전화번호</label>
						</th>
						<td>
							<input type="tel" class="form-control" name="poolTel" id="poolTel" value="<%=updateTel%>" maxlength="20" placeholder="000-0000-0000~0">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolUrl" class="m-0">홈페이지</label>
						</th>
						<td>
							<input type="tel" class="form-control" name="poolUrl" id="poolUrl" value="<%=updateUrl%>" maxlength="50" placeholder="http://www.naver.com">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolContent" class="m-0">상세정보</label>
						</th>
						<td>
							<textarea class="form-control" name="poolContent" id="poolContent" cols="40" rows="13" required><%=updateContent%></textarea>
						</td>
					</tr>
				</table>
				<div class="text-center my-5">
					<input type="button" value="취소" class="btn btn-secondary" onclick="history.back()" />
					<input type="submit" value="수정" class="btn btn-warning" />
				</div>
			</form>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>















