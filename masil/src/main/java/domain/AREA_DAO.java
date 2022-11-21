package domain;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;


public class AREA_DAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();

	public List<AREA> selectAllArea(){
		List<AREA> result = null;
		  try {
			     //               mapper.xml의 id값
		     result = sqlSession.selectList("selectAllArea");
		     
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
	
	public List<String> selectAllBclsArea(){
		List<String> result = null;
		  try {
			     //               mapper.xml의 id값
		     result = sqlSession.selectList("selectAllBclsArea");
		     
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
	
	

	public BigDecimal matchAreaNbr(String b_cls,String s_cls) {
		
		AREA area = new AREA(b_cls, s_cls);

		BigDecimal result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("matchAreaNbr",area);
	   //모가문제야 왜 값이 안나와 ㅠ.ㅠ
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
	
	public String matchBcls(int area_nbr) {
		
		String result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("matchBcls",area_nbr);
	     
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
	
	public BigDecimal matchBcls_nbr(int area_nbr) {
		
		BigDecimal result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("matchBcls_nbr",area_nbr);
	     
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
	
	
	public BigDecimal matchBcls_nbr_fromSB(String area) {
		
		BigDecimal result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("matchBcls_nbr_fromSB",area);
	     
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

