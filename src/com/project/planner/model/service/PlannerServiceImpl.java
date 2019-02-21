package com.project.planner.model.service;

import java.text.*;
import java.util.*;

import org.json.simple.JSONObject;

import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.dao.PlannerDaoImpl;
import com.project.util.PageNavigator;

public class PlannerServiceImpl implements PlannerService{

private static PlannerService plannerService;
	
	static {
		plannerService = new PlannerServiceImpl();
	}
	
	private PlannerServiceImpl() {}
	
	
	
	public static PlannerService getPlannerService() {
		return plannerService;
	}




	@Override
	public List<DayRouteDto> dayRoute(String p_id) {
		return PlannerDaoImpl.getPlannerDao().dayRoute(p_id);
	}


	@Override
	public List<DayPlanDto> dayPlan(String p_id) {
		return PlannerDaoImpl.getPlannerDao().dayPlan(p_id);
	}



	@Override
	public List<GroupMemberDto> groupMember(String p_id) {
		return PlannerDaoImpl.getPlannerDao().groupMember(p_id);
	}



	@Override
	public List<PlannerDto> plannerInfo(String p_id) {
		return PlannerDaoImpl.getPlannerDao().plannerInfo(p_id);
	}



	@Override
	public int makePlanner(PlannerDto plannerDto) {
		
		Map<String,String>map = new HashMap<String,String>();
		map.put("m_id", plannerDto.getM_id());
		map.put("m_name", plannerDto.getM_name());
		map.put("plannerName", plannerDto.getP_subject());
		map.put("startDate", plannerDto.getStart_day());
		map.put("endDate", plannerDto.getEnd_day());
		map.put("p_img", plannerDto.getP_img());
		int p_id =  PlannerDaoImpl.getPlannerDao().makePlanner(map);
		return p_id;
	}



	@Override
	public List<String> calDate(int p_id) {
		List<String> dateList = PlannerDaoImpl.getPlannerDao().dateList(p_id);
		List<String> calDateList = new ArrayList<String>();
		
		String startDate = dateList.get(0);
		String endDate = dateList.get(1);
		
//		String s1 = "2008-01-10";
//		String s2 = "2008-02-11";

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		// Date타입으로 변경
		
		
		Date d1 = new Date();
		Date d2 = new Date();
		try {
			d1 = df.parse(startDate);
			d2 = df.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		// Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime(d1);
		c2.setTime(d2);

		// 시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		while (c1.compareTo(c2) != 1) {

			// 출력
			calDateList.add(df.format(c1.getTime()));
			// 시작날짜 + 1 일
			c1.add(Calendar.DATE, 1);
		}
		return calDateList;
	}
	
	@Override
	public String changeComplete(String p_id, int complete) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("complete", complete + "");
		int getcomplete = PlannerDaoImpl.getPlannerDao().changeComplete(map);
		
