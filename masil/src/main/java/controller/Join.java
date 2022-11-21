package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.AREA_DAO;
import domain.MBR;
import domain.MBR_DAO;

/**
 * Servlet implementation class Join
 */
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String mbr_id = request.getParameter("mbr_id");
		String mbr_pw = request.getParameter("mbr_pw");
		String b_cls = request.getParameter("b_cls");
		String s_cls = request.getParameter("s_cls");
		
		AREA_DAO areaDao = new AREA_DAO();
		BigDecimal area_nbr_for_mbr = areaDao.matchAreaNbr(b_cls, s_cls);
		
		MBR newMbr = new MBR(mbr_id, mbr_pw, area_nbr_for_mbr, "","","C");	
		MBR_DAO mbrDao = new MBR_DAO();
		mbrDao.insertMember(newMbr);
		
		HttpSession session = request.getSession();  
		session.setAttribute("loginedMBR",newMbr);
		response.sendRedirect("Main.jsp");
		
		
	}

}
