package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CMT;
import domain.CMT_DAO;

/**
 * Servlet implementation class insertCMT
 */
public class insertCMT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("테스트");
		request.setCharacterEncoding("UTF-8");
		String wrt_nbr = request.getParameter("wrt_nbr");
		String cmt_ath = request.getParameter("cmt_ath");
		String cmt_cnt = request.getParameter("cmt_cnt");
		String wrt_type = request.getParameter("wrt_type");
		String type_nbr = request.getParameter("type_nbr");
		CMT cmt = new CMT(new BigDecimal(wrt_nbr),new BigDecimal(cmt_ath),cmt_cnt);
		CMT_DAO dao = new CMT_DAO();
		int result = dao.insertCMT(cmt);
		if(result>0) {
			System.out.println("댓글 등록 성공");
			//response.sendRedirect(request.getHeader("referer"));
			response.sendRedirect("ShowWritingContent?type="+wrt_type+"&type_nbr="+type_nbr+"&wrt_nbr="+wrt_nbr);
		}else {
			System.out.println("댓글 등록 실패");
		}
		
	}

}
