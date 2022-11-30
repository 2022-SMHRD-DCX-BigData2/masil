package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WRT;
import domain.WRT_DAO;

/**
 * Servlet implementation class SearchWRT
 */
public class SearchWRT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		request.getParameter(getServletName());
		
		WRT_DAO dao = new WRT_DAO();
		List<WRT> searchResult = dao.searchWRTbyTTL("", 0, 0);
		
		
	}

}
