package com.project.planner.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.factory.PlannerActionFactory;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.util.Encoder;
import com.project.util.MovePage;



@WebServlet("/planner")
public class PlannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getContextPath();
		String act = request.getParameter("act");
		
		String date = request.getParameter("date");
		String p_id = request.getParameter("p_id");
		
		String select = request.getParameter("select");
		String path = "/main.jsp";
		
		//위도 경도 위치
		DayRouteDto dayRouteDto[] = new DayRouteDto[20];
		DayPlanDto dayPlanDto = new DayPlanDto();
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int num = 0;
		/////////////////////////////////
		if("mvplanner".equals(act)){
			
			path = "/planner/makeplanner.jsp";
			MovePage.redirect(root+path, response);
			
		} else if("makeplanner".equals(act)){
			
			path = PlannerActionFactory.getMakePlannerAction().action(request, response);
			MovePage.redirect(root+path, response);
			
		} else if("mvdayplanner".equals(act)){
			
			String calDate = PlannerActionFactory.getCalDateAction().action(request, response);
			out.println(calDate);
			
		}else if("datelist".equals(act)){
			
			String dateList = PlannerActionFactory.getCalDateAction().action(request, response);
			out.println(dateList);
			
		} else if("dayplan".equals(act)){
			
			path = PlannerActionFactory.getDayPlannerAction().action(request, response);
			path += "?date=" + date + "&p_id=" + p_id;
			MovePage.forward(path, request, response);
			
		} else if("deleteplanner".equals(act)){
			
			path = PlannerActionFactory.getDeletePlannerAction().action(request, response);
			path += "?select=" + select;
			MovePage.forward(path, request, response);
			
		} else if("myplanner".equals(act)){
			
			path = PlannerActionFactory.getMyPlannerAction().action(request, response);
			path += "?select=" + select;
			MovePage.forward(path, request, response);
			
		} else if("plannersquare".equals(act)){
			
			path = PlannerActionFactory.getMoveSquareAction().action(request, response);
			MovePage.forward(path, request, response);
			
		} else if("cptcheck".equals(act)) {
			
			String message = "";
			message = PlannerActionFactory.getChangeCompleteAction().action(request, response);
			out.println(message);
			
		} else if("topublic".equals(act)) {
			
			String message = "";
			message = PlannerActionFactory.getChangePublicAction().action(request, response);
			out.println(message);
			
		} else if("like".equals(act)) {
			
			String message = "";
			message = PlannerActionFactory.getChangeLikeAction().action(request, response);
			out.println(message);
			
		} else if("getdata".equals(act)) { //일별 플래너 데이터 받아옴
			
			String msg = PlannerActionFactory.getGetDayDataAction().action(request, response);
			out.println(msg);
			
		}else if("mvCorrectPlanner".equals(act)){
			
			path = PlannerActionFactory.getMoveCorrectPlannerAction().action(request, response);
			path += "?p_id="+p_id+"&startdate="+date;
			MovePage.redirect(root + path, response);
		}
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		//request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}


}
