<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String boardId = (String) session.getAttribute("boardId");
	String userId = (String) session.getAttribute("userId");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String encoding = "UTF-8";
	
	if (userId == null) {
		response.sendRedirect(contextPath + "/member/login.jsp");
	}

	String pageNum = "";
	String boardNum = "";
	
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
		String fileNameTemp = "";
		String oldFile1 = "";
		String oldFile2 = "";
		String oldFile3 = "";
		String newFile1 = "";
		String newFile2 = "";
		String newFile3 = "";
		
		for(int i=0; i<items.size(); i++) {
			
			FileItem fileItem = (FileItem)items.get(i);
			
			if(fileItem.isFormField()) {
				
				fieldName = fileItem.getFieldName();
				fieldString = fileItem.getString(encoding);
				
// 				System.out.println(fieldName + " = " + fieldString);
				
				if(fieldName.equals("userId")){
					boardBean.setUserId(fieldString);
				}else if(fieldName.equals("userName")){
					boardBean.setUserName(fieldString);
				}else if(fieldName.equals("boardPw")){
					boardBean.setBoardPw(fieldString);
				}else if(fieldName.equals("boardCategory")){
					boardBean.setBoardCategory(fieldString);
				}else if(fieldName.equals("boardSubject")){
					boardBean.setBoardSubject(fieldString);
				}else if(fieldName.equals("boardContent")){
					boardBean.setBoardContent(fieldString);
				}else if(fieldName.equals("pageNum")){
					pageNum = fieldString;
				}else if(fieldName.equals("boardNum")){
					boardNum = fieldString;
					boardBean.setBoardNum(Integer.parseInt(fieldString));
				}else if(fieldName.equals("oldFile1")){
					oldFile1 = fieldString;
				}else if(fieldName.equals("oldFile2")){
					oldFile2 = fieldString;
				}else if(fieldName.equals("oldFile3")){
					oldFile3 = fieldString;
				}
				
			}else {
				
				fieldName = fileItem.getFieldName();
				fileName = fileItem.getName();
				long fileSize = fileItem.getSize();

// 				System.out.println(fieldName + " = " + fileName);
				
// 				System.out.println("파라미터명: " + fieldName);
// 				System.out.println("파일명: " + fileName);
// 				System.out.println("파일크기: " + fileSize + "bytes");
				
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
					}else if(fieldName.equals("boardFile1")){
						newFile1 = fileName;
					}else if(fieldName.equals("boardFile2")){
						newFile2 = fileName;
					}else if(fieldName.equals("boardFile3")){
						newFile3 = fileName;
					}
					
					
				}//if
				
			}//if
			
		}//for
				
		if(!newFile1.equals("")){
			fileNameTemp += newFile1;
		}else if(!oldFile1.equals("")){
			fileNameTemp += oldFile1;
		}
		
		if(!newFile2.equals("")){
			if(!fileNameTemp.equals("")){
				fileNameTemp += ",";
			}
			fileNameTemp += newFile2;
		}else if(!oldFile1.equals("")){
			if(!fileNameTemp.equals("")){
				fileNameTemp += ",";
			}
			fileNameTemp += oldFile2;
		}
		
		if(!newFile3.equals("")){
			if(!fileNameTemp.equals("")){
				fileNameTemp += ",";
			}
			fileNameTemp += newFile3;
		}else if(!oldFile1.equals("")){
			if(!fileNameTemp.equals("")){
				fileNameTemp += ",";
			}
			fileNameTemp += oldFile3;
		}
		
		boardBean.setBoardFile(fileNameTemp);
		
	} catch (Exception e) {
		System.out.println("업로드 실패!: " + e.toString());
	}
		
	BoardDAO boardDAO = new BoardDAO();

	int result = boardDAO.updateBoard(boardBean, boardId);

	if (result == 1) {
%>
<script>
	alert("정상적으로 수정되었습니다.");
	location.href="read.jsp?pageNum=<%=pageNum%>&boardNum=<%=boardNum%>";
</script>
<%
	} else {
%>
<script>
	alert("비밀번호가 일치하지 않습니다.")
	history.back();
</script>
<%
	}
%>