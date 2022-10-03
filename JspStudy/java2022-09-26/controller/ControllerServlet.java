package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginBean;

//HttpServlet을 상속을 받아서 서블릿 선언
public class ControllerServlet extends HttpServlet {

	
	//
	private static final long serialVersionUID = 1L;
	
	

	//전송방식이 post인 경우처리 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		
		//jsp 입력화면에서 입력한 값을 가져온다.
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		
		//LoginBean 클래스의 인스턴스를 생성한다
		LoginBean bean = new LoginBean(); 
		
		
		bean.setId(id); //입력화면에서 받아온 아이디값을 set함 
		bean.setPassword(passwd);
		request.setAttribute("bean", bean); //속성을 지정한다      bean:아이디와 비밀번호를 가지고있는 속성
		
		//scope(유효범위)?
		  //pageContext:request,reponse객체 속성값의 유효범위가 현재 페이지에서만 유효
		  //request:서버가 response하기 전까지 속성값 유효
		  //session:브라우저가 close되거나 session 속성값이 삭제되기 전까지 속성값 유효
		  //application: 톰캣 서버가 stop 되기전까지나 프로그램 종료전까지 속성값 유효
		boolean status = bean.validate();
		
		//RequestDispatcher : 클라이언트의 요청을 jsp/servlet내에서 원하는 자원으로 요청을 넘기는 역할을 하거나 처리된 결과를 얻어오는 기능
		
		if(status) {
			RequestDispatcher rd = request.getRequestDispatcher("mvc_success.jsp");
			rd.forward(request, response);
		}else {
			
			RequestDispatcher rd = request.getRequestDispatcher("mvc_error.jsp");
			rd.forward(request, response);
			
		}
	}
	
	//전송 방식이 get인 경우 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req,resp);
	}
}
