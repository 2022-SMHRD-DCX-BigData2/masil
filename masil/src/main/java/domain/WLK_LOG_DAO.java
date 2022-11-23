package domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class WLK_LOG_DAO {
	
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 회원가입 기능 구현
	   public int insertLog(WLK_LOG newLog) {
	      int cnt = 0;
	      
	      try {
	         //               mapper.xml의 id값
	         cnt = sqlSession.insert("insertLog", newLog);
	         
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
	   }//
	   

}
