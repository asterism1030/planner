package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.env.ISourceMethod;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.PageNavigator;
import com.project.util.ParameterCheck;

public class MyPlannerAction implements Action{

	
	private static MyPlannerAction myPlannerAction;
	
	static {
		myPlannerAction = new MyPlannerAction();
	}
	
	private MyPlannerAction() {}
	

	public static MyPlannerAction getMyPlannerAction() {
		return myPlannerAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		int pg = ParameterCheck.nullToOne(request.getParameter("pg"));
		
		String getSelect = request.getParameter("select");
		int select = 1;
		
		if(getSelect != null) {
			select = Integer.parseInt(getSelect);
		}
		
		if(select != 2) {
			List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().myPlanner(memberDto.getM_id(), select, pg);
			request.setAttribute("myplanner", plist);
		
			PageNavigator navigator = PlannerServiceImpl.getPlannerService().getPageNavigator(memberDto.getM_id(), pg, select);
			navigator.makeNavigator();
			
			request.setAttribute("navigator", navigator);
		} else if(select == 2) {
			List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().myPlanner(memberDto.getM_id(), pg);
			request.setAttribute("myplanner", plist);
			
			PageNavigator navigator = PlannerServiceImpl.getPlannerService().getPageNavigator(memberDto.getM_id(), pg, select);
			navigator.makeNavigator();
			
			request.setAttribute("navigator", navigator);
		}
		
		return "/planner/myplanner.jsp";
	}
	
}
