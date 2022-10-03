package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mvc.database.DBConnection;

public class SignUpDAO {

	public boolean confirmId(String id) {
		
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "select id from member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;//중복 아이디
			}
			
		}catch(Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(Exception e) {
				System.out.println("예외발생:" + e.getMessage());
			}
		}
		
		//result가 false이면 사용가능 아이디이고
		//result가 true이면 중복 아이디
		return result;
	}
}





