package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CMT_DAO;
import domain.WRT_DAO;

/**
 * Servlet implementation class UpdateWRT
 */
public class UpdateWRT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String type_nbr = request.getParameter("type_nbr");
		String wrt_nbr = request.getParameter("wrt_nbr");
		String wrt_cnt = request.getParameter("content");
		WRT_DAO dao = new WRT_DAO();
		int result = dao.UpdateWRT(Integer.parseInt(wrt_nbr), wrt_cnt);
		response.sendRedirect("ShowWritingContent?type="+type+"&type_nbr="+type_nbr+"&wrt_nbr="+wrt_nbr);
		
	}

}
