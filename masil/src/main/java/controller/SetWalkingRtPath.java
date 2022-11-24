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
		WLK_RT_DAO dao = new WLK_RT_DAO();
		List<WLK_RT> list = dao.WalkingRtPathByRtNbr(wlk_rt_nbr);
		Gson gson = new Gson();
		String json = gson.toJson(list);	
		response.setCharacterEncoding("UTF-8");
		//보내는 통로인 출력 스트림 
		
		PrintWriter out = response.getWriter();
		
		//결과값을 전송
		out.print(json);
		


		
	}

}
