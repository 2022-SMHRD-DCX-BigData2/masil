package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.MBR;
import domain.MBR_DAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String mbr_id = request.getParameter("mbr_id");
		String mbr_pw = request.getParameter("mbr_pw");
		
		MBR loginedMbr = new MBR(mbr_id, mbr_pw);	
		MBR_DAO dao = new MBR_DAO();
		loginedMbr = dao.loginMember(loginedMbr);
		
		HttpSession session = request.getSession();  
		session.setAttribute("loginedMBR",loginedMbr);
		response.sendRedirect("SetMain");
	}

}
