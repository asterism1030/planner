package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.ParameterCheck;

public class GetDayDataAction implements Action {
	
	private static GetDayDataAction getDayDataAction;
	private GetDayDataAction(){}
	static {
		getDayDataAction = new GetDayDataAction();
	}
	
	public static GetDayDataAction getGetDayDataAction() {
		return getDayDataAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String date = request.getParameter("date");
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		
		DayPlanDto dayPlanDto = PlannerServiceImpl.getPlannerService().getDayPlan(date, p_id);
		List<DayRouteDto> list = PlannerServiceImpl.getPlannerService().getDayRoute(date, p_id);
		
		JSONObject json = new JSONObject();
		JSONArray orderArray = new JSONArray();
		JSONArray latArray = new JSONArray();
		JSONArray lngArray = new JSONArray();
		JSONArray locationArray = new JSONArray();
		JSONObject plannerInfo = new JSONObject();
		
		//plan
		plannerInfo.put( "transport" , ParameterCheck.nullToBlank(dayPlanDto.getDp_transportation()) );
		plannerInfo.put( "house" , ParameterCheck.nullToBlank(dayPlanDto.getDp_lodgment()) );
		plannerInfo.put( "memo" , ParameterCheck.nullToBlank(dayPlanDto.getDp_memo()));
		
		//route
		for(DayRouteDto dayRouteDto : list) {
			
			JSONObject route = new JSONObject();
			JSONObject order = new JSONObject();
			JSONObject lat = new JSONObject();
			JSONObject lng = new JSONObject();
			JSONObject location = new JSONObject();
			
			order.put("order", dayRouteDto.getDr_order());
			lat.put("lat", dayRouteDto.getDr_lat());
			lng.put("lng", dayRouteDto.getDr_lng());
			location.put("location", dayRouteDto.getDr_location());
			
			orderArray.add(order);
			latArray.add(lat);
			lngArray.add(lng);
			locationArray.add(location);
			
		}
		plannerInfo.put( "orderAll" , orderArray);
		plannerInfo.put( "latAll" , latArray);
		plannerInfo.put( "lngAll" , lngArray);
		plannerInfo.put( "locationAll" , locationArray);
		
		json.put( "getdata" , plannerInfo );
		
		/*
		 			getdata
		 |--------------------------------------------------------------------|
		 |transport  house  memo  route -> r1  r2  r3 ...order -> 0 1 2 ......|
		 |																	  |
		 |lat -> lat1 lat2 lat3 ........   lng -> lng1 lng2 lng3............  |
		 |																	  |
		 |location -> loc1 loc2 loc3 .........								  |
		 |--------------------------------------------------------------------|
		 */
		return json.toJSONString();
	}

}
