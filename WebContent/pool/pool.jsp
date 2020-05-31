<%@page import="java.util.List"%>
<%@page import="pool.PoolBean"%>
<%@page import="pool.PoolDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = "수영장 정보";
	request.setAttribute("pageName", pageName);
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");
	String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
	String category = (request.getParameter("category") != null) ? request.getParameter("category") : "";

	PoolDAO poolDao = new PoolDAO();

	int count = poolDao.getPoolCount(search);
	int pageSize = 10;
	String pageNum = (request.getParameter("pageNum") != null) ? request.getParameter("pageNum") : "1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize;
	
	List<PoolBean> list = null;

	if (count > 0) {
		list = poolDao.getPoolList(search, startRow, pageSize);
	}
%>
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12 col-lg-4">
				<h2><%=pageName%></h2>				
			</div>
			<div class="col-12 col-lg-8 text-right mt-lg-3">
				<small>클릭해서 상세정보를 확인하세요.</small>
				<button type="button" class="btn btn-sm btn-outline-secondary ml-3" onclick="hideContent()">모두 접기</button>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<table class="table text-center">
				<colgroup class="d-lg-none">
					<col />
					<col style="width:54px"/>
					<col style="width:54px"/>
					<col style="width:54px"/>
				</colgroup>
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:240px"/>
					<col />
					<col style="width:160px"/>
					<col style="width:120px"/>
					<col style="width:120px"/>
				</colgroup>
				<thead class="thead-light d-none d-lg-table-header-group">
					<tr>
						<th>수영장</th>
						<th>주소</th>
						<th>전화</th>
						<th>홈페이지</th>
						<th>지도보기</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (count > 0) {
							for (int i = 0; i < list.size(); i++) {
								PoolBean poolBean = list.get(i);
								int poolNum = poolBean.getPoolNum();
								String poolName = (poolBean.getPoolName()!=null) ? poolBean.getPoolName() : "";
								String poolAddress1 = (poolBean.getPoolAddress1()!=null) ? poolBean.getPoolAddress1() : "";
								String poolAddress2 = (poolBean.getPoolAddress2()!=null) ? poolBean.getPoolAddress2() : "";
								String poolTel = (poolBean.getPoolTel()!=null) ? poolBean.getPoolTel() : "";
								String poolUrl = (poolBean.getPoolUrl()!=null) ? poolBean.getPoolUrl() : "";
								String poolContent = (poolBean.getPoolContent()!=null) ? poolBean.getPoolContent().replace("\r\n","<br>") : "";
								String poolTel2 = poolTel;
								if(poolTel.lastIndexOf("~") > 0){
									int idx = poolTel.indexOf("~");
									poolTel2 = poolTel.substring(0, idx);
								}
					%>
						<tr onclick="toggleContent(this)" style="cursor:pointer">
							<td class="align-middle text-left">
								<%=poolName%>
								<small class="d-block d-lg-none mt-1 text-muted"><%=poolAddress1%> <%=poolAddress2%></small>
							</td>
							<td class="align-middle d-none d-lg-table-cell text-left"><%=poolAddress1%> <%=poolAddress2%></td>
							<td class="align-middle">
								<a class="d-none d-lg-block" href="tel:<%=poolTel2%>" onclick="window.event.cancelBubble = true"><%=poolTel%></a>
								<a class="h4 m-0 d-block d-lg-none" href="tel:<%=poolTel2%>" onclick="window.event.cancelBubble = true">
									<svg class="bi bi-phone" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M11 1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
									  <path fill-rule="evenodd" d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
									</svg>
								</a>
							</td>
							<td class="align-middle">
								<%
									if (poolUrl != null && !poolUrl.equals("")) {
								%>
									<a class="h4 m-0" href="<%=poolUrl%>" target="_blank" onclick="window.event.cancelBubble = true">
										<svg class="bi bi-house-door" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										  <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
										  <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
										</svg>
									</a>
								<%
									}
								%>
							</td>
							<td class="align-middle">
								<a class="h4 m-0" href="map.jsp?keyword=<%=poolName%>" onclick="window.event.cancelBubble = true">
									<svg class="bi bi-map" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M15.817.613A.5.5 0 0 1 16 1v13a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 14.51l-4.902.98A.5.5 0 0 1 0 15V2a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0l4.902.98 4.902-.98a.5.5 0 0 1 .415.103zM10 2.41l-4-.8v11.98l4 .8V2.41zm1 11.98l4-.8V1.61l-4 .8v11.98zm-6-.8V1.61l-4 .8v11.98l4-.8z"/>
									</svg>
								</a>
							</td>
						</tr>
						<tr class="poolcontent" style="display:none">
							<td colspan="5" class="py-5">
								<div class="text-left break-all"><%=poolContent%></div>
								<%
									if (userId != null && userId.equals("admin")) {
								%>
									<div class="text-right mt-3">
										<button type="button" class="btn btn-sm btn-warning" onclick="location.href='poolUpdate.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" onclick="location.href='poolDelete.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">삭제</button>
									</div>
								<% 
									}
								%>
							</td>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan="4">등록된 수영장이 없습니다.</td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					<form action="pool.jsp" class="form-inline justify-content-center justify-content-lg-start">
						<input type="hidden" name="category" value="" />
						<div class="input-group">
							<input type="text" name="search" size="24" maxlength="24" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
					<%
						if (userId != null && userId.equals("admin")) {
					%>
						<div class="form-group text-center text-lg-right">
							<button type="button" class="btn btn-secondary" onclick="location.href='poolWrite.jsp'">글쓰기</button>
						</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-12">				
					<ul class="pagination justify-content-center">
						<%
							if (count > 0) {
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
								int pageBlock = 5;
								int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
								int endPage = startPage + pageBlock - 1;
		
								if (endPage > pageCount) {
									endPage = pageCount;
								}
		
								String disabled1 = (startPage > pageBlock) ? "" : "disabled";
						%>
			   				<li class="page-item <%=disabled1%>">
								<a class="page-link" href="pool.jsp?pageNum=<%=startPage - pageBlock%>&search=<%=search%>">이전</a>
							</li>
						<%
								for (int i = startPage; i <= endPage; i++) {
									String active = (pageNum == null && i == 1 || Integer.parseInt(pageNum) == i) ? "active" : "";
						%>
			   				<li class="page-item <%=active%>">
								<a class="page-link" href="pool.jsp?pageNum=<%=i%>&search=<%=search%>"><%=i%></a>
							</li>
						<%
							}
							String disabled2 = (endPage < pageCount) ? "" : "disabled";
						%>
			   				<li class="page-item <%=disabled2%>">
								<a class="page-link" href="pool.jsp?pageNum=<%=startPage + pageBlock%>&search=<%=search%>">다음</a>
							</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="../include/footer.jsp" />
	<script>
		function toggleContent(obj){
			$(obj).next().toggle();
		}
		function hideContent(){
			$(".poolcontent").hide();
		}
	</script>
</body>
</html>