<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//파일 업로드 위치
		String path = "c:\\upload";
	
		//파일 업로드시 메모리에서 처리가능하도록 하는 클래스
		DiskFileUpload upload = new DiskFileUpload();
		
		//파일 업로드시 파일 최대크기(1M)
		upload.setSizeMax(1000000);
		/* 메모리 버퍼 크기를 지정하는데 업로드 파일 크기가 4096
		바이트 이하이면 메모리에서 업로드 처리를 하고 4096바이트
		를 넘어가면 setRepositoryPath 메서드에서 지정한 임시
		폴더에서 작업후 업로드 처리 */
		upload.setSizeThreshold(4096);
		upload.setRepositoryPath(path);
		
		/* 파싱작업을 통해서 읽어올 파일 정보가 있는지 체크하여
		List 형태의 인터페이스 변수에 대입 */
		List items = upload.parseRequest(request);
		
		/* 자바 Collection Framework에서 Collection에
		저장되어 있는 값들을 읽어오는 인터페이스 */
		Iterator params = items.iterator();
		
		//다음에 가져올 데이터가 있는 true 없으면 false
		while(params.hasNext()){
			
			/* multipart/form-data로 전송된 form data를
			파일 혹은 폼 형태로 표현하는 인터페이스
			(FileItem) : 형변환(Casting) */
			FileItem item = (FileItem)params.next();
			
			/* 입력화면에서 type이 file로 선언되지 않은 속성에
			대해 처리 */
			if(item.isFormField()){
				//속성이름을 가져온다.
				String name = item.getFieldName();
				//실제 입력 값을 가져올 수 있다.
				String value = item.getString("utf-8");
				
				out.println(name + "=" + value + "<br>");
			}else{ //type이 file로 선언된 속성을 처리
				String fileFieldName = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				long fileSize = item.getSize();
				
				File file = new File(path + "/" + fileName);
				
				item.write(file);
				
				out.println("--------------------------<br>");
				out.println("요청 파라미터 이름:" + fileFieldName + "<br>");
				out.println("저장 파일 이름:" + fileName + "<br>");
				out.println("파일 콘텐츠 유형:" + contentType + "<br>");
				out.println("파일 크기:" + fileSize + "<br>");
				
			}
		}
	
		out.println("정상적으로 파일 업로드");
	%>
</body>
</html>