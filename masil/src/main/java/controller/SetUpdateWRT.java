package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetUpdateWRT
 */
public class SetUpdateWRT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("UpdateWRT.jsp"); 
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
		    String name = (String)params.nextElement();
		    String value = request.getParameter(name);
		    request.setAttribute(name, value);
		}
		rd.forward(request, response);

		
	}

}
