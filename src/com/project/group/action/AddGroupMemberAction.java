package com.project.group.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.project.action.Action;
import com.project.group.model.GroupInvitationDto;
import com.project.group.service.GroupServiceImpl;
import com.project.member.model.MemberDto;

public class AddGroupMemberAction implements Action{

	private static AddGroupMemberAction addGroupMemberAction;
	
	private AddGroupMemberAction(){};
	
	static {
		
		addGroupMemberAction = new AddGroupMemberAction();
	}

	public static AddGroupMemberAction getAddGroupMemberAction() {
		return addGroupMemberAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String p_subject = GroupServiceImpl.getGroupService().getP_subject(p_id);
		String p_img = GroupServiceImpl.getGroupService().getP_img(p_id);
		GroupInvitationDto groupInvitationDto = new GroupInvitationDto();
		groupInvitationDto.setP_subject(p_subject);
		groupInvitationDto.setP_img(p_img);
		groupInvitationDto.setTo_id(request.getParameter("toid"));
		groupInvitationDto.setM_id(memberDto.getM_id());
		groupInvitationDto.setM_name(memberDto.getM_name());
		groupInvitationDto.setGi_content(request.getParameter("content"));
		groupInvitationDto.setG_id(p_id);
		GroupServiceImpl.getGroupService().addGroupMember(groupInvitationDto);
		return "/planner/dayplan.jsp?p_id="+p_id;
	}
	
	
}




















