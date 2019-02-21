package com.project.planner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.factory.PlannerActionFactory;
import com.project.util.MovePage;

@WebServlet("/dayroute")
public class DayRouteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/main.jsp";
		
		
		if("saveplanner".equals(act)) { //일별 플래너 저장
			
			path = PlannerActionFactory.getSavePlannerAction().action(request, response);
			MovePage.redirect(root+path, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}
