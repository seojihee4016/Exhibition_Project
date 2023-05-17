package book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import signUp.dto.MemberDto;
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


	//예약 회원

	public ArrayList getBookList() {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 가변길이 배열 생성
		ArrayList bookList = new ArrayList();

		try {
			conn = DBConnectionManager.getConnection();

			String SQL = "SELECT * FROM book";

			psmt = conn.prepareStatement(SQL); // SQL 실행 객체
			rs = psmt.executeQuery();

			while (rs.next()) {
				bookDto bookDTO = new bookDto();// 1.memberDto 객체생성
				bookDTO.setId(rs.getInt("id"));
				bookDTO.setBookDate(rs.getString("bookDate"));
				bookDTO.setName(rs.getString("name"));
				bookDTO.setPhone(rs.getString("phone"));
				bookDTO.setEmail(rs.getString("email"));
				bookDTO.setPeopleCount(rs.getInt("peopleCount"));
				bookDTO.setAdult(rs.getInt("adult"));
				bookDTO.setTeenager(rs.getInt("teenager"));
				bookDTO.setChild(rs.getInt("child"));
				bookDTO.setPrice(rs.getInt("price"));
				
				
				// 여기까지가 한 행의 데이터를 변수mb에 저장한 것임. while로 모든 행을 반복해서 변수mb에 저장

				// 가변배열(ArrayList)에 위의 데이터mb를 저장
				// 즉 배열 한 칸에 회원 1명의 정보를 저장함.
				bookList.add(bookDTO); // 업캐스팅 (MemberDto-> Object)
				// System.out.println(memberList); 배열한 칸에 잘 들어갔는지 콘솔로 확인
			}

			System.out.println("정보검색완료");
			// System.out.println(memberList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return bookList;
	}

	
}
