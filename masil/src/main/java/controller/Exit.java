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
 * Servlet implementation class Exit
 */
public class Exit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MBR exitMBR = (MBR) session.getAttribute("loginedMBR");
		MBR_DAO dao = new MBR_DAO();
		int result = dao.DeleteMBR(exitMBR.getMbr_nbr().intValue());
		if(result>0) {
			session.removeAttribute("loginedMBR");
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("회원 탈퇴 실패!");
		}
		
		
		
	}

}
