package domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class CMT_DAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();

	// 댓글 입력
	   public int insertCMT(CMT cmt) {
	      int cnt = 0;
	      
	      try {
	         //               mapper.xml의 id값
	         cnt = sqlSession.insert("insertCMT", cmt);
	         
	         // 만약에 내가 원하는 일을 했으면 DB에 반영
	         if(cnt >0) {
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
	      
	      return cnt;
	   }// 회원가입 끄읕!
	   
	   
	   public List<CMT> getCMTList(int wrt_nbr) {
		   List<CMT> CMTList = null;
		   
		   try {
			     //               mapper.xml의 id값
			   CMTList = sqlSession.selectList("getCMTList",wrt_nbr);
		     
		     // 만약에 내가 원하는 일을 했으면 DB에 반영
		     if(CMTList!=null) {
		        System.out.println("CMTList DAO메소드에선 값을 잘 가져옴");
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
		   
		   
		   return CMTList;
		      
	   }

}
