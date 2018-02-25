package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DiaryDBBean {
	
		// DB와 연결할때 필요한 것들 (url,dbid,dbpw,formame)
	public Connection getConnection() {
		String DbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String DbId = "scott";
		String DbPw = "tiger";
		Connection con = null;
		
		//forname 오라클 라이브러리 쓴다는걸 명시
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//드라이버매니저의 getConnection메소드를 써서 연결하려는 db정보를 넘김.
		try {
			con = DriverManager.getConnection(DbUrl, DbId, DbPw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public ArrayList<DiaryDataBean> getDiarys(){	
		//DB연결해서 쿼리 날릴때 필요한 요소들 
		Connection con = null;
		String sql = "Select num,title,content,regdate from diarys order by regdate desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		//diary 객체 담을 배열 1개 만들어줌.
		ArrayList<DiaryDataBean> diarys = new ArrayList<DiaryDataBean>();

		con = getConnection();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DiaryDataBean diary = new DiaryDataBean();	//객체 생성
				diary.setNum(rs.getInt("num"));
				diary.setRegdate(rs.getDate("regdate"));
				diary.setContent(rs.getString("content"));
				diary.setTitle(rs.getString("title"));
				
				//diarys 배열에 담아줌.
				diarys.add(diary);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return diarys;
	}
	
	//데이터 삽입
	public void insertDiary(DiaryDataBean diary) {
		/*
		 Db에 넣을때 필요한것
		 connect con, sql(쿼리), preparedstatement */
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
	//시퀀스 가져오는 메소드
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
	
	//글 보기 메소드
	/*
	 	num을 파라미터로 받아서 쿼리 접속해서 해당 num의 제목과 내용을 가져옴.
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
	












