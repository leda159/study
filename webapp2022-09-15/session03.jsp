<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name,value;
		
		//나열형 인터페이스
		//getAttributeNames?
		//속성이름을 모두 가져와서 나열형 변수에 대입		
		Enumeration en = session.getAttributeNames();
		int i=0;
		
		//다음에 가져올 데이터가 있는지 여부 체크
		while(en.hasMoreElements()){
			i++;
			//다음 데이터를 가져온다.
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println("설정된 세션 속성 이름[" + i + "]:" + name + "<br>");
			out.println("설정된 세션 속성 값[" + i + "]:" + value + "<br>");
		}
		
		//비밀번호 속성값이 삭제된다.
		session.removeAttribute("userPW");
		
		
		
		
		
		
	
		
		
		en = session.getAttributeNames();
		i=0;
		
		//다음에 가져올 데이터가 있는지 여부 체크
		while(en.hasMoreElements()){
			i++;
			//다음 데이터를 가져온다.
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println("삭제후 설정된 세션 속성 이름[" + i + "]:" + name + "<br>");
			out.println("삭제후 설정된 세션 속성 값[" + i + "]:" + value + "<br>");
		}
		
		//모든 세션 속성값을 삭제
		session.invalidate();
		
		
		
		
		
		
		
		
		
		
		en = session.getAttributeNames();
		i=0;
		
		//다음에 가져올 데이터가 있는지 여부 체크
		while(en.hasMoreElements()){
			i++;
			//다음 데이터를 가져온다.
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println("모든 속성 삭제후 설정된 세션 속성 이름[" + i + "]:" + name + "<br>");
			out.println("모든 속성 삭제후 설정된 세션 속성 값[" + i + "]:" + value + "<br>");
		}
		
		
	%>
</body>
</html>



