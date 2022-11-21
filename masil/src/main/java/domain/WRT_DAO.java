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
