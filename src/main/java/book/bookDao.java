package book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import signUp.oracle.DBConnectionManager;
public class bookDao {

	//insert
	public int insertBookInfo(String user_id,  
			String name, String phone, String email, int peopleCount, String bookDate, int price, int adult, int teenager, int child, int seq) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "insert into book (ID, USER_ID,NAME,PHONE,EMAIL,PEOPLECOUNT,BOOKDATE,PRICE,ADULT,TEENAGER,CHILD,DP_SEQ)"
					+" values( (select NVL(MAX(id),0)+1 FROM book),"
					+ "?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setString(2, name);
			psmt.setString(3, phone);
			psmt.setString(4, email);
			psmt.setInt(5, peopleCount);
			psmt.setString(6, bookDate);
			psmt.setInt(7, price);
			psmt.setInt(8, adult);
			psmt.setInt(9, teenager);
			psmt.setInt(10, child);
			psmt.setInt(11, seq);

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

}
