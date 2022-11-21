package database;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlSessionManager {
	
	// SqlSessionFactory : SqlSession생성
	   //                  Connection객체와 같은 역할
	   static SqlSessionFactory sqlSessionFactory;
	   
	   
	   // static : 객체를 호출할때 무조건 한번 실행되는 부분
	   static {
	      
	      try {
	         String resource = "database/config.xml";
	         InputStream inputStream;
	         inputStream = Resources.getResourceAsStream(resource);
	         
	         // DB 연결을 미리 해놓은것(Connection Pool : CP)
	         // DB 연결할때마다 낭비되는 자원을 아낄 수 있다.
	         // Connection 객체를 미리 만들어 놓고 빌려쓰고 반납하는 형식으로 관리
	         
	         sqlSessionFactory =
	               // SqlSessionFactoryBuilder : MyBatis의 설정파일을 근거로 
	               //                         SqlSessionFactory를 만듦
	               new SqlSessionFactoryBuilder().build(inputStream);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      
	      
	           
	   }// static
	   
	   
	   // SqlSessionFactory를 DAO에서 사용하기 위해 메소드 만들기
	   public static SqlSessionFactory getSqlSession() {
	      
	      return sqlSessionFactory;
	   }

}
