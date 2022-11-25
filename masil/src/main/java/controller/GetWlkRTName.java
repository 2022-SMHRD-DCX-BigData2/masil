package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MBR_DAO;
import domain.MTH_WLK_RT_NAME_DAO;

/**
 * Servlet implementation class GetWlkRTName
 */
public class GetWlkRTName extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int wlk_rt_nbr = Integer.parseInt(request.getParameter("wlk_rt_nbr"));
		MTH_WLK_RT_NAME_DAO dao = new MTH_WLK_RT_NAME_DAO();
		String wlk_rt_name = dao.getWlkRTName(wlk_rt_nbr);
		response.setCharacterEncoding("UTF-8");
		//보내는 통로인 출력 스트림 
		PrintWriter out = response.getWriter();
		//결과값을 전송
		out.print(wlk_rt_name);
		
		
		
	}

}
