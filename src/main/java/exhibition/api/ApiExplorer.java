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

import java.io.BufferedReader;
//import java.io.IOException;

public class ApiExplorer {
	public static void main(String[] args) {

		try {
//
			String jsonStr = getApiJson();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(jsonStr);
			
//			System.out.println(jsonObject.get("ListExhibitionOfSeoulMOAInfo"));
			JSONObject exInfoObj = (JSONObject)jsonObject.get("ListExhibitionOfSeoulMOAInfo");
			JSONArray exInfoArray = (JSONArray)exInfoObj.get("row");
			List<ExhibitionInfo> exInfoList = new ArrayList<ExhibitionInfo>();
			
			for(int i=0; i<exInfoArray.size(); i++) {
				ExhibitionInfo exInfo = new ExhibitionInfo(); // 객체에 담아서 옮기기
				JSONObject rowObj = (JSONObject)exInfoArray.get(i);
				exInfo.setDP_SEQ(Integer.parseInt(rowObj.get("DP_SEQ").toString()));
				exInfo.setDP_NAME(rowObj.get("DP_NAME").toString());
				exInfo.setDP_SUBNAME(rowObj.get("DP_SUBNAME").toString());
				exInfo.setDP_PLACE(rowObj.get("DP_PLACE").toString());
				exInfo.setDP_START(rowObj.get("DP_START").toString());
				exInfo.setDP_END(rowObj.get("DP_END").toString());
				exInfo.setDP_HOMEPAGE(rowObj.get("DP_HOMEPAGE").toString());
				exInfo.setDP_EVENT(rowObj.get("DP_EVENT").toString());
				exInfo.setDP_SPONSOR(rowObj.get("DP_SPONSOR").toString());
				exInfo.setDP_VIEWTIME(rowObj.get("DP_VIEWTIME").toString());
				exInfo.setDP_VIEWCHARGE(rowObj.get("DP_VIEWCHARGE").toString());
				exInfo.setDP_ART_PART(rowObj.get("DP_ART_PART").toString());
				exInfo.setDP_ART_CNT(rowObj.get("DP_ART_CNT").toString());
				exInfo.setDP_ARTIST(rowObj.get("DP_ARTIST").toString());
				exInfo.setDP_VIEWPOINT(rowObj.get("DP_VIEWPOINT").toString());
				exInfo.setDP_INFO(rowObj.get("DP_INFO").toString());
				exInfo.setDP_MAIN_IMG(rowObj.get("DP_MAIN_IMG").toString());
				exInfo.setDP_LNK(rowObj.get("DP_LNK").toString());

				exInfoList.add(exInfo);
			}
			
			System.out.println(exInfoList);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getApiJson() throws Exception {
    	// 1. URL을 만들기 위한 StringBuilder.
        StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088/7a677841506c796e343472525a6f67/json/ListExhibitionOfSeoulMOAInfo/1/10/"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        urlBuilder.append("?" + URLEncoder.encode("KEY","UTF-8")); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("TYPE","UTF-8")); /*XML 또는 JSON*/
        urlBuilder.append("&" + URLEncoder.encode("SERVICE","UTF-8")); /*서비스명*/
        urlBuilder.append("&" + URLEncoder.encode("START_INDEX","UTF-8")); /*요청시작위치*/
        urlBuilder.append("&" + URLEncoder.encode("END_INDEX","UTF-8")); /*요청종료위치*/
//        urlBuilder.append("&" + URLEncoder.encode("DP_SEQ","UTF-8")); /*전시일련번호 (opt)*/ ....
        // 3. URL 객체 생성.
        URL url = new URL(urlBuilder.toString());
        // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        // 5. 통신을 위한 메소드 SET.
        conn.setRequestMethod("GET");
        // 6. 통신을 위한 Content-type SET. 
        conn.setRequestProperty("Content-type", "application/json");
        // 7. 통신 응답 코드 확인.
//        System.out.println("Response code: " + conn.getResponseCode());
        // 8. 전달받은 데이터를 BufferedReader 객체로 저장.
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        // 10. 객체 해제.
        rd.close();
        conn.disconnect();
//      // 11. 전달받은 데이터 확인.
//       System.out.println(sb.toString());
        
        return sb.toString();
        
		}
	
	
	}
