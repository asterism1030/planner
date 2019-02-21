package com.project.admin.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.admin.model.service.AdminServiceImpl;
import com.project.util.ParameterCheck;

public class PlannerDataAction implements Action {
	
	private PlannerDataAction(){}
	private static PlannerDataAction plannerDataAction;
	static {
		plannerDataAction = new PlannerDataAction();
	}
	

	public static PlannerDataAction getPlannerDataAction() {
		return plannerDataAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String> plan = AdminServiceImpl.getAdminServiceImpl().getPlannerDatas();
		
		JSONObject jobj = new JSONObject();
		jobj.put("avgPeriod", plan.get("avgPeriod"));
		jobj.put("allPlanner", plan.get("allPlanner"));
		
		
		JSONArray marray = new JSONArray();
		for(int i = 0; i < 10; i++) {
			marray.add(ParameterCheck.nullToZero(plan.get("period_m"+(i+1))));
		}
		jobj.put("m_period", marray);
		
		
		JSONArray warray = new JSONArray();
		for(int i = 0; i < 10; i++) {
			warray.add(ParameterCheck.nullToZero(plan.get("period_w"+(i+1))));
		}
		jobj.put("w_period", warray);
		
		
		jobj.put("jan", ParameterCheck.nullToZero(plan.get("jan")));
		jobj.put("feb", ParameterCheck.nullToZero(plan.get("feb")));
		jobj.put("mar", ParameterCheck.nullToZero(plan.get("mar")));
		jobj.put("apr", ParameterCheck.nullToZero(plan.get("apr")));
		jobj.put("may", ParameterCheck.nullToZero(plan.get("may")));
		jobj.put("jun", ParameterCheck.nullToZero(plan.get("jun")));
		jobj.put("jul", ParameterCheck.nullToZero(plan.get("jul")));
		jobj.put("aug", ParameterCheck.nullToZero(plan.get("aug")));
		jobj.put("sep", ParameterCheck.nullToZero(plan.get("sep")));
		jobj.put("oct", ParameterCheck.nullToZero(plan.get("oct")));
		jobj.put("nov", ParameterCheck.nullToZero(plan.get("nov")));
		jobj.put("dec", ParameterCheck.nullToZero(plan.get("dec")));
		
		JSONArray yarray = new JSONArray();
		for(int i = 0; i < 10; i++) {
			yarray.add(ParameterCheck.nullToZero(plan.get("year"+(i+1))));
		}
		jobj.put("years", yarray);
		
		
		return jobj.toJSONString();
	}

}
