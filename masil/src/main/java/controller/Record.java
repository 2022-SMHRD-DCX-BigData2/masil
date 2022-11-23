package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.WLK_LOG;
import domain.WLK_LOG_DAO;

/**
 * Servlet implementation class Record
 */
public class Record extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String mbr_nbr = request.getParameter("mbr_nbr");
		String wlk_rt_nbr = request.getParameter("wlk_rt_nbr");
		String strDogList = request.getParameter("dogList");

		String[] temp1 = null;
		List<String> temp2 = new ArrayList<>();
		
		if(strDogList.equals("[]")) {
			//함께 산책한 반려견이 없는 경우
		}else {
		
			temp1 = strDogList.split("\"");
			
			for (int i = 0; i < temp1.length; i++) {
				if(i%2==1) {
					temp2.add(temp1[i]);
					System.out.println(temp1[i]);
				}
			}
		}
		
		String[] temp3 = temp2.toArray(new String[0]);
		String DogList = String.join("|", temp3);
		
		WLK_LOG newLog = new WLK_LOG(new BigDecimal(mbr_nbr),new BigDecimal(wlk_rt_nbr),DogList);
		
		WLK_LOG_DAO dao = new WLK_LOG_DAO();
		
		int result = dao.insertLog(newLog);
		
		
	}

}
