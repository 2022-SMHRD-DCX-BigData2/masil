package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WRT_DAO;

/**
 * Servlet implementation class CreateWriting
 */
public class CreateWriting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int type = Integer.parseInt(request.getParameter("type"));
		int type_nbr = Integer.parseInt(request.getParameter("type_nbr"));
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		WRT_DAO dao = new WRT_DAO();
		
	}

}
