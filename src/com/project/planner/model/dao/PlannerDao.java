package com.project.planner.model.dao;

import java.util.List;
import java.util.Map;

import com.project.comment.model.CommentDto;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.PlannerDto;

public interface PlannerDao {

	List<DayRouteDto> dayRoute(String p_id);

	List<DayPlanDto> dayPlan(String p_id);

	List<PlannerDto> myPlanner(Map<String, String> map);
	
	List<PlannerDto> myPlannerLike(Map<String, String> map);
	
	void deletePlanner(String p_id);

	List<GroupMemberDto> groupMember(String p_id);

	List<PlannerDto> plannerInfo(String p_id);
	
	List<PlannerDto> plannerSquare(Map<String, String> map);
	
	List<PlannerDto> bestPlanner();
	
	List<PlannerDto> adminSelectPlanner();

	List<CommentDto> comment(String p_id);

	int makePlanner(Map<String, String> map);

	List<String> dateList(int p_id);

	int changeComplete(Map<String, String> map);

	int changePublic(Map<String, String> map);
	
	int changeLike(Map<String, String> map);
	
	int getLike(Map<String, String> map);

	// 일별 플래너 데이터 저장
	int addPlanner_plan_route(DayPlanDto dayPlanDto, List<DayRouteDto> dayRouteDto);

	// 플래너(하루) 데이터 가져오기
	DayPlanDto getDayPlan(String date, int p_id);

	List<DayRouteDto> getDayRoute(String date, int p_id);
	
	int addDayPlan(DayPlanDto dayPlanDto);
	int addDayRoute(List<DayRouteDto> list);
	int deleteDayRoute(int p_id, String date);
	
	int getTotalArticleCountSquare(Map<String, String> map);
	int getTotalArticleCount(Map<String, String> map);
	int getTotalArticleCount(String m_id);

}
