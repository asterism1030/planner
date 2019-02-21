package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.member.action.EmailSearchAction;
import com.project.member.model.service.MemberServiceImpl;

public class EmailSearchAction implements Action{
	
	private EmailSearchAction(){};
	private static EmailSearchAction emailSearchAction;
	static {
		emailSearchAction = new EmailSearchAction();
	}
	//////////////////////////////////
	public static EmailSearchAction getEmailSearchAction() {
		return emailSearchAction;
	}
	
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("youremail");
		//존재시 1, 없을시 0
		int reg = MemberServiceImpl.getMemberService().emailCheck(email);
		
		JSONObject json = new JSONObject();
		String result = "";
		if(reg == 1)
			result= "<font color='red'>"+email+"은 사용할 수 없습니다.</font>";
		else 
			result = "<font color='blue'>"+email+"은 사용할 수 있습니다.</font>";
		
		json.put("result",result);
		return json.toString();
	}
	
	
}