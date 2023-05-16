package exhibition.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

public class MyDateUtil {

	public static String convertStringToUtilDate(String date) throws ParseException {
		java.text.SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.text.SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = inputFormat.parse(date);
		String outputDate = outputFormat.format(utilDate);
		
		return outputDate;
	}	
}
