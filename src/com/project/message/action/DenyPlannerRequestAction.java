package com.project.message.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;

public class DenyPlannerRequestAction implements Action{

	private static DenyPlannerRequestAction denyPlannerRequestAction;
	
	private DenyPlannerRequestAction(){};
	
	static {
		
		denyPlannerRequestAction = new DenyPlannerRequestAction();
	}
	
	
	
	public static DenyPlannerRequestAction getDenyPlannerRequestAction() {
		return denyPlannerRequestAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
