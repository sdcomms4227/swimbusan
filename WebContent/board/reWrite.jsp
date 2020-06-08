<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String boardId = (String) session.getAttribute("boardId");
	String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/include/head.jsp" />
<%
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	
	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}
	
	String boardCategory = request.getParameter("boardCategory");
	String boardSubject = request.getParameter("boardSubject");
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int boardRe_ref = Integer.parseInt(request.getParameter("boardRe_ref"));
	int boardRe_lev = Integer.parseInt(request.getParameter("boardRe_lev"));
	int boardRe_seq = Integer.parseInt(request.getParameter("boardRe_seq"));
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
			<form action="reWritePro.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="<%=boardNum%>" />
				<input type="hidden" name="boardRe_ref" value="<%=boardRe_ref%>" />
				<input type="hidden" name="boardRe_lev" value="<%=boardRe_lev%>" />
				<input type="hidden" name="boardRe_seq" value="<%=boardRe_seq%>" />
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="userName" id="userName" value="<%=userName%>" readonly />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">비밀번호</label>
						</th>
						<td>
							<input class="form-control" type="password" name="boardPw" required />
						</td>
					</tr>
					<%
						if(boardId.equals("review")){
					%>
					<tr>
						<th class="align-middle">
							<label for="boardCategory" class="m-0">수영장</label>
						</th>
						<td>
							<input class="form-control" type="text" name="boardCategory" id="boardCategory" value="<%=boardCategory%>" readonly />
						</td>
					</tr>
					<% } %>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">제목</label>
						</th>
						<td>
							<input class="form-control" type="text" name="boardSubject" value="답글 : <%=boardSubject%>" required />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="userName" class="m-0">내용</label>
						</th>
						<td>
							<textarea class="form-control" name="boardContent" cols="40" rows="13" required></textarea>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label class="m-0">파일첨부</label>
						</th>
						<td>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="boardFile" id="boardFile" onchange="readURL(this)" />
								<label class="custom-file-label" for="boardFile">Choose file</label>
							</div>
						</td>
					</tr>
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-primary">답글쓰기</button>
				</div>
			</form>
		</article>
		<!-- 게시판 -->
	</section>
	<jsp:include page="/include/footer.jsp" />
	<script src="<%=contextPath%>/js/bs-custom-file-input.js"></script>
	<script src="<%=contextPath%>/js/image-preview.js"></script>
	<script>
		$(document).ready(function() {
			bsCustomFileInput.init()
		})
		
		function readURL(obj, allowType){
			var $preview  = $(obj).parent().siblings(".preview");

			if($preview.length){
				$preview.remove();
			}
			
			if(obj.files && obj.files[0]){
				var fileType = obj.files[0].type.split("/")[0];
				
				if(fileType=="image"){
					$preview = $("<div class='preview' />");
					$preview.appendTo($(obj).parent().parent());
					
					var reader = new FileReader();				
					reader.readAsDataURL(obj.files[0]);
					
					reader.onload = function(ProgressEvent){
						$preview.css("background-image", "url(" + ProgressEvent.target.result + ")");
					}
				}else{
					if(allowType=="image"){
						alert("이미지 파일만 첨부하실 수 있습니다.");
						obj.value = "";
					}
				}
			}
		}
	</script>
</body>
</html>