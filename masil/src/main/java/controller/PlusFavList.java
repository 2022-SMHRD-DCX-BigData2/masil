package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;

/**
 * Servlet implementation class PlusFavList
 */
public class PlusFavList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String str_wlk_rt_nbr = request.getParameter("wlk_rt_nbr");
		MBR_DAO dao = new MBR_DAO();
		int result = dao.plusFavList(str_wlk_rt_nbr,mbr_nbr);
		if(result>0) {
			System.out.println("PlusFavList가 잘 됨!");
			//ajax통신으로 온 거라서 redirect안 됨!
		}else {
			System.out.println("PlusFavList가 잘 안 됨!");
		}
	}

}
