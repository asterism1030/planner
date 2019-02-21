package com.project.planner.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;
import com.project.util.PageNavigator;
import com.project.util.ParameterCheck;
import com.project.util.Encoder;

public class MoveSquareAction implements Action {
	
	private static MoveSquareAction moveSquareAction;
	
	static {
		moveSquareAction = new MoveSquareAction();
	}
	
	private MoveSquareAction() {}
	

	public static MoveSquareAction getMoveSquareAction() {
		return moveSquareAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pg = ParameterCheck.nullToOne(request.getParameter("pg"));
		String key = ParameterCheck.nullToBlank(request.getParameter("key"));//검색조건 : 글번호, 이름, 아이디, 제목
		String word = Encoder.isoToUtf(request.getParameter("word"));//검색어
		List<PlannerDto> plist = PlannerServiceImpl.getPlannerService().plannerSquare(pg, key, word);
		request.setAttribute("plannerlist", plist);
		
		
		PageNavigator navigator = PlannerServiceImpl.getPlannerService().getPageNavigatorSquare(pg, key, word);
		navigator.makeNavigator();
		request.setAttribute("navigator", navigator);
		return "/planner/plannersquare.jsp";
	}

}
