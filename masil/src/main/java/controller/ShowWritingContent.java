package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WRT;
import domain.WRT_DAO;

/**
 * Servlet implementation class ShowWritingContent
 */
public class ShowWritingContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wrt_nbr = Integer.parseInt(request.getParameter("wrt_nbr"));
		//번호에 해당하는 게시글과 댓글 정보 보내기
		WRT_DAO WRTdao = new WRT_DAO();
		WRT writing = WRTdao.selectWRTbyWrtNbr(wrt_nbr);
		System.out.println(writing.getWrt_cnt());
		//댓글은 나중에!
		request.setAttribute("comment", writing);
		request.setAttribute("writing", writing);
		RequestDispatcher rd1 = request.getRequestDispatcher("ShowWritingContent.jsp");
		rd1.forward(request, response);
		
	}

}
