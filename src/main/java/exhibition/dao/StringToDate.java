package exhibition.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
 

public class StringToDate {

	//1. String -> java.util.Date 변환 날짜로 활용
	public static java.util.Date convertStringToUtilDate(String date) throws ParseException {
		//java.text.SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.text.SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date outPutDate = dateFormat.parse(date);
		
		return outPutDate;
	}
}
