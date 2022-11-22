package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.WLK_RT;
import domain.WLK_RT_DAO;

/**
 * Servlet implementation class SetWalkingRtPath
 */
public class SetWalkingRtPath extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wlk_rt_nbr = Integer.parseInt(request.getParameter("wlk_rt_nbr"));
		String wlk_rt_name = request.getParameter("wlk_rt_name");
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");

		WLK_RT_DAO dao = new WLK_RT_DAO();
		List<WLK_RT> list = dao.WalkingRtPathByRtNbr(wlk_rt_nbr);
	
		String result = "[";
		for (WLK_RT wlk_RT : list) {
			result += "new kakao.maps.LatLng("+wlk_RT.getLat_for_wlk_rt()+","+wlk_RT.getLon_for_wlk_rt()+"),";
		}
		result = result.substring(0, result.length() - 1);
		result += "]";
		
		request.setAttribute("path",result);
		request.setAttribute("wlk_rt_name", wlk_rt_name);
		request.setAttribute("lat", lat);
		request.setAttribute("lon", lon);
		RequestDispatcher rd = request.getRequestDispatcher("ShowWalkingRt.jsp");	
		rd.forward(request, response);
		
	}

}
