package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.message.model.FriendRequestDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class CalDateAction implements Action{

	private static CalDateAction calDateAction;
	private CalDateAction(){};
	static{
		calDateAction = new CalDateAction();
	}
	
	public static CalDateAction getCalDateAction() {
		return calDateAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		List<String> dateList = PlannerServiceImpl.getPlannerService().calDate(p_id);
		JSONArray jarray = new JSONArray();
		JSONObject json = new JSONObject();
		
		for(String date : dateList) {
			
			jarray.add(date);
		}
		json.put("dayList", jarray);
		return json.toString();
	}
	
}
