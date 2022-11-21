package domain;

import java.math.BigDecimal;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class WLK_RT_DAO {
	

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int insertWlk_rt(BigDecimal wlk_rt_nbr, String[] Lats_string,String[] Lons_string) {
		
		
	ArrayList<BigDecimal> Lats = new ArrayList<>();
	ArrayList<BigDecimal> Lons = new ArrayList<>();
	
	
	for (String string : Lats_string) {
		Lats.add(new BigDecimal(string));
	}
	
	for (String string : Lons_string) {
		Lons.add(new BigDecimal(string));
	}
		
		int cnt = 0;
		
		
		int path = 1;
		
		try {
			for(int i=0;i<Lats.size();i++) {
		     //               mapper.xml의 id값
				
				cnt += sqlSession.insert("insertWlk_rt",new WLK_RT(wlk_rt_nbr,new BigDecimal(path),Lats.get(i),Lons.get(i) ));
				path++;
			}
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
			
			
			
	     if(cnt>0) {	        
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
		return cnt;
		
	}
	

}
