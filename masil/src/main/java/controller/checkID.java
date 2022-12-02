package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;

/**
 * Servlet implementation class checkID
 */
public class checkID extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String check = request.getParameter("check");
		MBR_DAO dao = new MBR_DAO();
		BigDecimal result = dao.checkID(check);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//System.out.println(result);
		if(result.intValue()==0) {
			out.print("새로운 아이디");
		}else {
			out.print("중복");
		}
		
		
	}

}
