package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;

/**
 * Servlet implementation class DeleteMBR
 */
public class DeleteMBR extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		MBR_DAO dao = new MBR_DAO();
		int result = dao.DeleteMBR(mbr_nbr);
		if(result>0) {
			response.sendRedirect("Admin");
		}else {
			System.out.println("회원 탈퇴 실패!");
		}
		
		
		
	}

}
