package controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import domain.MTH_WLK_RT_NAME_DAO;
import domain.WLK_DAO;

/**
 * Servlet implementation class DeleteWLK
 */
public class DeleteWLK extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int wlk_nbr = Integer.parseInt(request.getParameter("wlk_nbr"));
		
		
		MTH_WLK_RT_NAME_DAO daoMTH = new MTH_WLK_RT_NAME_DAO();
		
		List<BigDecimal> wlk_rt_nbrs = daoMTH.selectWlkRtNbrByWlk(wlk_nbr);
		
		for (BigDecimal wlk_rt_nbr : wlk_rt_nbrs) {
			
			MBR_DAO daoMBR = new MBR_DAO();
			List<BigDecimal> mbr_nbrs = daoMBR.AllCMBR_nbr();		
			for (BigDecimal mbr_nbr : mbr_nbrs) {
				System.out.println(mbr_nbr);
				
				
				MBR_DAO dao1 = new MBR_DAO();
				String temp1 = dao1.getFavList(mbr_nbr.intValue());
				System.out.println(temp1);
				if(temp1==null) {
					continue;
				}
				String[] temp2 = temp1.split("\\|");
				MBR_DAO dao2 = new MBR_DAO();
				int result2 =0;
				if(temp2.length==1&&temp1.contains(wlk_rt_nbr.toPlainString())) {//즐겨찾기 목록에서 전부 제거하는 경우 좀 다르게 해야 함
					
					result2 = dao2.setFavList("", mbr_nbr.intValue());
				
				}else {
			
					List<String> temp3 = new ArrayList<>(Arrays.asList(temp2));
					int i=0;
					for (String string : temp3) {
						if(string.equals(wlk_rt_nbr.toPlainString())) {
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
						result2 = dao2.setFavList(FavList, mbr_nbr.intValue());
						
					}

				}
				HttpSession session = request.getSession();
				MBR temp = (MBR) session.getAttribute("loginedMBR");
				MBR loginedMbr = new MBR(temp.getMbr_id(),temp.getMbr_pw());
				
				if(mbr_nbr.intValue()==temp.getMbr_nbr().intValue()) {
					MBR_DAO dao3 = new MBR_DAO();
					MBR loginedMbr2 = dao3.loginMember(loginedMbr);
					session.setAttribute("loginedMBR",loginedMbr2);	

					System.out.println("MinusFavList가 실행 됨.");
				}else {
					System.out.println("MinusFavList가 실행 안 됨.");
				}

			}	
			
			
			
		}
		
		WLK_DAO dao = new WLK_DAO();
		int result = dao.DeleteWLK(wlk_nbr);
		
	}

}
