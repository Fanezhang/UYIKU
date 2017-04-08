package cn.uyiku.tool;

import java.util.Calendar;

public class SeasonTool {
	
	public static String getSeason(){
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis( System.currentTimeMillis());
		int month = cal.get(Calendar.MONTH) + 1; 
		String season = null;
		switch (month) {
		case 2: 
		case 3:
		case 4:
		case 8:
		case 9:
		case 10:
			season="春秋";
			break;
		case 11:
		case 12:
		case 1:
			season="冬";
			break;

		case 5:
		case 6:
		case 7:
			season="冬";

	}
		return season;
	}
}
