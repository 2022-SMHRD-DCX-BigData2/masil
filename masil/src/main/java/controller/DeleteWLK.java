package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WLK_DAO;

/**
 * Servlet implementation class DeleteWLK
 */
public class DeleteWLK extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int wlk_nbr = Integer.parseInt(request.getParameter("wlk_nbr"));
		WLK_DAO dao = new WLK_DAO();
		int result = dao.DeleteWLK(wlk_nbr);
		
		
		
	}

}
