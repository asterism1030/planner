package com.project.friend.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.friend.model.FriendListDto;
import com.project.friend.model.service.FriendServiceImpl;
import com.project.member.model.MemberDto;
import com.project.message.model.FriendRequestDto;
import com.project.message.model.service.MessageServiceImpl;

public class ShowFriendListAction implements Action{

	private static ShowFriendListAction showFriendListAction;
	private ShowFriendListAction(){};
	static{
		showFriendListAction = new ShowFriendListAction();
	}
	
	public static ShowFriendListAction getShowFriendListAction() {
		return showFriendListAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		List<FriendListDto> list = FriendServiceImpl.getFriendServiceImpl().friendList(memberDto.getM_id());
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(FriendListDto friendListDto : list) {
			JSONObject jobj = new JSONObject();//== DTO
			
			jobj.put("fl_id", friendListDto.getFl_id());
			jobj.put("m_id", friendListDto.getM_id());
			jobj.put("f_id", friendListDto.getF_id());
			jobj.put("f_name", friendListDto.getF_name());
			
			jarray.add(jobj);
		}
		
		json.put("friendList", jarray);
		return json.toString();
		
	}

}
