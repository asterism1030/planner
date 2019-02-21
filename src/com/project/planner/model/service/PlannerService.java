package com.project.planner.model.service;

import java.util.List;

import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.PlannerDto;
import com.project.util.PageNavigator;

public interface PlannerService {

	List<DayRouteDto> dayRoute(String p_id);

	List<DayPlanDto> dayPlan(String p_id);

	List<PlannerDto> myPlanner(String m_id, int complete, int pg);
	
	List<PlannerDto> myPlanner(String m_id, int pg);
	
	void deletePlanner(String p_id);

	List<GroupMemberDto> groupMember(String p_id);

	List<PlannerDto> plannerInfo(String p_id);
	
	List<PlannerDto> plannerSquare(int pg, String key, String word);
	
	List<PlannerDto> bestPlanner();
	
	List<PlannerDto> adminSelectPlanner();

	int makePlanner(PlannerDto plannerDto);

	List<String> calDate(int p_id);

	String changeComplete(String p_id, int complete);

	String changePublic(String p_id, int publics);
	
	String changeLike(String p_id, String m_id, int like);
	
	int getLike(String p_id, String m_id);

	// 일별 플래너 데이터 저장
	int addPlanner_plan_route(DayPlanDto dayPlanDto, List<DayRouteDto> dayRouteDto);

	// 플래너 (하루) 데이터 가져오기
	DayPlanDto getDayPlan(String date, int p_id);

	List<DayRouteDto> getDayRoute(String date, int p_id);
	
	
	int addDayPlan(DayPlanDto dayPlanDto);
	int addDayRoute(List<DayRouteDto> list);
	int deleteDayRoute(int p_id, String date);
	
	
	PageNavigator getPageNavigatorSquare(int pg, String key, String word);
	
	PageNavigator getPageNavigator(String m_id, int pg, int select);
}
