package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WRT;
import domain.WRT_DAO;

/**
 * Servlet implementation class CreateWriting
 */
public class CreateWriting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		System.out.println(type);
		String type_nbr = request.getParameter("type_nbr");
		System.out.println(type_nbr);
		String mbr_nbr = request.getParameter("mbr_nbr");
		System.out.println(mbr_nbr);
		String title = request.getParameter("title");
		System.out.println(title);
		String content = request.getParameter("content");
		System.out.println(content);
		
		WRT writing = new WRT(title,content,new BigDecimal(mbr_nbr),new BigDecimal(type),new BigDecimal(type_nbr));		
		WRT_DAO dao = new WRT_DAO();
		int result = dao.insertWRT(writing);
		if(result>0) {
			System.out.println("글 등록 성공함");
			if(type.equals("1")) {
				if(type_nbr.equals("0")) {
					response.sendRedirect("Writing?wrt_type="+type+"&type_nbr="+type_nbr);
				}
			}else if(type.equals("2")) {
				response.sendRedirect("ShowWalkingRt.jsp?wlk_rt_nbr="+type_nbr);
			}			
		}else {
			//실패 페이지로
			System.out.println("글 등록 실패함");
		}
		
		
	}

}
