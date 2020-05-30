<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String userId = (String) session.getAttribute("userId");
	
	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	request.setCharacterEncoding("UTF-8");
	String encoding = "UTF-8";
	
	BoardBean boardBean = new BoardBean(); 
	
	String realPath = request.getServletContext().getRealPath("/file");
	
	File currentDirPath = new File(realPath);	
	DiskFileItemFactory factory = new DiskFileItemFactory();	
	factory.setSizeThreshold(1024 * 1024 * 1);	
	factory.setRepository(currentDirPath);
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	try {
		List<FileItem> items = upload.parseRequest(request);
		
		String fieldName = "";
		String fileName = "";
		String fieldString = "";
		
		for(int i=0; i<items.size(); i++) {
			
			FileItem fileItem = (FileItem)items.get(i);
			
			if(fileItem.isFormField()) {
				
				fieldName = fileItem.getFieldName();
				fieldString = fileItem.getString(encoding);
				
				System.out.println(fieldName + " = " + fieldString);
				
				if(fieldName.equals("userId")){
					boardBean.setUserId(fieldString);
				}else if(fieldName.equals("userName")){
					boardBean.setUserName(fieldString);
				}else if(fieldName.equals("boardPw")){
					boardBean.setBoardPw(fieldString);
				}else if(fieldName.equals("boardSubject")){
					boardBean.setBoardSubject(fieldString);
				}else if(fieldName.equals("boardContent")){
					boardBean.setBoardContent(fieldString);
				}else if(fieldName.equals("boardRe_ref")){
					boardBean.setBoardRe_ref(Integer.parseInt(fieldString));
				}else if(fieldName.equals("boardRe_lev")){
					boardBean.setBoardRe_lev(Integer.parseInt(fieldString));
				}else if(fieldName.equals("boardRe_seq")){
					boardBean.setBoardRe_seq(Integer.parseInt(fieldString));
				}
				
			}else {
				
				fieldName = fileItem.getFieldName();
				fileName = fileItem.getName();
				long fileSize = fileItem.getSize();

				System.out.println(fieldName + " = " + fileName);
				
				System.out.println("파라미터명: " + fieldName);
				System.out.println("파일명: " + fileName);
				System.out.println("파일크기: " + fileSize + "bytes");
				
				if(fileSize > 0) {
					
					int idx = fileName.lastIndexOf("\\");
					
					if(idx == -1) {
						idx = fileName.lastIndexOf("/");
					}
					
					fileName = fileName.substring(idx+1);
					
					File uploadFile = new File(currentDirPath + "\\" + fileName);
					
					fileItem.write(uploadFile);

					if(fieldName.equals("boardFile")){
						boardBean.setBoardFile(fileName);
					}
				}//if
				
			}//if
			
		}//for
		
	} catch (Exception e) {
		System.out.println("업로드 실패!: " + e.toString());
	}
	
	boardBean.setBoardIp(request.getRemoteAddr());
	boardBean.setUserId((String)session.getAttribute("userId"));

	BoardDAO boardDAO = new BoardDAO();

	int result = boardDAO.reInsertBoard(boardBean);

	if (result == 1) {
%>
	<script>
		alert("답글이 정상적으로 등록었습니다.");
		location.href = "board.jsp";
	</script>
<%
	}else if(result == -1){
%>
	<script>
		alert("제목을 입력해주세요.");
		history.back();
	</script>
<%
	}else if(result == -2){
%>
	<script>
		alert("내용을 입력해주세요.");
		history.back();
	</script>
<%
	}else if(result == -3){
%>
	<script>
		alert("비밀번호를 입력해주세요.");
		history.back();
	</script>
<%
	}
%>