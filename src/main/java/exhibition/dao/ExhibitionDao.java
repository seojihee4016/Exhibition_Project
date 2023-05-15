package exhibition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import exhibition.dto.ExhibitionDto;
import signUp.oracle.DBConnectionManager;

public class ExhibitionDao {
	public ArrayList getExhibitionMainList() {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 가변길이 배열 생성
		ArrayList exhibitionMainList = new ArrayList();

		try {
			conn = DBConnectionManager.getConnection();

			String SQL = "SELECT dp_main_img, dp_name, dp_place, dp_start, dp_end, dp_seq " + "from exhibitionData "
					+ "where TO_CHAR(dp_end, 'YYYYMMDD') >= '20230402'" + "order by dp_end desc";

			psmt = conn.prepareStatement(SQL); // SQL 실행 객체
			rs = psmt.executeQuery();

			while (rs.next()) {
				ExhibitionDto exhibitionDto = new ExhibitionDto();// 1.exhibitionDto 객체생성
				exhibitionDto.setDp_main_img(rs.getString("dp_main_img"));
				exhibitionDto.setDp_name(rs.getString("dp_name"));
				exhibitionDto.setDp_place(rs.getString("dp_place"));
				exhibitionDto.setDp_start(rs.getString("dp_start"));
				exhibitionDto.setDp_end(rs.getString("dp_end"));
				exhibitionDto.setDp_seq(rs.getInt("dp_seq"));

				// 여기까지가 한 행의 데이터를 변수mb에 저장한 것임. while로 모든 행을 반복해서 변수mb에 저장

				// 가변배열(ArrayList)에 위의 데이터mb를 저장
				// 즉 배열 한 칸에 회원 1명의 정보를 저장함.
				exhibitionMainList.add(exhibitionDto); // 업캐스팅 (exhibitionDto-> Object)
				// System.out.println(memberList); 배열한 칸에 잘 들어갔는지 콘솔로 확인
			}

			System.out.println("메인 페이지 정보 전송 완료");
			// System.out.println(memberList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return exhibitionMainList;
	}

	public ArrayList getInsideList() {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 가변길이 배열 생성
		ArrayList mainInsideList = new ArrayList();

		try {
			conn = DBConnectionManager.getConnection();

			String SQL = "SELECT dp_name, dp_place, dp_start, dp_end, dp_sponsor, "
					+ "dp_viewtime, dp_viewcharge, dp_art_part, dp_artist, " + "dp_viewpoint, dp_info, dp_seq "
					+ "from exhibitionData " + "where TO_CHAR(dp_end, 'YYYYMMDD') >= '20230402'"
					+ "order by dp_end desc";

			psmt = conn.prepareStatement(SQL); // SQL 실행 객체
			rs = psmt.executeQuery();

			while (rs.next()) {
				ExhibitionDto exhibitionDto = new ExhibitionDto();// 1.exhibitionDto 객체생성
				exhibitionDto.setDp_name(rs.getString("dp_name"));
				exhibitionDto.setDp_place(rs.getString("dp_place"));
				exhibitionDto.setDp_start(rs.getString("dp_start"));
				exhibitionDto.setDp_end(rs.getString("dp_end"));
				exhibitionDto.setDp_sponsor(rs.getString("dp_sponsor"));
				exhibitionDto.setDp_viewtime(rs.getString("dp_viewtime"));
				exhibitionDto.setDp_viewcharge(rs.getString("dp_viewcharge"));
				exhibitionDto.setDp_art_part(rs.getString("dp_art_part"));
				exhibitionDto.setDp_artist(rs.getString("dp_artist"));
				exhibitionDto.setDp_viewpoint(rs.getString("dp_viewpoint"));
				exhibitionDto.setDp_info(rs.getString("dp_info"));
				exhibitionDto.setDp_seq(rs.getInt("dp_seq"));

				// 여기까지가 한 행의 데이터를 변수mb에 저장한 것임. while로 모든 행을 반복해서 변수mb에 저장

				// 가변배열(ArrayList)에 위의 데이터mb를 저장
				// 즉 배열 한 칸에 회원 1명의 정보를 저장함.
				mainInsideList.add(exhibitionDto); // 업캐스팅 (exhibitionDto-> Object)
				// System.out.println(memberList); 배열한 칸에 잘 들어갔는지 콘솔로 확인
			}

			System.out.println("상세정보 페이지 정보 전송 완료");
			// System.out.println(memberList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return mainInsideList;
	}

	public ExhibitionDto selectDpInfoBydp_seq(int dp_seq) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ExhibitionDto exhibitionDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT dp_name, dp_place, dp_main_img, dp_start, dp_end, dp_sponsor, dp_viewtime, dp_viewcharge, dp_art_part, dp_artist, dp_viewpoint, dp_info, dp_seq"
					+ " FROM exhibitiondata WHERE dp_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dp_seq);
			// 첫번째 매개변수로 들어온 애를 id에

			rs = psmt.executeQuery(); // 쿼리를 실행!!

			if (rs.next()) {
				exhibitionDto = new ExhibitionDto();

				exhibitionDto.setDp_name(rs.getString("dp_name"));
				exhibitionDto.setDp_place(rs.getString("dp_place"));
				exhibitionDto.setDp_main_img(rs.getString("dp_main_img"));
				exhibitionDto.setDp_start(rs.getString("dp_start"));
				exhibitionDto.setDp_end(rs.getString("dp_end"));
				exhibitionDto.setDp_sponsor(rs.getString("dp_sponsor"));
				exhibitionDto.setDp_viewtime(rs.getString("dp_viewtime"));
				exhibitionDto.setDp_viewcharge(rs.getString("dp_viewcharge"));
				exhibitionDto.setDp_art_part(rs.getString("dp_art_part"));
				exhibitionDto.setDp_artist(rs.getString("dp_artist"));
				exhibitionDto.setDp_viewpoint(rs.getString("dp_viewpoint"));
				exhibitionDto.setDp_info(rs.getString("dp_info"));
				exhibitionDto.setDp_seq(rs.getInt("dp_seq"));
			}

			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return exhibitionDto;
	}

}
