package org.bigdata.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			//오라클 드라이버를 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			//데이터베이스 연결시 예외발생하는 경우
			//상세하게 로그를 콘솔창에 표시
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = 
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:bigdata","book_ex","book_ex")){
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}







