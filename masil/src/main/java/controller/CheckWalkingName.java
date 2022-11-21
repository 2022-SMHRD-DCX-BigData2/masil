package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WLK_DAO;

/**
 * Servlet implementation class CheckWalkingName
 */
public class CheckWalkingName extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//wlk_name이 중복되는가 확인
		WLK_DAO dao = new WLK_DAO();
		String wlk_name = request.getParameter("wlk_name");
		String area_nbr = request.getParameter("area_nbr");
		System.out.println("here");
		System.out.println(area_nbr);
		if(dao.isWlkExist(wlk_name)==null) {
			request.setAttribute("isChecked", true);
			request.setAttribute("area_nbr", area_nbr);
			request.setAttribute("wlk_name", wlk_name);
		}else {
			request.setAttribute("isChecked", false);
		}
		RequestDispatcher rd = request.getRequestDispatcher("CreateWalking.jsp");
		rd.forward(request, response);
		
		
		
	}

}
