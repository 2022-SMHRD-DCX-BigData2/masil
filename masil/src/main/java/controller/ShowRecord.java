package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.WLK_LOG;
import domain.WLK_LOG_DAO;

/**
 * Servlet implementation class ShowRecord
 */
public class ShowRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		WLK_LOG_DAO dao = new WLK_LOG_DAO();
		List<WLK_LOG> logs = dao.getLogs(mbr_nbr);
		/*
		for (WLK_LOG wlk_LOG : logs) {
			System.out.println(wlk_LOG.getWlk_nbr_for_wlk_log());
			System.out.println(wlk_LOG.getWlk_rt_nbr_for_wlk_log());
			System.out.println(wlk_LOG.getWlk_time());
			System.out.println(wlk_LOG.getWlk_dog_list());
		}
		*/
		HttpSession session = request.getSession();
		session.setAttribute("logs",logs);
		response.sendRedirect("ShowRecord.jsp");
		
		
		
		
	}

}
