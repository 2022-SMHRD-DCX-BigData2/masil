package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.CMT;
import domain.CMT_DAO;
import domain.MBR_DAO;

/**
 * Servlet implementation class setCMT
 */
public class setCMT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wrt_nbr = Integer.parseInt(request.getParameter("wrt_nbr"));
		CMT_DAO dao = new CMT_DAO();
		List<CMT> cmts = dao.getCMTList(wrt_nbr);
		List<CMT> new_cmts = new ArrayList<>();
		for (CMT cmt : cmts) {
			MBR_DAO temp = new MBR_DAO();
			String cmt_id = temp.getId(cmt.getCmt_ath().intValue());
			CMT newCMT = new CMT(cmt.getCmt_nbr(),cmt.getWrt_nbr_for_cmt(),cmt.getCmt_ath(),cmt.getCmt_cnt(),cmt.getCmt_time(),cmt_id);
			new_cmts.add(newCMT);
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(new_cmts);	
		response.setCharacterEncoding("UTF-8");
		//보내는 통로인 출력 스트림 
		
		PrintWriter out = response.getWriter();
		
		//결과값을 전송
		out.print(json);
		
		
		
		
	}

}
