package util.data;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	public static Connection getConnection(){
		Connection conn = null;	
		final String url = "jdbc:mysql://database-1.cgpdrhscfoi5.ap-northeast-2.rds.amazonaws.com:3306/BookOnCue";
		final String user = "admin";
		final String password = "Z7df4jkdCk16in3oJTi4";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("데이터베이스 연동성공");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("데이터베이스 연동실패");
		}
		return conn;
	}

}
