package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.AREA;
import domain.AREA_DAO;
import domain.MBR;
import domain.WRT;
import domain.WRT_DAO;

/**
 * Servlet implementation class Writing
 */
public class Writing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		//wrt_type도 넘겨받는다
		//area를 넘겨받는 경우 -> 지역 게시판
		//area_nbr을 넘겨받는 경우 ->산책로 게시판
		//글쓴이 아이디도 넘겨줘야 함

		
		AREA_DAO areaDao = new AREA_DAO();
		WRT_DAO wrtDao = new WRT_DAO();
		List<WRT> text = null;
		String b_cls = null;
		int b_cls_nbr;
		int area_nbr = 0;
		AREA area = null;
		int wrt_type = Integer.parseInt(request.getParameter("wrt_type"));
		switch(wrt_type) {
		case 1://1이 자유게시판
			//광주시 순천시에 해당하는 큰 지역 번호를 가져옴->취소됨! 전체 자유게시판으로!
			b_cls_nbr = Integer.parseInt(request.getParameter("type_nbr"));
			//b_cls_nbr = areaDao.matchBcls_nbr_fromSB(b_cls).intValue();
			text =  wrtDao.selectWRT(1, b_cls_nbr);
			int type = 1;
			request.setAttribute("type", type);
			request.setAttribute("type_nbr", b_cls_nbr);
			request.setAttribute("Writing", text);
			RequestDispatcher rd1 = request.getRequestDispatcher("ShowWriting.jsp");
			rd1.forward(request, response);
			break;
		case 2://2가 경로 리뷰 게시판 -> 비동기를 배운 후니까 비동기 ajax통신 써보자!
			//SetWalkingRTRVList에서 처리됨
			break;

		case 3://3이 모임게시판
			break;
		case 4://동네 산책로
			int area_nbr4 = Integer.parseInt(request.getParameter("area_nbr"));		
			area = areaDao.matchAreaName(area_nbr4);
			String b_temp = area.getB_cls();
			String s_temp = area.getS_cls();
			request.setAttribute("type", 2);
			request.setAttribute("type_nbr", area_nbr4);
			RequestDispatcher rd4 = request.getRequestDispatcher("ShowWalking.jsp?b_cls="+b_temp+"&s_cls="+s_temp);
			rd4.forward(request, response);
			break;
		case 5://5가 길 별 산책로 목록
			b_cls = request.getParameter("b_cls");
			String s_cls = request.getParameter("s_cls");
			area_nbr = areaDao.matchAreaNbr(b_cls, s_cls).intValue();
			text =  wrtDao.selectWRT(2, area_nbr);
			request.setAttribute("type", 2);
			request.setAttribute("type_nbr", area_nbr);
			RequestDispatcher rd2 = request.getRequestDispatcher("ShowWalking.jsp");
			rd2.forward(request, response);
			break;
		default:
			System.out.println("잘못된 접근입니다");		
		}
		

	}

}