		JSONObject json = new JSONObject();
		json.put("getcomplete", getcomplete);
		return  json.toJSONString();
	}



	@Override
	public String changePublic(String p_id, int publics) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("publics", publics + "");
		int getpublic = PlannerDaoImpl.getPlannerDao().changePublic(map);
		
		JSONObject json = new JSONObject();
		json.put("getpublic", getpublic);
		return  json.toJSONString();
	}



	@Override
	public int addPlanner_plan_route(DayPlanDto dayPlanDto, List<DayRouteDto> dayRouteDto) {
		return PlannerDaoImpl.getPlannerDao().addPlanner_plan_route(dayPlanDto, dayRouteDto);
	}



	@Override
	public DayPlanDto getDayPlan(String date, int p_id) {
		return PlannerDaoImpl.getPlannerDao().getDayPlan(date, p_id);
	}



	@Override
	public List<DayRouteDto> getDayRoute(String date, int p_id) {
		return PlannerDaoImpl.getPlannerDao().getDayRoute(date, p_id);
	}



	@Override
	public String changeLike(String p_id, String m_id, int like) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("m_id", m_id);
		map.put("like", like + "");
		int getlike = PlannerDaoImpl.getPlannerDao().changeLike(map);
		
		JSONObject json = new JSONObject();
		json.put("getlike", getlike);
		return  json.toJSONString();
	}



	@Override
	public int getLike(String p_id, String m_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("m_id", m_id);
		return PlannerDaoImpl.getPlannerDao().getLike(map);
	}



	@Override
	public List<PlannerDto> plannerSquare(int pg, String key, String word) {
		int end = pg * 12;
		int start = end - 12;
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		map.put("start", start+"");
		map.put("end", end+"");
		
		return PlannerDaoImpl.getPlannerDao().plannerSquare(map);
	}



	@Override
	public List<PlannerDto> bestPlanner() {
		return PlannerDaoImpl.getPlannerDao().bestPlanner();
	}


	@Override
	public List<PlannerDto> myPlanner(String m_id, int complete, int pg) {
		int end = pg * 12;
		int start = end - 12;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("complete", complete + "");
		map.put("start", start+"");
		map.put("end", end+"");
		return PlannerDaoImpl.getPlannerDao().myPlanner(map);
	}
	
	

	@Override
	public List<PlannerDto> myPlanner(String m_id, int pg) {
		
		int end = pg * 12;
		int start = end - 12;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("start", start+"");
		map.put("end", end+"");
		
		return PlannerDaoImpl.getPlannerDao().myPlannerLike(map);
	}



	@Override
	public void deletePlanner(String p_id) {
		PlannerDaoImpl.getPlannerDao().deletePlanner(p_id);
	}
	
	@Override
	public int addDayPlan(DayPlanDto dayPlanDto) {
		// TODO Auto-generated method stub
		return PlannerDaoImpl.getPlannerDao().addDayPlan(dayPlanDto);
	}



	@Override
	public int addDayRoute(List<DayRouteDto> list) {
		// TODO Auto-generated method stub
		return PlannerDaoImpl.getPlannerDao().addDayRoute(list);
	}



	@Override
	public int deleteDayRoute(int p_id, String date) {
		
		return PlannerDaoImpl.getPlannerDao().deleteDayRoute(p_id, date);
	}
	
	
	@Override
	public PageNavigator getPageNavigatorSquare(int pg, String key, String word) {
		int listSize = 12;
		int pageSize = 5;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		
		PageNavigator navigator = new PageNavigator();
		
		int totalArticleCount = PlannerDaoImpl.getPlannerDao().getTotalArticleCountSquare(map);
		navigator.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount -1) / listSize + 1;
		navigator.setTotalPageCount(totalPageCount);
		navigator.setNowFirst(pg <= pageSize);
		navigator.setNowEnd((totalPageCount - 1) / pageSize * pageSize < pg);
		navigator.setPageNo(pg);
		
		return navigator;
	}



	@Override
	public PageNavigator getPageNavigator(String m_id, int pg, int select) {
		int listSize = 12;
		int pageSize = 5;
		
		PageNavigator navigator = new PageNavigator();
		
		if(select != 2) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("complete", select+"");
			map.put("m_id", m_id);
			
			int totalArticleCount = PlannerDaoImpl.getPlannerDao().getTotalArticleCount(map);
			navigator.setTotalArticleCount(totalArticleCount);
			int totalPageCount = (totalArticleCount -1) / listSize + 1;
			navigator.setTotalPageCount(totalPageCount);
			navigator.setNowFirst(pg <= pageSize);
			navigator.setNowEnd((totalPageCount - 1) / pageSize * pageSize < pg);
			navigator.setPageNo(pg);
		
		} else if (select == 2) {
			
			int totalArticleCount = PlannerDaoImpl.getPlannerDao().getTotalArticleCount(m_id);
			navigator.setTotalArticleCount(totalArticleCount);
			int totalPageCount = (totalArticleCount -1) / listSize + 1;
			navigator.setTotalPageCount(totalPageCount);
			navigator.setNowFirst(pg <= pageSize);
			navigator.setNowEnd((totalPageCount - 1) / pageSize * pageSize < pg);
			navigator.setPageNo(pg);
			
		}
		
		return navigator;
	}



	@Override
	public List<PlannerDto> adminSelectPlanner() {
		return PlannerDaoImpl.getPlannerDao().adminSelectPlanner();
	}

}

















