package com.project.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.message.model.FriendRequestDto;
import com.project.message.model.service.MessageServiceImpl;

public class DenyFriendRequestAction implements Action{

	private static DenyFriendRequestAction denyFriendRequestAction;
	
	private DenyFriendRequestAction(){};
	
	static {
		
		denyFriendRequestAction = new DenyFriendRequestAction();
	}
	
	
	public static DenyFriendRequestAction getDenyFriendRequestAction() {
		return denyFriendRequestAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		String m_id = memberDto.getM_id();
		int fr_id = Integer.parseInt(request.getParameter("fr_id"));
		MessageServiceImpl.getMessageServiceImpl().denyFriendRequest(fr_id);
		List<FriendRequestDto> list = MessageServiceImpl.getMessageServiceImpl().listFriendRequest(m_id);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(FriendRequestDto friendRequestDto : list) {
			JSONObject jobj = new JSONObject();//== DTO
			
			jobj.put("fr_id", friendRequestDto.getFr_id());
			jobj.put("m_id", friendRequestDto.getM_id());
			jobj.put("from_id", friendRequestDto.getFrom_id());
			jobj.put("fr_date", friendRequestDto.getFr_date());
			jobj.put("fr_check", friendRequestDto.getFr_check());
			jobj.put("fr_content", friendRequestDto.getFr_content());
			jobj.put("from_name",friendRequestDto.getFrom_name());
			
			jarray.add(jobj);
		}
		json.put("friendRequestListJson", jarray);
		return json.toString();
		
	}

}
