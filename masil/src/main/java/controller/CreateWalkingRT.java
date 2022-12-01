package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MTH_WLK_RT_NAME_DAO;
import domain.WLK_RT_DAO;

/**
 * Servlet implementation class CreateWalkingRT
 */
public class CreateWalkingRT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	
		String wlk_rt_name = request.getParameter("wlk_rt_name");
		//System.out.println(wlk_rt_name);
		String wlk_nbr_string = request.getParameter("wlk_nbr");
		//System.out.println(wlk_nbr_string);
		String Lat = request.getParameter("Lat");
		String Lon = request.getParameter("Lon");
		
		BigDecimal wlk_nbr = new BigDecimal(wlk_nbr_string);
				
		//WLK_RT_NAME을 MTH_WLK_RT_NAME에 넣음
		//MTH_WLK_RT_NAME에서 WLK_RT_NAME에 해당하는 WLK_RT_NBR을 꺼내옴
		//WLK_RT_NAME는 UNIQUE제약조건을 넣어야 함

		try {
			MTH_WLK_RT_NAME_DAO mthDao1 = new MTH_WLK_RT_NAME_DAO();
			int result1 = mthDao1.insertWlk_rt_name(wlk_rt_name,wlk_nbr);
			MTH_WLK_RT_NAME_DAO mthDao2 = new MTH_WLK_RT_NAME_DAO();
			Thread.sleep(600);
			BigDecimal wlk_rt_nbr = mthDao2.isWlk_rt_Exist(wlk_rt_name);
			System.out.println(wlk_rt_nbr);
			
			String[] Lats_string = Lat.split("\\|");
			//System.out.println(Lats_string[0]);
			String[] Lons_string = Lon.split("\\|");
			//System.out.println(Lons_string[0]);
			
			//WLK_RT에 WLK_RT_NBR과 그 순서 위도, 경도를 집어넣음
			WLK_RT_DAO wlkRtDao = new WLK_RT_DAO();
			int result2= wlkRtDao.insertWlk_rt(wlk_rt_nbr, Lats_string, Lons_string);
			PrintWriter out = response.getWriter();
			out.print(wlk_rt_nbr);
			
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		
	}

}
