package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WLK_DAO;

/**
 * Servlet implementation class InsertWalking
 */
public class InsertWalking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String wlk_name = request.getParameter("wlk_name");
		BigDecimal area_nbr = new BigDecimal(request.getParameter("area_nbr"));
		BigDecimal lat_for_wlk = new BigDecimal(request.getParameter("lat"));
		BigDecimal lon_for_wlk = new BigDecimal(request.getParameter("lon"));
		//목적지 입력하고 경로 입력 페이지로 넘겨줘야 함
		//경로 입력 페이지에서는 새로운 목적지가 등록되었으면 등록되었다고 알려주고
		//새로운 목적지가 아닌 경우에는 알려줄 필요 없다
		//목적지 번호 입력할 시퀀스 생성해야 함
		System.out.println(wlk_name+area_nbr+lat_for_wlk+lon_for_wlk);
		WLK_DAO dao = new WLK_DAO();
		BigDecimal wlk_nbr = dao.insertWlk(wlk_name, lat_for_wlk, lon_for_wlk, area_nbr);
		if(wlk_nbr!=null) {
			System.out.println("잘 됨!");
			//wlk_nbr에 해당하는 목적지의 경로를 생성해야 함
			response.sendRedirect("CreateWalkingRT.jsp?wlk_nbr="+wlk_nbr);
			
		}else {
			System.out.println("잘 안 됨!");
		}
		
	}

}
