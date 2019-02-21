package com.project.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.admin.model.service.AdminServiceImpl;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.util.Encoder;

public class SearchMemberAction implements Action {

	private SearchMemberAction(){}
	private static SearchMemberAction searchMemberAction;
	static {
		searchMemberAction = new SearchMemberAction();
	}
	
	public static SearchMemberAction getSearchMemberAction() {
		return searchMemberAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//key는 m_name만 해당하므로 사실상 쓸일은 없다
		String key = request.getParameter("key");
		String word = Encoder.isoToUtf(request.getParameter("word"));
		List<MemberDto> members = AdminServiceImpl.getAdminServiceImpl().getSearchMembers(key, word);
		
		
		int size = members.size();
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		
		for(int i = 0; i < size; i ++) {
			JSONObject obj = new JSONObject();
			obj.put("m_id", members.get(i).getM_id());
			obj.put("m_name", members.get(i).getM_name());
			obj.put("m_pass", members.get(i).getM_pass());
			obj.put("m_birth", members.get(i).getM_birth());
			obj.put("m_gender", members.get(i).getM_gender());
			
			//멤버별 플래너
			List<PlannerDto> plans = AdminServiceImpl.getAdminServiceImpl().getPlanners(members.get(i).getM_id());
			int psize = plans.size();
			JSONArray parray = new JSONArray();
			for(int j=0; j < psize; j++) {
				JSONObject pobj = new JSONObject();
				pobj.put("p_id", plans.get(j).getP_id());
				pobj.put("p_subject", plans.get(j).getP_subject());
				pobj.put("likes", plans.get(j).getLikes());
				parray.add(pobj);
			}
			obj.put("plans",parray);
			/////////////////////////////
			//멤버별 친구
			List<String> friends = AdminServiceImpl.getAdminServiceImpl().getFriends(members.get(i).getM_id());
			int fsize = friends.size();
			JSONArray farray = new JSONArray();
			for(int j=0; j < fsize; j++) {
				JSONObject fobj = new JSONObject();
				fobj.put("f_id", friends.get(j));
				farray.add(fobj);
			}
			obj.put("friends",farray);
			array.add(obj);
		}
		
		json.put("members", array);

		return json.toJSONString();
	}

}
