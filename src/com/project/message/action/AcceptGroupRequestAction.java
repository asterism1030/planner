package com.project.message.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.message.model.GroupMembersDto;
import com.project.message.model.service.MessageServiceImpl;

public class AcceptGroupRequestAction implements Action{

	private static AcceptGroupRequestAction acceptGroupRequestAction;
	
	private AcceptGroupRequestAction(){};
	
	static {
		
		acceptGroupRequestAction = new AcceptGroupRequestAction();
	}
	
	
	
	public static AcceptGroupRequestAction getAcceptGroupRequestAction() {
		return acceptGroupRequestAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		GroupMembersDto groupMembersDto = new GroupMembersDto();
		int gi_id = Integer.parseInt(request.getParameter("gi_id"));
		groupMembersDto.setG_id(Integer.parseInt(request.getParameter("g_id")));
		groupMembersDto.setM_id(memberDto.getM_id());
		MessageServiceImpl.getMessageServiceImpl().acceptGroupRequest(groupMembersDto, gi_id);
		
		return "";
	}

}
