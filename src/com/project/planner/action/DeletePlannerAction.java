package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.ParameterCheck;

public class DeletePlannerAction implements Action{

	
	private static DeletePlannerAction deletePlannerAction;
	
	private DeletePlannerAction(){};
	
	static {
		
		deletePlannerAction = new DeletePlannerAction();
	}
	
	public static DeletePlannerAction getDeletePlannerAction() {
		return deletePlannerAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p_id = request.getParameter("p_id");
		int pg = ParameterCheck.nullToOne(request.getParameter("pg"));
		PlannerServiceImpl.getPlannerService().deletePlanner(p_id);
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().myPlanner(memberDto.getM_id(), 1, pg);
		request.setAttribute("myplanner", plist);
		
		return "/planner/myplanner.jsp";
	}

	
	
	
}
