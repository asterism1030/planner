package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.member.model.service.MemberServiceImpl;

public class ModifyAction implements Action{
	
	private ModifyAction(){};
	private static ModifyAction modifyAction;
	static {
		modifyAction = new ModifyAction();
	}
	
	public static ModifyAction getModifyAction() {
		return modifyAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto1 = (MemberDto) session.getAttribute("userInfo");
		MemberDto memberDto2 = new MemberDto();
		
		memberDto2.setM_id(memberDto1.getM_id());
		memberDto2.setM_birth(request.getParameter("birthY")+"-"+request.getParameter("birthM")+"_"+request.getParameter("birthD"));
		memberDto2.setM_gender(request.getParameter("gender"));
		
		MemberServiceImpl.getMemberService().modifyMember(memberDto2);
		
		MemberDto newMemberDto = new MemberDto();
		newMemberDto.setM_id(memberDto1.getM_id());
		newMemberDto.setM_name(memberDto1.getM_name());
		newMemberDto.setM_pass(memberDto1.getM_pass());
		newMemberDto.setM_birth(memberDto2.getM_birth());
		newMemberDto.setM_gender(memberDto2.getM_gender());
		
		session.removeAttribute("userInfo");
		session.setAttribute("userInfo", newMemberDto);
		return "/member/mypage.jsp";
	}
	
	
	
}
