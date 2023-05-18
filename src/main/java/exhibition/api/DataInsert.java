package exhibition.api;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import signUp.oracle.DBConnectionManager;


public class DataInsert {

	public static void main(String[] args) {
		java.sql.Statement stmt = null;
		Connection conn = null;
		PreparedStatement psmt = null;
		String filePath = "src/main/resources/서울시립미술관 전시 현황.json";
		// 초기화
		int DP_SEQ = 0;
		String DP_NAME = "";
		String DP_SUBNAME = "";
		String DP_PLACE = "";
		String DP_START = "";
		String DP_END = "";
		String DP_HOMEPAGE = "";
		String DP_EVENT = "";
		String DP_SPONSOR = "";
		String DP_VIEWTIME = "";
		String DP_VIEWCHARGE = "";
		String DP_ART_PART = "";
		String DP_ART_CNT = "";
		String DP_ARTIST = "";
		String DP_VIEWPOINT = "";
		String DP_INFO = "";
		String DP_MAIN_IMG = "";
		String DP_LNK = "";
		
		//insert into JDBC 로직
			
		try {
			String driverClassName = "oracle.jdbc.driver.OracleDriver";
			String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String db_id = "scott";
			String db_pw = "tiger";
			
			//JDBC Driver Loading
			Class.forName(driverClassName);
			
			//JDBC Connection getting
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			
			System.out.println("DB 연결 성공");
			System.out.println("** Driver:" + driverClassName + ", Connection:" + conn);
			
			//JSON 읽어와서 쿼리에 담기위한 사전작업
			Reader reader = new FileReader(filePath);
			System.out.println(reader);

		    
		    JSONParser parser = new JSONParser();
		    Object obj = parser.parse(reader); 
		    JSONObject jsonMain = (JSONObject)obj;
		    JSONArray jsonArr = (JSONArray)jsonMain.get("DATA");

		    
			//SQL문 작성
			String SQL = "INSERT INTO exhibitionData (DP_SEQ, DP_NAME, DP_SUBNAME, DP_PLACE, "
	        		+ "DP_START, DP_END, DP_HOMEPAGE, DP_EVENT, DP_SPONSOR, DP_VIEWTIME, "
	        		+ "DP_VIEWCHARGE, DP_ART_PART, DP_ART_CNT, DP_ARTIST, DP_VIEWPOINT, "
	        		+ "DP_INFO, DP_MAIN_IMG, DP_LNK) "
	        		+ "VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), "
	        		+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			psmt = conn.prepareStatement(SQL);
			
			//psmt.set<데이터타입><? 순서, 값)
			//다건 JSON객체 (JSONArray)
			if (jsonArr.size() > 0) {
			    for (int i=0; i < jsonArr.size(); i++) {
			        JSONObject jsonObj = (JSONObject)jsonArr.get(i);
			        System.out.println((String)jsonObj.get("dp_subname"));  
					System.out.println((String)jsonObj.get("dp_main_img"));
					System.out.println((String)jsonObj.get("dp_artist"));
					System.out.println((String)jsonObj.get("dp_homepage"));
					System.out.println((String)jsonObj.get("dp_event"));
					System.out.println((String)jsonObj.get("dp_art_part"));
					System.out.println((String)jsonObj.get("dp_sponsor"));
					System.out.println((String)jsonObj.get("dp_info"));
					System.out.println((String)jsonObj.get("dp_place"));
					System.out.println((String)jsonObj.get("dp_viewpoint"));
					System.out.println((String)jsonObj.get("dp_end"));
					System.out.println((String)jsonObj.get("dp_name"));
					System.out.println((String)jsonObj.get("dp_viewcharge"));
					System.out.println((String)jsonObj.get("dp_viewtime"));
					System.out.println((String)jsonObj.get("dp_start"));
					System.out.println( Integer.parseInt((String)jsonObj.get("dp_seq")) );
					System.out.println((String)jsonObj.get("dp_lnk"));
					System.out.println((String)jsonObj.get("dp_art_cnt"));

					 
					// (int)Object
					// Integer.parseInt  Object -> String -> int  
					
					DP_SEQ = Integer.parseInt((String)jsonObj.get("dp_seq"));
					DP_NAME = (String)jsonObj.get("dp_name");
					DP_SUBNAME = (String)jsonObj.get("dp_subname");
					DP_PLACE = (String)jsonObj.get("dp_place");
					DP_START = (String)jsonObj.get("dp_start");
					DP_END = (String)jsonObj.get("dp_end");
					DP_HOMEPAGE = (String)jsonObj.get("dp_homepage");
					DP_EVENT = (String)jsonObj.get("dp_event");
					DP_SPONSOR = (String)jsonObj.get("dp_sponsor");
					DP_VIEWTIME = (String)jsonObj.get("dp_viewtime");
					DP_VIEWCHARGE = (String)jsonObj.get("dp_viewcharge");
					DP_ART_PART = (String)jsonObj.get("dp_art_part");
					DP_ART_CNT = (String)jsonObj.get("dp_art_cnt");
					DP_ARTIST = (String)jsonObj.get("dp_artist");
					DP_VIEWPOINT = (String)jsonObj.get("dp_viewpoint");
					DP_INFO = (String)jsonObj.get("dp_info");
					DP_MAIN_IMG = (String)jsonObj.get("dp_main_img");
					DP_LNK = (String)jsonObj.get("dp_link");
					
					
					psmt.setInt(1, DP_SEQ);
					psmt.setString(2, DP_NAME);
					psmt.setString(3, DP_SUBNAME);
					psmt.setString(4, DP_PLACE);
					psmt.setString(5, DP_START);
					psmt.setString(6, DP_END);
					psmt.setString(7, DP_HOMEPAGE);
					psmt.setString(8, DP_EVENT);
					psmt.setString(9, DP_SPONSOR);
					psmt.setString(10, DP_VIEWTIME);
					psmt.setString(11, DP_VIEWCHARGE);
					psmt.setString(12, DP_ART_PART);
					psmt.setString(13, DP_ART_CNT);
					psmt.setString(14, DP_ARTIST);
					psmt.setString(15, DP_VIEWPOINT);
					psmt.setString(16, DP_INFO);
					psmt.setString(17, DP_MAIN_IMG);
					psmt.setString(18, DP_LNK);

					int r = psmt.executeUpdate();
					
					System.out.println("SQL 실행:"+r+"개 의 row삽입");
				}
			}

			//SQL문 작성
			String SQL2 = "INSERT INTO exhibitionData (DP_SEQ, DP_NAME, DP_SUBNAME, DP_PLACE, "
	        		+ "DP_START, DP_END, DP_HOMEPAGE, DP_EVENT, DP_SPONSOR, DP_VIEWTIME, "
	        		+ "DP_VIEWCHARGE, DP_ART_PART, DP_ART_CNT, DP_ARTIST, DP_VIEWPOINT, "
	        		+ "DP_INFO, DP_MAIN_IMG, DP_LNK) "
	        		+ "VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), "
	        		+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			psmt = conn.prepareStatement(SQL2);
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			CloseUtil.close(null, stmt, conn);
		}
		
	}

}