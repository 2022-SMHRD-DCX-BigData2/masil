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
 * Servlet implementation class MinusFavList
 */
public class MinusFavList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mbr_nbr = Integer.parseInt(request.getParameter("mbr_nbr"));
		String str_wlk_rt_nbr = request.getParameter("wlk_rt_nbr");
		//System.out.println("테스트");
		//System.out.println(str_wlk_rt_nbr);
		
		MBR_DAO dao1 = new MBR_DAO();
		String temp1 = dao1.getFavList(mbr_nbr);
		System.out.println(temp1);
		String[] temp2 = temp1.split("\\|");
		MBR_DAO dao2 = new MBR_DAO();
		int result =0;
		if(temp2.length==1&&temp1.contains(str_wlk_rt_nbr)) {//즐겨찾기 목록에서 전부 제거하는 경우 좀 다르게 해야 함
			
			result = dao2.setFavList("", mbr_nbr);
		
		}else {
	
			List<String> temp3 = new ArrayList<>(Arrays.asList(temp2));
			int i=0;
			for (String string : temp3) {
				if(string.equals(str_wlk_rt_nbr)) {
					break;
				}
				i++;
			}
			if(i<temp3.size()) {
				
				temp3.remove(i);
				String[] temp4 = temp3.toArray(new String[0]);
				String FavList = String.join("|", temp4);
				System.out.println(FavList);
				FavList += "|";
				result = dao2.setFavList(FavList, mbr_nbr);
				
			}

		}
		HttpSession session = request.getSession();
		MBR temp = (MBR) session.getAttribute("loginedMBR");
		MBR loginedMbr = new MBR(temp.getMbr_id(),temp.getMbr_pw());
		
		if(result>0 && mbr_nbr==temp.getMbr_nbr().intValue()) {
			MBR_DAO dao3 = new MBR_DAO();
			MBR loginedMbr2 = dao3.loginMember(loginedMbr);
			session.setAttribute("loginedMBR",loginedMbr2);	

			System.out.println("MinusFavList가 잘 됨.");
		}else {
			System.out.println("MinusFavList가 잘 안 됨.");
		}
	}

}
