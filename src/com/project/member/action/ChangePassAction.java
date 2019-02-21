package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.member.model.service.MemberServiceImpl;

public class ChangePassAction implements Action {
	
	private static ChangePassAction changePassAction;
	
	static {
		changePassAction = new ChangePassAction();
	}

	private ChangePassAction() {}
	
	public static ChangePassAction getChangePassAction() {
		return changePassAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String pass = request.getParameter("changepass");
		
		MemberServiceImpl.getMemberService().changePass(memberDto.getM_id(), pass);
		
		MemberDto newMemberDto = new MemberDto();
		newMemberDto.setM_id(memberDto.getM_id());
		newMemberDto.setM_name(memberDto.getM_name());
		newMemberDto.setM_pass(pass);
		newMemberDto.setM_birth(memberDto.getM_birth());
		newMemberDto.setM_gender(memberDto.getM_gender());
		
		session.removeAttribute("userInfo");
		session.setAttribute("userInfo", newMemberDto);
		
		return "/member/mypage.jsp";
	}

}
