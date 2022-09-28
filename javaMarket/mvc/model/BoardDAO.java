package mvc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import mvc.database.DBConnection;

//데이터베이스 연동부분 기술
public class BoardDAO {
	//instance : 싱글톤 패턴으로 한번만 인스턴스를
	//생성하고 다른 클래스에서 공유하여 사용
	private static BoardDAO instance;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		//instance 최초 생성
		if(instance == null) {
			instance = new BoardDAO();
		}
		
		return instance;
	}
	
	//조건에 맞는 board 테이블 건수
	//items :제목,내용,작성자로 검색
	//text : 찾고자 하는 내용
	public int getListCount(String items,String text) {
		
		//db와 연결하기 위한 객체
		Connection conn = null;
		//파라미터가 포함된 SQL문을 DB에 전달하기 위한 preparedStatement 객체를 생성한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql;
		int x=0;
		
		//검색하고자 하는 값이 없으면 전체행 수
		if (items == null && text == null) {
			sql = "select count(*) from board";
		}else {
			sql = "select count(*)" + 
		          " from board where " +  items + " like '%" + text + "%'";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("getListCount() 오류:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return x;
		
	}
	
	//board 테이블에서 레코드 가져오기
	public ArrayList<BoardDTO>  getBoardList(
					 int page,//현재 페이지
					 //한페이지당 보여지는 행수
	    		     int limit,
	    		     //검색종류
	    		     String items,
	    		     //검색어
	    		     String text){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//조건에 만족하는 총 데이터 건수
		int total_record = getListCount(items,text);
		int start = (page - 1)* limit;
		int index = start + 1;//다음페이지로 이동
		
		String sql;
		//검색에 값이 없으면 전체 조회처리
		if(items == null && text == null) {
			sql = "select * from board order by num desc";
		}else {
			sql = "select * from board where " + items + " like '%" +
				  text + "%' order by num desc";	
		}
		
		//게시물 리스트를 저장하기 위한 ArrayList
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			/*
			resultSetType : ResultSet 커서 이동 관련 속성 변경
			1)  ResultSet.TYPE_FORWARD_ONLY : ResultSet 커서를 다음행으로만 이동(기본)
			2) ResultSet.TYPE_SCROLL_INSENSITIVE : ResultSet 커서를 원하는 행으로 이동 - 조작행 미반영
			3) ResultSet.TYPE_SCROLL_SENSITIVE : ResultSet 커서를 원하는 행으로 이동 - 조작행 반영
			 resultSetConcurrency : ResultSet 커서 위치의 처리행 조작 관련 속성 변경
			1) ResultSet.CONCUR_READ_ONLY : 처리행의 조작 불가능
			2) ResultSet.CONCUR_UPDATABLE : 처리행의 조작 가능
			 */
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, 
											  ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			//absolute(숫자):
			//숫자에 해당하는 ROW위치로 이동
			while(rs.absolute(index)) {
				
				BoardDTO board = new BoardDTO();
				
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				
				list.add(board);
				
				//총건수와 비교하여 index 증가
				if(index < (start + limit) && index <= total_record) {
					index++;
				}else {
					break;
				}
				
			}
			   return list;
			   
		}catch(Exception e) {
			System.out.println("getBoardList() 오류:" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return null;
	}
	
	//member 테이블에서 인증된 id의 
	//사용자명을 가져오기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name=null;
		
		String sql="select * from member where id = ?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}	
			
			return name;
			
		}catch(Exception e) {
			System.out.println("getLoginNameById 오류:" + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return null;
				
	}
	
	//게시판 테이블(board)에 데이터 추가
	public void insertBoard(BoardDTO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			sql = "insert into board values(?,?,?,?,?,?,?,?,null)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,board.getNum());
			pstmt.setString(2,board.getId());
			pstmt.setString(3,board.getName());
			pstmt.setString(4,board.getSubject());
			pstmt.setString(5,board.getContent());
			pstmt.setInt(6,board.getHit());
			pstmt.setString(7,board.getIp());
			
			//mysql 테이블 regdate 컬럼 timestamp로 선언
			java.util.Date utilDate = new java.util.Date();
			java.sql.Timestamp sqlTS = new java.sql.Timestamp(utilDate.getTime());
			pstmt.setTimestamp(8,sqlTS);

			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("insertBoard() 에러" + e);
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}
	
	//게시판 테이블(board) 데이터 수정
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "update board" +
			      "   set subject = ?," + 
				  "       content = ?" +
			      " where num = ?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,board.getSubject());
			pstmt.setString(2,board.getContent());
			pstmt.setInt(3,board.getNum());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("updateBoard() 에러" + e);
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	//게시판 테이블(board) 데이터 삭제
	public void deleteBoard(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "delete from board where num = ?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1,num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("deleteBoard() 에러" + e);
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}		
	}
	
	//특정게시판 상세보기
	public BoardDTO getBoardByNum(int num,int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		String sql = null;
		
		updateHit(num); //게시판 조회수 증가시키기
		
		try {
			conn = DBConnection.getConnection();
			sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//게시판 자료를 ResultSet에 대입
			rs = pstmt.executeQuery();
			
			//값이 존재하면
			if (rs.next()) {
				//인스턴스 생성
				board = new BoardDTO();
				
				//테이블자료를 board객체에 대입
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			
			 return board;
			 
		}catch(Exception e) {
			System.out.println("getBoardByNum() 오류" + e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		 
		return null;
	}
	
	//게시판 조회수 변경
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "update board" +
			      "   set hit = hit + 1" +
				  " where num = ?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("updateHit() 오류" + e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}
}