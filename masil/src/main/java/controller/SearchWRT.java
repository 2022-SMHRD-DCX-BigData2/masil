package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;
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
		String target = request.getParameter("target");
		int type = Integer.parseInt(request.getParameter("type"));
		int type_nbr = Integer.parseInt(request.getParameter("type_nbr"));

		WRT_DAO dao = new WRT_DAO();
		List<WRT> searchResult = null;
		if(request.getParameter("ttl_or_cnt").equals("ttl")) {
			searchResult = dao.searchWRTbyTTL(target, type, type_nbr);
		}else {
			MBR_DAO daoMBR = new MBR_DAO();
			int mbr_nbr = daoMBR.getNbr(target).intValue();
			searchResult = dao.searchWRTbyATH(mbr_nbr, type, type_nbr);
		}
		request.setAttribute("type", type);
		request.setAttribute("type_nbr", type_nbr);
		request.setAttribute("Writing", searchResult);
		RequestDispatcher rd1 = request.getRequestDispatcher("ShowWriting.jsp");
		rd1.forward(request, response);

		
		
	}

}
