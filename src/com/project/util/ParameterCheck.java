package com.project.util;

import java.util.ArrayList;
import java.util.List;

import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;

public class ParameterCheck {

	public static int nullToZero(String tmp) {
		int num = 0;
		if(isNumber(tmp)) {
			num = Integer.parseInt(tmp);
		}
		return num;
	}
	
	public static int nullToOne(String tmp) {
		int num = 1;
		if(isNumber(tmp)) {
			num = Integer.parseInt(tmp);
		}
		return num;
	}

	private static boolean isNumber(String tmp) {
		if(tmp != null && !tmp.isEmpty()) {
			int len = tmp.length();
			for(int i=0;i<len;i++) {
				int x = tmp.charAt(i) - 48;
				if(x < 0 || x > 9)
					return false;
			}
		} else
			return false;
		return true;
	}
	
	public static String nullToBlank(String tmp) {
		if(tmp == null)
			return " ";
		return tmp;
	}
	
}



















