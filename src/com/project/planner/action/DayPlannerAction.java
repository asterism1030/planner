package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class DayPlannerAction implements Action{

	
	private static DayPlannerAction dayPlannerAction;
	
	static {
		dayPlannerAction = new DayPlannerAction();
	}
	
	private DayPlannerAction() {}
	

	public static DayPlannerAction getDayPlannerAction() {
		return dayPlannerAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String p_id = request.getParameter("p_id");
		
		List<DayRouteDto> drlist = PlannerServiceImpl.getPlannerService().dayRoute(p_id);
		List<DayPlanDto> dplist = PlannerServiceImpl.getPlannerService().dayPlan(p_id);
		List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().plannerInfo(p_id);
		List<GroupMemberDto> glist = PlannerServiceImpl.getPlannerService().groupMember(p_id);
		int firstLike = PlannerServiceImpl.getPlannerService().getLike(p_id, memberDto.getM_id());
		
		request.setAttribute("plannerInfo", plist);
		request.setAttribute("dayroute", drlist);
		request.setAttribute("dayplan", dplist);
		request.setAttribute("groupmember", glist);
		request.setAttribute("firstlike", firstLike);
		return "/planner/plannerdetail.jsp";
	}
	
}
