package board;

import java.sql.Connection;
import java.sql.DriverManager;

//DB�� �����ϱ� ���� �޼ҵ�
public class DiaryDBBean {

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
}
