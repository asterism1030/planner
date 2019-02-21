package com.project.admin.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.admin.model.service.AdminServiceImpl;

public class MemberDataAction implements Action {
	
	private MemberDataAction(){}
	private static MemberDataAction memberDataAction;
	static {
		memberDataAction = new MemberDataAction();
	}
	
	
	public static MemberDataAction getMemberDataAction() {
		return memberDataAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String> mem = AdminServiceImpl.getAdminServiceImpl().getMemberDatas();
		
		JSONObject jobj = new JSONObject();
		
		jobj.put("allMembers", mem.get("allMembers"));
		jobj.put("avgPlans", mem.get("avgPlans"));
		jobj.put("avgFriends", mem.get("avgFriends"));
		jobj.put("allMen", mem.get("allMen"));
		jobj.put("allWomen", mem.get("allWomen"));
		jobj.put("avgAge", mem.get("avgAge"));
		jobj.put("teens", mem.get("teens"));
		jobj.put("twelves", mem.get("twelves"));
		jobj.put("thirties", mem.get("thirties"));
		jobj.put("forties", mem.get("forties"));
		jobj.put("facebook", mem.get("facebook"));
		jobj.put("google", mem.get("google"));
		jobj.put("general", mem.get("general"));
		
		/*
		+-------------------------------+
		|allMembers avgPlans ...		|
		+-------------------------------+

		 */
		return jobj.toJSONString();
	}

}
