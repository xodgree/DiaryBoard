package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DiaryDBBean {
	
		// DB�� �����Ҷ� �ʿ��� �͵� (url,dbid,dbpw,formame)
	public Connection getConnection() {
		String DbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String DbId = "scott";
		String DbPw = "tiger";
		Connection con = null;
		
		//forname ����Ŭ ���̺귯�� ���ٴ°� ���
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//����̹��Ŵ����� getConnection�޼ҵ带 �Ἥ �����Ϸ��� db������ �ѱ�.
		try {
			con = DriverManager.getConnection(DbUrl, DbId, DbPw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public ArrayList<DiaryDataBean> getDiarys(){	
		//DB�����ؼ� ���� ������ �ʿ��� ��ҵ� 
		Connection con = null;
		String sql = "Select num,title,content,regdate from diarys order by regdate desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		//diary ��ü ���� �迭 1�� �������.
		ArrayList<DiaryDataBean> diarys = new ArrayList<DiaryDataBean>();

		con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DiaryDataBean diary = new DiaryDataBean();	//��ü ����
				diary.setNum(rs.getInt("num"));
				diary.setRegdate(rs.getDate("regdate"));
				diary.setContent(rs.getString("content"));
				diary.setTitle(rs.getString("title"));
				
				//diarys �迭�� �����.
				diarys.add(diary);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return diarys;
	}
	
	//������ ����
	public void insertDiary(DiaryDataBean diary) {
		/*
		 Db�� ������ �ʿ��Ѱ�
		 connect con, sql(����), preparedstatement */
		Connection con = null;
		String sql = "insert into diarys(num,title,content,regdate) values(?,?,?,sysdate) ";
		PreparedStatement ps = null;
		
		con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, getDiarySeq());
			ps.setString(2, diary.getTitle());
			ps.setString(3, diary.getContent());
			
			ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	//������ �������� �޼ҵ�
	public int getDiarySeq() {
		Connection con = null;
		String sql = "select diary_seq.nextval from dual";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int number = 0;
		con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}else {
				number = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(number);
		return number;
	}
	
	//�� ���� �޼ҵ�
	/*
	 	num�� �Ķ���ͷ� �޾Ƽ� ���� �����ؼ� �ش� num�� ����� ������ ������.
	 * */
	public DiaryDataBean viewDiary(int num){
		Connection con = null;
		String sql = "select title,content from diarys where num = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		DiaryDataBean diary = new DiaryDataBean();
		con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				diary.setTitle(rs.getString("title"));
				diary.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return diary;
	}
}
	












