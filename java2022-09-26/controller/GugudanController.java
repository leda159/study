package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GugudanModel;


@WebServlet("/gugudanResult") 	/* annotation(어노테이션) */
public class GugudanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public GugudanController() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		
		GugudanModel g = new GugudanModel();
		
		String result = g.getResult(num);
		
		request.setAttribute("result", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		
		rd.forward(request,response);
	}

}
