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
import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;

public class ListMemberAction implements Action {

	private ListMemberAction(){}
	private static ListMemberAction listMemberAction;
	static {
		listMemberAction = new ListMemberAction();
	}
	
	public static ListMemberAction getListMemberAction() {
		return listMemberAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//¸â¹ö
		List<MemberDto> members = AdminServiceImpl.getAdminServiceImpl().getMembers();
		
		
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
			
			//¸â¹öº° ÇÃ·¡³Ê
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
			//¸â¹öº° Ä£±¸
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
