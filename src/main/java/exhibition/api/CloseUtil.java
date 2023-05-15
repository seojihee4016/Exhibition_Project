package exhibition.api;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CloseUtil {
	
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException se) {
				
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			}catch(SQLException se) {
				
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException se) {
				
			}
		}
	}
	
}