package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DiaryDBBean {
	
	//DB와 연결하기 위한 메소드
	public static Connection getConnection() {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:orcl:thin:@localhost:1521:orcl";
			String dbId = "scott";
			String dbPass = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	//데이터 가져오는 메소드
	public List getDiarys() {
		Connection conn = null;	//DB와 연결하는 객체
		PreparedStatement pstmt = null;	//sql구문 실행하는 객체
		/*
		execteQuery로 명령하면 ResultSet 객체를 돌려줌.
		execteQuery:DB에 명령
		ResultSet : 명령에 대한 반환값.
		ex) ResultSet = execteQuery(쿼리문); */
		ResultSet rs = null;
		
		//다이어리를 저장할 리스트 선언
		List DiaryList = null;
		String sql = "";
		
		try {
			conn = getConnection();	//위의 연결 메소드
			sql = "select * from diary";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				DiaryList = new ArrayList();
				do {
					DiaryDataBean diary = new DiaryDataBean();
					diary.setNum(rs.getInt("num"));
					diary.setTitle(rs.getString("title"));
					diary.setContent(rs.getString("content"));
					diary.setDate(rs.getTimestamp("regdate"));
					
					
				}while(rs.next());
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}
		return DiaryList;
		
	}
	
	private void close(Connection conn, ResultSet rs, PreparedStatement pstmt) {
		// TODO Auto-generated method stub
		
	}
}














