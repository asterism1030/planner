package com.project.planner.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.ParameterCheck;

public class SavePlannerAction implements Action{

private static SavePlannerAction savePlannerAction;
	
	private SavePlannerAction(){};
	
	static {
		
		savePlannerAction = new SavePlannerAction();
	}
	
	public static SavePlannerAction getSavePlannerAction() {
		return savePlannerAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DayPlanDto dayPlanDto = new DayPlanDto();
		List<DayRouteDto> list = new ArrayList<DayRouteDto>();
		String startdate = request.getParameter("startdate");
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String date = request.getParameter("date");
		String house = ParameterCheck.nullToBlank(request.getParameter("house"));
		String memo = ParameterCheck.nullToBlank(request.getParameter("memo"));
		String transport = ParameterCheck.nullToBlank(request.getParameter("transport"));
		
		dayPlanDto.setP_id(p_id);
		dayPlanDto.setDp_date(date);
		dayPlanDto.setDp_lodgment(house);
		dayPlanDto.setDp_memo(memo);
		dayPlanDto.setDp_transportation(transport);
		
		String lat[] = (request.getParameter("lat")).split("##");
		String lng[] = (request.getParameter("lng")).split("##");
		String location[] = request.getParameter("location").split("##");
		String order[] = (request.getParameter("order")).split("##");
		PlannerServiceImpl.getPlannerService().addDayPlan(dayPlanDto);
		PlannerServiceImpl.getPlannerService().deleteDayRoute(p_id, date);
		int len = location.length;
		if(!location[0].equals("")){
			for(int i = 0 ; i <len; i++){
				DayRouteDto dayRouteDto = new DayRouteDto();
				dayRouteDto.setP_id(p_id);
				dayRouteDto.setDr_date(date);
				dayRouteDto.setDr_order(Integer.parseInt(order[i]));
				dayRouteDto.setDr_location(location[i]);
				dayRouteDto.setDr_lat(Double.parseDouble(lat[i]));
				dayRouteDto.setDr_lng(Double.parseDouble(lng[i]));
				list.add(dayRouteDto);
			}
			
			PlannerServiceImpl.getPlannerService().addDayRoute(list);
		}
		
		
		
//		return "";
		return "/planner/dayplan.jsp?p_id="+p_id+"&startdate="+startdate;
	}
	
	
}
