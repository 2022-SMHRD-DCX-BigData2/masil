package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.WRT;
import domain.WRT_DAO;

/**
 * Servlet implementation class SetWalkingRTRVList
 */
public class SetWalkingRTRVList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wlk_rt_nbr = Integer.parseInt(request.getParameter("wlk_rt_nbr"));
		WRT_DAO wrtDao = new WRT_DAO();
		List<WRT> text = wrtDao.selectWRT(2, wlk_rt_nbr);
		
		//Gson객체 생성
		Gson gson = new Gson();
				
		//자바 코드에서 만들어낸 리스트를 json문자열로 바꾸는 기능을 Gson이 함
		//Gson에 있는 toJson()
		String json = gson.toJson(text);
		
		//보내기 전에 인코딩
		response.setCharacterEncoding("UTF-8");
		//보내는 통로인 출력 스트림 
		
		PrintWriter out = response.getWriter();
		
		//결과값을 전송
		out.print(json);

		
		
	}

}
