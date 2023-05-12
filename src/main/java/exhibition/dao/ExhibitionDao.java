package exhibition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exhibition.api.ExhibitionInfo;
import exhibition.api.ApiExplorer;
import exhibition.dto.ExhibitionDto;
import signUp.oracle.DBConnectionManager;



public class ExhibitionDao {
	
		public 	List<ExhibitionInfo> insertExhibitionInfoList(){
 
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			List<ExhibitionInfo> exhibitionInfoList = null;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "insert into exhibitionData "
						+" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery(); // 쿼리를 실행!!

				exhibitionInfoList = new ArrayList<ExhibitionInfo>();

				while (rs.next()) {
					ExhibitionInfo exhibitionDto = new ExhibitionInfo();

					exhibitionDto.setDP_SEQ(rs.getInt("DP_SEQ"));
					exhibitionDto.setDP_NAME(rs.getString("DP_NAME"));
					exhibitionDto.setDP_SUBNAME(rs.getString("DP_SUBNAME"));
					exhibitionDto.setDP_PLACE(rs.getString("DP_PLACE"));
					exhibitionDto.setDP_START(rs.getString("DP_START"));
					exhibitionDto.setDP_END(rs.getString("DP_END"));
					exhibitionDto.setDP_HOMEPAGE(rs.getString("DP_HOMEPAGE"));
					exhibitionDto.setDP_EVENT(rs.getString("DP_EVENT"));
					exhibitionDto.setDP_SPONSOR(rs.getString("DP_SPONSOR"));
					exhibitionDto.setDP_VIEWTIME(rs.getString("DP_VIEWTIME"));
					exhibitionDto.setDP_VIEWCHARGE(rs.getString("DP_VIEWCHARGE"));
					exhibitionDto.setDP_ART_PART(rs.getString("DP_ART_PART"));
					exhibitionDto.setDP_ART_CNT(rs.getString("DP_ART_CNT"));
					exhibitionDto.setDP_ARTIST(rs.getString("DP_ARTIST"));
					exhibitionDto.setDP_VIEWPOINT(rs.getString("DP_VIEWPOINT"));
					exhibitionDto.setDP_INFO(rs.getString("DP_INFO"));
					exhibitionDto.setDP_MAIN_IMG(rs.getString("DP_MAIN_IMG"));
					exhibitionDto.setDP_LNK(rs.getString("DP_LNK"));

					exhibitionInfoList.add(exhibitionDto);
				}

				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return exhibitionInfoList;
		}
}
			
	
	
//	public int insertExhibitionInfo(List<ExhibitionInfo> exInfoList) {
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		
//		try {
//			conn = DBConnectionManager.getConnection();
//
//			// 쿼리문!
//			String sql = "insert into exhibitionData values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,)";
///*
// (DP_SEQ, DP_NAME, DP_SUBNAME,"
//					+ "DP_PLACE, DP_START, DP_END, DP_HOMEPAGE, DP_EVENT, DP_SPONSOR,"
//					+ "DP_VIEWTIME, DP_VIEWCHARGE, DP_ART_PART, DP_ART_CNT, DP_ARTIST,"
//					+ "DP_VIEWPOINT, DP_INFO, DP_MAIN_IMG, DP_LNK)"
//						+"
//						*/
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1,DP_SEQ);
////			psmt.setString(2. );
////			psmt.setString(3, );
////			psmt.setString(4, );
////			psmt.setString(5, );
////			psmt.setString(6, );
////			psmt.setString(7, );
////			psmt.setString(8, );
////			psmt.setString(9, );
////			psmt.setString(10, );
////			psmt.setString(11, );
////			psmt.setString(12, );
////			psmt.setString(13, );
////			psmt.setString(14, );
////			psmt.setString(15, );
////			psmt.setString(16, );
////			psmt.setString(17, );
////			psmt.setString(18, );
//
//			result = psmt.executeUpdate();
//			
//			System.out.println("처리결과:" + result);
//			// DB에 쿼리문 실행
//			// 쿼리 결과를 반환 -> 활용
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//		
//		return result;
//	}
//	
//}