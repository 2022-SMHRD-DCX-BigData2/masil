package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.AREA;
import domain.AREA_DAO;

/**
 * Servlet implementation class SetJoin
 */
public class SetJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//db에서 지역 정보를 불러와 join.jsp로 전송
		AREA_DAO dao = new AREA_DAO();
		List<AREA> arealist = dao.selectAllArea();
		
		//key는 시, value는 동/읍/면이 담긴 ArrayList
		HashMap<String, ArrayList<String>> areas = new HashMap<>();
		for (AREA area : arealist) {
			//System.out.println(area.getB_cls());
			//System.out.println(area.getS_cls());
			
			ArrayList<String> temp = null;
			
			if(areas.containsKey(area.getB_cls())) {
				temp = areas.get(area.getB_cls());
			}else {
				temp = new ArrayList<String>();
			}
			temp.add(area.getS_cls());
			areas.put(area.getB_cls(), temp);
		}
		
		System.out.println(areas);
		
		
		request.setAttribute("AREAS",areas );
		RequestDispatcher rd = request.getRequestDispatcher("Join.jsp");
		rd.forward(request, response);

		
		
	}
}
