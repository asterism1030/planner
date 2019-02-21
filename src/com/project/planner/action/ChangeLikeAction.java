package com.project.planner.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class ChangeLikeAction implements Action {
	
	private static ChangeLikeAction changeLikeAction;
	
	static {
		changeLikeAction = new ChangeLikeAction();
	}
	
	private ChangeLikeAction() {}
	
	public static ChangeLikeAction getChangeLikeAction() {
		return changeLikeAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String p_id = request.getParameter("p_id");
		int like = Integer.parseInt(request.getParameter("like"));
		
		String chgPublic = PlannerServiceImpl.getPlannerService().changeLike(p_id, memberDto.getM_id(), like);
		
		return chgPublic;
	}

}
