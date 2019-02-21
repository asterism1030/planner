package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.project.action.Action;

public class LogOutAction implements Action{

		
	private LogOutAction(){}
	private static LogOutAction logOutAction;
	static{
		logOutAction = new LogOutAction();
	}
	
	
	
	public static LogOutAction getLogOutAction() {
		return logOutAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
		return "/main.jsp";
	}

}
