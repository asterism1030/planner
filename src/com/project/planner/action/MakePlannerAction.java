package com.project.planner.action;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.Encoder;

public class MakePlannerAction implements Action{

	private static MakePlannerAction makePlannerAction;
	
	private MakePlannerAction(){};
	
	static {
		
		makePlannerAction = new MakePlannerAction();
	}
	
	
	
	
	public static MakePlannerAction getMakePlannerAction() {
		return makePlannerAction;
	}




	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      
	      Random random = new Random();
	      int randomNumber = random.nextInt(10)+1;
	      HttpSession session = request.getSession();
	      MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
	      PlannerDto plannerDto = new PlannerDto();
	      String startdate = request.getParameter("startdate");
	      plannerDto.setP_img("a"+randomNumber);
	      plannerDto.setM_id(memberDto.getM_id());
	      plannerDto.setM_name(memberDto.getM_name());
	      plannerDto.setStart_day(request.getParameter("startdate"));
	      plannerDto.setEnd_day(request.getParameter("enddate"));
	      plannerDto.setP_subject(Encoder.isoToUtf(request.getParameter("plannername")));
	      
//	      String plannerName = Encoder.isoToUtf(request.getParameter("plannername"));
	      
	      
	      
	      int p_id = PlannerServiceImpl.getPlannerService().makePlanner(plannerDto);
	      return "/planner/dayplan.jsp?p_id=" + p_id+"&startdate="+startdate;
	   }

	
	
	
}
