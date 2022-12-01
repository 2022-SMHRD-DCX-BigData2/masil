package domain;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class MTH_WLK_RT_NAME_DAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	   public int insertWlk_rt_name(String wlk_rt_name, BigDecimal wlk_nbr_for_wlk_rt) {
	      MTH_WLK_RT_NAME mth = new MTH_WLK_RT_NAME(wlk_rt_name, wlk_nbr_for_wlk_rt);
		   
		  int cnt = 0;
	      
	      try {
	         //               mapper.xml의 id값//만들어야 함
	         cnt = sqlSession.insert("insertWlk_rt_name", mth);
	         
	         // 만약에 내가 원하는 일을 했으면 DB에 반영
	         if(cnt >0) {
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
	
	   
		public BigDecimal  isWlk_rt_Exist(String wlk_rt_name) {
			
			BigDecimal result = null;
			
			try {
			     //               mapper.xml의 id값//만들어야 함
		     result = sqlSession.selectOne("isWlk_rt_Exist",wlk_rt_name);

		     // 만약에 내가 원하는 일을 했으면 DB에 반영
		     if(result!=null) {
		        System.out.println("isWlk_rt_Exist DAO메소드에선 값을 잘 가져옴");
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
	
		
		public List<MTH_WLK_RT_NAME> selectWlkRtByWlk(int wlk_nbr_for_wlk_rt){
			List<MTH_WLK_RT_NAME> result = null;
			  try {
				     //               mapper.xml의 id값
			     result = sqlSession.selectList("selectWlkRtByWlk",wlk_nbr_for_wlk_rt);
			     
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
		
	   public String getWlkRTName(int wlk_rt_nbr) {
		   String getWlkRTName = null;
		   
		   try {
			     //               mapper.xml의 id값
			   getWlkRTName = sqlSession.selectOne("getWlkRTName",wlk_rt_nbr);
		     
		     // 만약에 내가 원하는 일을 했으면 DB에 반영
		     if(getWlkRTName!=null) {
		        System.out.println("getWlkRTName DAO메소드에선 값을 잘 가져옴");
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
		   
		   
		   return getWlkRTName;
		      
	   }
	   
	   

		public int DeleteWLK_RT_MTH (int wlk_rt_nbr) {
			   
		      int cnt = 0;
		      
		      try {
		         //               mapper.xml의 id값
		         cnt = sqlSession.insert("DeleteWLK_RT_MTH", wlk_rt_nbr);
		         
		         // 만약에 내가 원하는 일을 했으면 DB에 반영
		         if(cnt >0) {
		            System.out.println("DeleteWLK_RT_MTH DAO메소드에선 값을 잘 가져옴");
		            sqlSession.commit();
		         }else {
		            // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
		        	 System.out.println("경로 삭제 잘 안됨!");
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
	   
		public List<BigDecimal> selectWlkRtNbrByWlk(int wlk_nbr_for_wlk_rt){
			List<BigDecimal> result = null;
			  try {
				     //               mapper.xml의 id값
			     result = sqlSession.selectList("selectWlkRtNbrByWlk",wlk_nbr_for_wlk_rt);
			     
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
