package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CMT_DAO;
import domain.WRT_DAO;

/**
 * Servlet implementation class DeleteWRT
 */
public class DeleteWRT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int wrt_nbr = Integer.parseInt(request.getParameter("wrt_nbr"));
		System.out.println(wrt_nbr);
		int type = Integer.parseInt(request.getParameter("type"));
		int type_nbr = Integer.parseInt(request.getParameter("type_nbr"));
		WRT_DAO dao = new WRT_DAO();
		int result = dao.DeleteWRT(wrt_nbr);
		
	}

}
