package domain;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class WRT_DAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	//게시판 타입별 게시판 타입별 번호를 매개변수로 게시판 정보를 받아옴
	public List<WRT> selectWRT(int wrt_type,int nbr_for_wrt_type){
		HashMap<String,Integer>map = new HashMap<String,Integer>();
		map.put("wrt_type", wrt_type);
		map.put("nbr_for_wrt_type", nbr_for_wrt_type);
		List<WRT> result = null;
		  try {
			     //               mapper.xml의 id값
		     result = sqlSession.selectList("selectWRT",map);
		     
		     // 만약에 내가 원하는 일을 했으면 DB에 반영
		     if(result!=null) {
		        System.out.println("selectWRT DAO메소드에선 값을 잘 가져옴");
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
	
	// 글 등록하기
	   public int insertWRT(WRT writing) {
	      int cnt = 0;
	      String wrt_type_string = writing.getWrt_type().toPlainString();
	      try {
		    	  switch(wrt_type_string) {	  
		    	  	case "1":
		    	  		cnt = sqlSession.insert("insertWRTtoLoc", writing);
		    	  		break;
		    	  	case "2":
		    	  		cnt = sqlSession.insert("insertWRTtoRv", writing);
		    	  		break;
		    	  	case "3":
		    	  		cnt = sqlSession.insert("insertWRTtoGrp", writing);
		    	  		break;
		    	  	default:
		    	  		System.out.println("insertWRT에서 잘못된 접근입니다.");
		    	  		break;	    		  
	    	  }
	    	           
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
	   }
	   
	   public WRT selectWRTbyWrtNbr(int wrt_nbr){

			WRT result = null;
			  try {
				     //               mapper.xml의 id값
			     result = sqlSession.selectOne("selectWRTbyWrtNbr",wrt_nbr);
			     
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
	   
	   
	   
	   
	   public int DeleteWRT(int wrt_nbr) {
		   
		      int cnt = 0;
		      
		      try {
		         //               mapper.xml의 id값
		         cnt = sqlSession.insert("DeleteWRT", wrt_nbr);
		         
		         // 만약에 내가 원하는 일을 했으면 DB에 반영
		         if(cnt >0) {
		            System.out.println("DeleteWRT DAO메소드에선 값을 잘 가져옴");
		            sqlSession.commit();
		         }else {
		            // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
		        	 System.out.println("글 삭제 잘 안됨!");
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
	
	   //글 내용 수정하기
	   public int UpdateWRT(int wrt_nbr, String wrt_cnt) {
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("wrt_nbr", wrt_nbr);
		   map.put("wrt_cnt", wrt_cnt);
		   	
		      int cnt = 0;
		      
		      try {
		         //               mapper.xml의 id값
		         cnt = sqlSession.insert("UpdateWRT", map);
		         
		         // 만약에 내가 원하는 일을 했으면 DB에 반영
		         if(cnt >0) {
		            System.out.println("DeleteWRT DAO메소드에선 값을 잘 가져옴");
		            sqlSession.commit();
		         }else {
		            // 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
		        	 System.out.println("글 삭제 잘 안됨!");
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
