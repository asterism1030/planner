package com.project.friend.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.friend.model.service.FriendServiceImpl;

public class CheckFriendIdAction implements Action{

	private static CheckFriendIdAction checkFriendIdAction;
	private CheckFriendIdAction(){};
	
	static{
		checkFriendIdAction = new CheckFriendIdAction();
	}
	
	

	public static CheckFriendIdAction getCheckFriendIdAction() {
		return checkFriendIdAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String toid= request.getParameter("toid");
		int check = FriendServiceImpl.getFriendServiceImpl().checkFriendId(toid);
		String result="";
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		JSONObject jobj = new JSONObject();
		
		if(check == 0){
			
			result= "<font color='red'>"+toid+"는 존재하지 않는 아이디입니다.</font>";
			jobj.put("result", result);
			jobj.put("check", check);
			jarray.add(jobj);
			
		} else{
			
			jobj.put("result", result);
			jobj.put("check", check);
			jarray.add(jobj);
		}
		
		
		json.put("result",jarray);
		return json.toString();
	}

}
