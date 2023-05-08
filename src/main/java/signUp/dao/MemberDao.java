package signUp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import signUp.dto.MemberDto;
import signUp.oracle.DBConnectionManager;

public class MemberDao {
	
	//insert
		public int insertMemberInfo(String user_id,String password,
		String name, String phone, String gender, String birthDate,String email) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "insert into memberInfo"
							+" values( (select NVL(MAX(id),0)+1 FROM memberInfo),"
						+ "?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, user_id);
				psmt.setString(2, password);
				psmt.setString(3, name);
				psmt.setString(4, phone);
				psmt.setString(5, gender);
				psmt.setString(6, birthDate);
				psmt.setString(7, email);

				result = psmt.executeUpdate();
				
				System.out.println("처리결과:" + result);
				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		
	}
		
		public boolean checkDuplicateId(String user_id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql = "select * from memberInfo where user_id=?";
			 
			 try {
				 conn = DBConnectionManager.getConnection();
				 psmt = conn.prepareStatement(sql);
				 psmt.setString(1, user_id);
				 rs = psmt.executeQuery();
				 
				 while(rs.next()) {
					 String id = rs.getString("id");
					 System.out.printf("%s:아이디 존재!\n", user_id);
					 return false;
				 }
			 } catch(Exception e) {
				 e.printStackTrace();
			 }
			 return true;
		}
}
		



		