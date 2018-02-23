package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DiaryDBBean {
	
	//DB�� �����ϱ� ���� �޼ҵ�
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
	//������ �������� �޼ҵ�
	public List getDiarys() {
		Connection conn = null;	//DB�� �����ϴ� ��ü
		PreparedStatement pstmt = null;	//sql���� �����ϴ� ��ü
		/*
		execteQuery�� ����ϸ� ResultSet ��ü�� ������.
		execteQuery:DB�� ���
		ResultSet : ��ɿ� ���� ��ȯ��.
		ex) ResultSet = execteQuery(������); */
		ResultSet rs = null;
		
		//���̾�� ������ ����Ʈ ����
		List DiaryList = null;
		String sql = "";
		
		try {
			conn = getConnection();	//���� ���� �޼ҵ�
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














