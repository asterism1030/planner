package com.project.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.group.model.GroupInvitationDto;
import com.project.member.model.MemberDto;
import com.project.message.model.FriendRequestDto;
import com.project.message.model.service.MessageServiceImpl;

public class DenyGroupRequestAction implements Action{

	
	private static DenyGroupRequestAction denyGroupRequestAction;
	
	private DenyGroupRequestAction(){};
	
	static {
		
		denyGroupRequestAction = new DenyGroupRequestAction();
	}
	
	
	
	public static DenyGroupRequestAction getDenyGroupRequestAction() {
		return denyGroupRequestAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		
		int gi_id = Integer.parseInt(request.getParameter("gi_id"));
		int cnt = MessageServiceImpl.getMessageServiceImpl().denyGroupRequest(gi_id);
		List<GroupInvitationDto>list = MessageServiceImpl.getMessageServiceImpl().listGroupRequest(memberDto.getM_id());
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		if(cnt == 1){
			for(GroupInvitationDto groupInvitationDto : list) {
				JSONObject jobj = new JSONObject();//== DTO
				
				jobj.put("p_subject", groupInvitationDto.getP_subject());
				jobj.put("p_img", groupInvitationDto.getP_img());
//				System.out.println("그룹 list 액션에서 : p_img : " + groupInvitationDto.getP_img());
				jobj.put("gi_date", groupInvitationDto.getGi_date());
				jobj.put("m_id", groupInvitationDto.getM_id());
				jobj.put("gi_content", groupInvitationDto.getGi_content());
				jobj.put("g_id", groupInvitationDto.getG_id());
				jobj.put("gi_id", groupInvitationDto.getGi_id());
				jobj.put("m_name", groupInvitationDto.getM_name());
				System.out.println("m_name : " + groupInvitationDto.getM_name());
				jarray.add(jobj);
				
			}
			json.put("groupRequestListJson", jarray);
		}
		return json.toString();
	}

}
