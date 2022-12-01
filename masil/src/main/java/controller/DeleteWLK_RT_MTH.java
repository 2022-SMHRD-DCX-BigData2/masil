package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MTH_WLK_RT_NAME_DAO;

/**
 * Servlet implementation class DeleteWLK_RT_MTH
 */
public class DeleteWLK_RT_MTH extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int wlk_rt_nbr = Integer.parseInt(request.getParameter("wlk_rt_nbr"));
		MTH_WLK_RT_NAME_DAO dao = new MTH_WLK_RT_NAME_DAO();
		int result = dao.DeleteWLK_RT_MTH(wlk_rt_nbr);
		
		
	}

}
