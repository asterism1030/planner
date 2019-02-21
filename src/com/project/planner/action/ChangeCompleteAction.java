package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.comment.model.CommentDto;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class ChangeCompleteAction implements Action {
	
	private static ChangeCompleteAction changeCompleteAction;
	
	static {
		changeCompleteAction = new ChangeCompleteAction();
	}
	
	private ChangeCompleteAction() {}
	
	
	public static ChangeCompleteAction getChangeCompleteAction() {
		return changeCompleteAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String p_id = request.getParameter("p_id");
		int complete = Integer.parseInt(request.getParameter("complete"));
		
		String cpt = PlannerServiceImpl.getPlannerService().changeComplete(p_id, complete);
		
		List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().plannerInfo(p_id);
		
		return cpt;
	}

}
