package com.project.message.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;

public class AcceptPlannerRequestAction implements Action{

	
	private static AcceptPlannerRequestAction acceptPlannerRequestAction;
	
	private AcceptPlannerRequestAction(){};
	
	static {
		
		acceptPlannerRequestAction = new AcceptPlannerRequestAction();
	}
	
	
	public static AcceptPlannerRequestAction getAcceptPlannerRequestAction() {
		return acceptPlannerRequestAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
