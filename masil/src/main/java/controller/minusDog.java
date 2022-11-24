package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.MBR;
import domain.MBR_DAO;

/**
 * Servlet implementation class minusDog
 */
public class minusDog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String DogName = request.getParameter("DogName");
		MBR_DAO dao1 = new MBR_DAO();
		//댕댕이 목록 불러오기
		//split으로 나누기
		//해당하는 이름 삭제하기
		//다시 |붙이기 (끝에도|붙이는 거 잊지 말기)
		String temp1 = dao1.getDogList(mbr_nbr);
		String[] temp2 = temp1.split("\\|");
		MBR_DAO dao2 = new MBR_DAO();
		int result =0;
		if(temp2.length==1) {//댕댕이를 목록에서 전부 제거하는 경우 좀 다르게 해야 함
			
			result = dao2.setDogList("", mbr_nbr);
		
		}else {
	
			List<String> temp3 = new ArrayList<>(Arrays.asList(temp2));
			int i=0;
			int index = 0;
			for (String string : temp3) {
				if(string.equals(DogName)) {
					index=i++;
					break;
				}
			}
			temp3.remove(index);
			String[] temp4 = temp3.toArray(new String[0]);
			String DogList = String.join("\\|", temp4);
			System.out.println(DogList);
			DogList += "|";
			result = dao2.setDogList(DogList, mbr_nbr);

		}
		
		if(result>0) {
			HttpSession session = request.getSession();
			MBR temp = (MBR) session.getAttribute("loginedMBR");
			MBR loginedMbr = new MBR(temp.getMbr_id(),temp.getMbr_pw());	
			MBR_DAO dao3 = new MBR_DAO();
			MBR loginedMbr2 = dao3.loginMember(loginedMbr);
			session.setAttribute("loginedMBR",loginedMbr2);	

			response.sendRedirect("DogList.jsp");
		}else {
			System.out.println("댕댕이가 목록에서 잘 제거되지 않았습니다.");
		}
		

	}

}
