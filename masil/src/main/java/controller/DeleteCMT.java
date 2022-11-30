package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.CMT_DAO;
import domain.MBR;

/**
 * Servlet implementation class DeleteCMT
 */
public class DeleteCMT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int cmt_id = Integer.parseInt(request.getParameter("cmt_id"));
		String type = request.getParameter("type");
		String wrt_nbr = request.getParameter("wrt_nbr");
		CMT_DAO dao = new CMT_DAO();
		int result = dao.DeleteCMT(cmt_id);
		if(result>0) {
			//response.sendRedirect("ShowWritingContent?type="+wrt_type+"&wrt_nbr="+wrt_nbr);
			response.sendRedirect("ShowWritingContent?type="+type+"&wrt_nbr="+wrt_nbr);
		}
		
	}

}
