package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;

/**
 * Servlet implementation class PlusDog
 */
public class PlusDog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String DogName = request.getParameter("DogName");
		if(DogName==null) {
			response.sendRedirect("MyPage.jsp");
		}else {
			MBR_DAO dao = new MBR_DAO();
			int result = dao.plusDog(DogName, mbr_nbr);
			if(result>0) {
				response.sendRedirect("DogList.jsp");
			}else {
				System.out.println("plusDog가 잘 되지 않음!");
			}
		}
	}

}
