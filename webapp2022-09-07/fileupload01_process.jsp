<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//cos.jar 파일을 이용하여 업로드 처리
	//MultipartRequest multi = new : 인스턴스 생성    MultipartRequest : 생성자 생성
	MultipartRequest multi = new MultipartRequest(
			request,         //내장객체
			"C:\\upload",    //업로드 위치
			5 * 1024 * 1024, //업로드 파일 크기
			"utf-8",         //인코딩 방식
			new DefaultFileRenamePolicy());//같은 이름의 파일이 올라오면 numbering을 한다
											// 기존에 test.jpg가 있으면 test1.jpg가 된다
	
	//입력화면의 모든 속성이름을 가져와서 열거형인 Enumeration 변수에 대입
	Enumeration params = multi.getParameterNames();
	
			
	//다음에 가져올 데이터가 있으면 true 없으면 false
	while(params.hasMoreElements()){
		String name = (String) params.nextElement();
		
		//입력화면에서 입력한 값을 가져온다
		String value = multi.getParameter(name);
		out.println(name + " = " + value + "<br>");
		
	}
	out.println("------------------------<br>");
	
	//입력화면에서 업로드 한 파일명을 가져와서 files 변수에 대입
	Enumeration files = multi.getFileNames();
	
	while (files.hasMoreElements()){
		String name = (String)files.nextElement();
		String filename = multi.getFilesystemName(name);   //서버에 올라간 파일
		String original = multi.getOriginalFileName(name); //원본 파일명
		String type = multi.getContentType(name);         //업로드 한 파일의 MIME 형태를 출력(jpg,gif)
		File file = multi.getFile(name);				  //업로드 한 파일 이름
	
	
	out.println("요청 파라미터 이름: " + name + "<br>");
	out.println("실제 파일 이름: " + original + "<br>");
	out.println("저장 파일 이름: " + filename + "<br>");
	out.println("파일 콘텐츠 유형: " + type + "<br>");
	
		if(file != null){
			out.println("파일 크기:" + file.length());
			out.println("<br>");
		}
	}	
	%>
	
	
	
	<!-- c드라이브에 upload 폴더 생성 -->
	
	
	
</body>
</html>