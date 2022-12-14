package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;

/**
 * Servlet implementation class ChangePW
 */
public class ChangePW extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String mbr_pw = request.getParameter("PW");
		MBR_DAO dao = new MBR_DAO();
		int result = dao.ChangePW(mbr_nbr, mbr_pw);
		if(result>0) {
			System.out.println("비밀번호 변경 성공");
			response.sendRedirect("MyPage.jsp");
		}else {
			System.out.println("비밀번호 변경 실패");
		}
	}

}
