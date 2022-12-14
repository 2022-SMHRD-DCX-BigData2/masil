package domain;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import database.SqlSessionManager;

public class MBR_DAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 회원가입 기능 구현
   public int insertMember(MBR joinMember) {
      int cnt = 0;
      
      try {
         //               mapper.xml의 id값
         cnt = sqlSession.insert("insertMBR", joinMember);
         
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
   
   
	public MBR loginMember(MBR loginedMbr) {
		
		MBR result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectOne("loginMBR",loginedMbr);
	     
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
   
   
   public String getDogList(int mbr_nbr) {
	   String DogList = null;
	   
	   try {
		     //               mapper.xml의 id값
		   DogList = sqlSession.selectOne("getDogList",mbr_nbr);
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(DogList!=null) {
	        System.out.println("getDogList DAO메소드에선 값을 잘 가져옴");
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
	   
	   
	   return DogList;
	      
   }
   
	// 댕댕이 추가하기
   public int plusDog(String DogName,int mbr_nbr) {
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   DogName += "|"; //구분자 추가
	   map.put("DogName", DogName);
	   map.put("mbr_nbr", mbr_nbr);

      int cnt = 0;
      
      try {
         //               mapper.xml의 id값
         cnt = sqlSession.insert("plusDog", map);
         
         // 만약에 내가 원하는 일을 했으면 DB에 반영
         if(cnt >0) {
            System.out.println("plusDog DAO메소드에선 값을 잘 가져옴");
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
   

   public int setDogList(String DogList,int mbr_nbr) {
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("DogList", DogList);
	   map.put("mbr_nbr", mbr_nbr);

      int cnt = 0;
      
      try {
         //               mapper.xml의 id값
         cnt = sqlSession.insert("setDogList", map);
         
         // 만약에 내가 원하는 일을 했으면 DB에 반영
         if(cnt >0) {
            System.out.println("setDogList DAO메소드에선 값을 잘 가져옴");
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
   

   public int plusFavList(String str_wlk_rt_nbr,int mbr_nbr) {
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   str_wlk_rt_nbr += "|"; //구분자 추가
	   map.put("str_wlk_rt_nbr", str_wlk_rt_nbr);
	   map.put("mbr_nbr", mbr_nbr);

      int cnt = 0;
      
      try {
         //               mapper.xml의 id값
         cnt = sqlSession.insert("plusFavList", map);
         
         // 만약에 내가 원하는 일을 했으면 DB에 반영
         if(cnt >0) {
            System.out.println("plusFavList DAO메소드에선 값을 잘 가져옴");
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
   
   
   
   public String getFavList(int mbr_nbr) {
	   String FavList = null;
	   
	   try {
		     //               mapper.xml의 id값
		   FavList = sqlSession.selectOne("getFavList",mbr_nbr);
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(FavList!=null) {
	        System.out.println("getFavList DAO메소드에선 값을 잘 가져옴");
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
	   
	   
	   return FavList;
	      
   }
   
   public int setFavList(String FavList,int mbr_nbr) {
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("FavList", FavList);
	   map.put("mbr_nbr", mbr_nbr);

      int cnt = 0;
      
      try {
         //               mapper.xml의 id값
         cnt = sqlSession.insert("setFavList", map);
         
         // 만약에 내가 원하는 일을 했으면 DB에 반영
         if(cnt >0) {
            System.out.println("setDogList DAO메소드에선 값을 잘 가져옴");
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
   
   
   public String getId(int mbr_nbr) {
	   String getId = null;
	   
	   try {
		     //               mapper.xml의 id값
		   getId = sqlSession.selectOne("getId",mbr_nbr);
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(getId!=null) {
	        //System.out.println("getId DAO메소드에선 값을 잘 가져옴");
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
	   
	   
	   return getId;
	      
   }
   
   
   public BigDecimal getNbr(String mbr_id) {
	   BigDecimal getNbr = null;
	   
	   try {
		     //               mapper.xml의 id값
		   getNbr = sqlSession.selectOne("getNbr",mbr_id);
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(getNbr!=null) {
	        //System.out.println("getNbr DAO메소드에선 값을 잘 가져옴");
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
	   
	   
	   return getNbr;
	      
   }
   
	public List<MBR> AllCMBR() {
		
		List<MBR> result = null;
		
		try {
		     //               mapper.xml의 id값
	     result = sqlSession.selectList("AllCMBR");
	     
	     // 만약에 내가 원하는 일을 했으면 DB에 반영
	     if(result!=null) {
	        System.out.println("AllMBR DAO메소드에선 값을 잘 가져옴");
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
	
	public int DeleteMBR(int mbr_nbr) {
	      int cnt = 0;
	      
	      try {
	         //               mapper.xml의 id값
	         cnt = sqlSession.insert("DeleteMBR", mbr_nbr);
	         
	         // 만약에 내가 원하는 일을 했으면 DB에 반영
	         if(cnt >0) {
	            System.out.println("DeleteMBR DAO메소드에선 값을 잘 가져옴");
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
	   
	 public int ChangePW(int mbr_nbr, String mbr_pw) {
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("mbr_nbr", mbr_nbr);
		   map.put("mbr_pw", mbr_pw);

	      int cnt = 0;
	      
	      try {
	         //               mapper.xml의 id값
	         cnt = sqlSession.insert("ChangePW", map);
	         
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
	   }// 회원가입 끄읕
	 
	 
	 
	 public List<BigDecimal> AllCMBR_nbr() {
			
			List<BigDecimal> result = null;
			
			try {
			     //               mapper.xml의 id값
		     result = sqlSession.selectList("AllCMBR_nbr");
		     
		     // 만약에 내가 원하는 일을 했으면 DB에 반영
		     if(result!=null) {
		        System.out.println("AllMBR DAO메소드에선 값을 잘 가져옴");
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
	 
	 
		public BigDecimal checkID(String mbr_id) {
			
			BigDecimal result = null;
			
			try {
			     //               mapper.xml의 id값
		     result = sqlSession.selectOne("checkID",mbr_id);

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
   

}
