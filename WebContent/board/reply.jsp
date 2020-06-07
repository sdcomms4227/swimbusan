<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="reply.ReplyBean"%>
<%@page import="reply.ReplyDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");

	String boardId = (String) session.getAttribute("boardId");
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");

	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	String pageNum = request.getParameter("pageNum");
	
	ReplyDAO replyDAO = new ReplyDAO();	
	List<ReplyBean> replyList = replyDAO.getReplyList(boardId, boardNum);

	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<body>
	<article class="mt-5">
		<div class="row">
			<div class="col-12">
				<h3>댓글</h3>
			</div>
		</div>
		<table class="table reply-list-table">
			<colgroup>
				<col style="width:80px" />
				<col />
				<col style="width:120px" />
			</colgroup>
			<%
				if (replyList.size() > 0) {
					for (int i = 0; i < replyList.size(); i++) {
						ReplyBean replyBean = replyList.get(i);
						int beanNum = replyBean.getReplyNum();
						String beanId = replyBean.getUserId();
						String beanName = replyBean.getUserName();
						String beanContent = replyBean.getReplyContent();
						String beanDate = sdf.format(replyBean.getReplyDate());
			%>
			<tr id="reply<%=beanNum%>">
				<td class="d-none d-lg-table-cell align-middle"><%=beanName%></td>
				<td class="text-left align-middle">
					<%=beanContent%>					
					<%
						if(userId!=null && userId.equals(beanId)){
					%>
						<button type="button" class="btn btn-sm btn-danger ml-2" onclick="replyDelete('<%=beanNum%>')">삭제</button>
					<%
						}
					%>
					<small class="d-block d-lg-none text-right mb-1 text-muted">
						<%=beanName%> | <%=beanDate%>
					</small>
				</td>
				<td class="d-none d-lg-table-cell text-center align-middle">
					<small><%=beanDate%></small>
				</td>
			</tr>
			<%
					}
				} else {
			%>
			<tr id="replyEmpty">
				<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
		<form name="replyform">
			<table class="table reply-form-table bg-light">
				<%
					if(userId==null){
				%>
					<tr>
						<td class="py-5 text-center bg-light">로그인 한 사용자만 댓글을 작성할 수 있습니다.</td>
					</tr>
				<%
					}else{
				%>
					<colgroup class="d-lg-none">
						<col />
						<col style="width:112px" />
					</colgroup>
					<colgroup class="d-none d-lg-table-column-group">
						<col style="width:80px" />
						<col />
						<col style="width:112px" />
					</colgroup>
					<tr>
						<td class="d-none d-lg-table-cell align-middle">
							<p class="m-0"><%=userName%></p>
						</td>
						<td class="pr-0">
							<p class="d-block d-lg-none text-left mb-1 text-muted"><%=userName%></p>
							<label for="replyContent" class="d-none">내용</label>
							<input class="form-control" type="text" name="replyContent" id="replyContent" required />
						</td>
						<td class="align-bottom">
							<button type="button" class="btn btn-primary" onclick="replySubmit()">댓글쓰기</button>
						</td>
					</tr>
				<%
					}
				%>
			</table>
		</form>
	</article>
	<script>
		function replySubmit(){
			
			var boardId = "<%=boardId%>";
			var boardNum = "<%=boardNum%>";
			var userId = "<%=userId%>";
			var userName = "<%=userName%>";
			var replyContent = document.replyform.replyContent.value;
			
			if(replyContent.length == 0){
				alert("댓글 내용을 입력해주세요.");
				document.replyform.replyContent.focus();
				return;
			}
			
			var _replyInfo = '{"boardId":"'+boardId+'","boardNum":"'+boardNum+'","userId":"'+userId+'","userName":"'+userName+'","replyContent":"'+replyContent+'"}';
						
			$.ajax({
				type : "post",
				async : "false",
				url : "<%=contextPath%>/replyServlet",
				data : {replyInfo : _replyInfo},
				success : function(data, status){
					var jsonInfo = JSON.parse(data);
					
					var ajaxNum = jsonInfo.replyNum;
					var ajaxName = jsonInfo.userName;
					var ajaxContent = jsonInfo.replyContent;
					var ajaxDate = jsonInfo.replyDate;
					
					var str = "";					
					
					str += '<tr id="reply' + ajaxNum + '">';
					str += '	<td class="d-none d-lg-table-cell align-middle">' + ajaxName + '</td>';
					str += '	<td class="text-left align-middle">';
					str += 			ajaxContent;				
					str += '		<button type="button" class="btn btn-sm btn-danger ml-2" onclick="replyDelete(\'' + ajaxNum + '\')">삭제</button>';
					str += '		<small class="d-block d-lg-none text-right mb-1 text-muted">';
					str += 				ajaxName + ' | ' + ajaxDate;
					str += '		</small>';
					str += '	</td>';
					str += '	<td class="d-none d-lg-table-cell text-center align-middle">';
					str += '		<small>' + ajaxDate + '</small>';
					str += '	</td>';
					str += '</tr>';
					
					$(".reply-list-table").append(str);
					
					$("#replyContent").val("");
					
					if($("#replyEmpty")){
						$("#replyEmpty").remove();
					}
						
				},
				error : function(){
					alert("통신에러가 발생했습니다.");	
				}				
			});
		}
		
		function replyDelete(replyNum){
			
			var result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result){	

				var userId = "<%=userId%>";
				
				var _replyDeleteInfo = '{"userId":"'+userId+'","replyNum":"'+replyNum+'"}';
							
				$.ajax({
					type : "post",
					async : "false",
					url : "<%=contextPath%>/replyDeleteServlet",
					data : {replyDeleteInfo : _replyDeleteInfo},
					success : function(data, status){
						if(data == "success"){
							var str = "<td class='alert alert-danger text-center' colspan='3'>댓글이 삭제되었습니다.</td>";						
							$("#reply" + replyNum).html(str).fadeOut(1000, function(){
								$(this).remove();
								if($(".reply-list-table").find("tr").length == 0){
									
									var emptyStr = "";
									
									emptyStr += '<tr id="replyEmpty">';
									emptyStr += '	<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>';
									emptyStr += '</tr>';
									
									$(".reply-list-table").append(emptyStr);
								}
							});
						}else{
							alert("댓글이 정상적으로 삭제되지 않았습니다.");
						}
					},
					error : function(){
						alert("통신에러가 발생했습니다.");	
					}				
				});
			}
		}
	</script>
</body>
</html>