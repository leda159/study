package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/calc")
public class CalcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CalcController() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8"); //"text/html : MIME > 문서의 종류이다
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String op = request.getParameter("op");
		
		//num1 , num2 , op 를 받아서 Calc.java에 보낸다
		Calc c = new Calc(num1,num2,op);
		
		PrintWriter out = response.getWriter();
	
			out.println("<html>");
			out.println("<head><title>계산기</title></head>");
			out.println("<body>");
			out.println("<h2>계산결과</h2>");
			out.println(c.num1 + c.op + c.num2 + " = " + c.getResult());
			out.println("</body>");
			out.println("</html>");
	}
}
