package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.MBR_DAO;

/**
 * Servlet implementation class SetDogList
 */
public class SetDogList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		
		MBR_DAO dao = new MBR_DAO();
		String StringDogList = dao.getDogList(mbr_nbr);
		String[] DogList = null;
		Gson gson = new Gson();
		
		if(StringDogList!=null) {
			DogList = StringDogList.split("\\|");
				
		}else {
			String[] temp = {"댕댕이가 없습니다"};
			DogList = temp;
		}
		
		String json = gson.toJson(DogList);	
		response.setCharacterEncoding("UTF-8");
		//보내는 통로인 출력 스트림 
		
		PrintWriter out = response.getWriter();
		
		//결과값을 전송
		out.print(json);
		
		
		

	}

}
