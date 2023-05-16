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

	// insert
	public int insertMemberInfo(String user_id, String password, String name, String phone, String gender,
			String birthDate, String email) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "insert into memberInfo" + " values( (select NVL(MAX(id),0)+1 FROM memberInfo),"
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

	// 회원 가입 시 유효성 체크
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

			while (rs.next()) {
				String usre_id = rs.getString("user_id");
				System.out.printf("%s:아이디 존재!\n", user_id);
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	// 로그인
	public int login(String user_id, String password) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnectionManager.getConnection();

			String SQL = "SELECT * FROM memberInfo WHERE user_id=?";

			psmt = conn.prepareStatement(SQL); // SQL 실행 객체
			psmt.setString(1, user_id); // SQL 객체의 첫 번째 물음표 값 지정
			rs = psmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("password").equals(password)) {
					return 1;
				} else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -2;
	}

	// memberList 가져오기

	public ArrayList getMemberList() {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 가변길이 배열 생성
		ArrayList memberList = new ArrayList();

		try {
			conn = DBConnectionManager.getConnection();

			String SQL = "SELECT * FROM memberInfo";

			psmt = conn.prepareStatement(SQL); // SQL 실행 객체
			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberDto memberDto = new MemberDto();// 1.memberDto 객체생성
				memberDto.setBirthDate(rs.getString("birthDate"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setName(rs.getString("name"));
				memberDto.setPhone(rs.getString("phone"));
				memberDto.setPassword(rs.getString("password"));
				memberDto.setGender(rs.getString("gender"));
				// 여기까지가 한 행의 데이터를 변수mb에 저장한 것임. while로 모든 행을 반복해서 변수mb에 저장

				// 가변배열(ArrayList)에 위의 데이터mb를 저장
				// 즉 배열 한 칸에 회원 1명의 정보를 저장함.
				memberList.add(memberDto); // 업캐스팅 (MemberDto-> Object)
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
		return memberList;
	}

	/** 로그인 아이디로 회원정보 불러오기 */
	public MemberDto selectMemberInfoByUser_id(String user_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;

		String sql = "select * from memberInfo where user_id=?";

		try {
			conn = DBConnectionManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				memberDto = new MemberDto();
				memberDto.setBirthDate(rs.getString("birthDate"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setName(rs.getString("name"));
				memberDto.setPhone(rs.getString("phone"));
				memberDto.setPassword(rs.getString("password"));
				memberDto.setGender(rs.getString("gender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDto;
	}

}
