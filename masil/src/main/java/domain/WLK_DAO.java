package domain;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class WLK_DAO {
	

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public BigDecimal  isWlkExist(String wlk_name) {
		
		BigDecimal result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("isWlkExist",wlk_name);

	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(result!=null) {
	        sqlSession.commit();
	     }else {
	        // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
	    	 sqlSession.rollback();
	     }
	  } catch (Exception e) {
	     // TODO: handle exception
	     e.printStackTrace();
	  } finally {
	     // 빌렸던 Connection 객체를 반납
	     sqlSession.close();
	  }
		return result;
	}

	public BigDecimal insertWlk(String wlk_name, BigDecimal lat_for_wlk, BigDecimal lon_for_wlk, BigDecimal area_nbr_for_wlk) {
		int cnt = 0;
		BigDecimal result = null;
		WLK wlk = new WLK(wlk_name,lat_for_wlk,lon_for_wlk,area_nbr_for_wlk);
		
		try {
		     //               mapper.xml의 id값
			cnt = sqlSession.insert("insertWlk",wlk);

	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(cnt>0) {
	        result = sqlSession.selectOne("isWlkExist",wlk_name);
	        
	        sqlSession.commit();
	     }else {
	        // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
	    	 sqlSession.rollback();
	     }
	  } catch (Exception e) {
	     // TODO: handle exception
	     e.printStackTrace();
	  } finally {
	     // 빌렸던 Connection 객체를 반납
	     sqlSession.close();
	  }
		return result;
		
	}
	
	   
	public List<WLK> WalkingRtListByArea(int area_nbr) {
		
		List<WLK> result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectList("WalkingRtListByArea",area_nbr);
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(result!=null) {
	        System.out.println("DAO메소드에선 값을 잘 가져옴");
	        sqlSession.commit();
	     }else {
	        // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
	        sqlSession.rollback();
	     }
	     
	     
	  } catch (Exception e) {
	     // TODO: handle exception
	     e.printStackTrace();
	  } finally {
	     // 빌렸던 Connection 객체를 반납
	     sqlSession.close();
	  }
		return result;
	}
	


	
	

}
