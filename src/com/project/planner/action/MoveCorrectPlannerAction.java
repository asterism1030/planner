package com.project.planner.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;

public class MoveCorrectPlannerAction implements Action{

	private static MoveCorrectPlannerAction moveCorrectPlannerAction;
	
	private MoveCorrectPlannerAction(){};
	
	static{
		
		moveCorrectPlannerAction = new MoveCorrectPlannerAction();
	}

	
	
	public static MoveCorrectPlannerAction getMoveCorrectPlannerAction() {
		return moveCorrectPlannerAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "/planner/dayplan.jsp";
	}
	
	
	
}
