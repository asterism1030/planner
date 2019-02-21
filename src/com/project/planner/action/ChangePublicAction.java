package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class ChangePublicAction implements Action {
	
	private static ChangePublicAction changePublicAction;
	
	static {
		changePublicAction = new ChangePublicAction();
	}
	
	private ChangePublicAction() {}

	public static ChangePublicAction getChangePublicAction() {
		return changePublicAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String p_id = request.getParameter("p_id");
		int publics = Integer.parseInt(request.getParameter("publics"));
		
		String chgPublic = PlannerServiceImpl.getPlannerService().changePublic(p_id, publics);
		
		
		return chgPublic;
	}

}
