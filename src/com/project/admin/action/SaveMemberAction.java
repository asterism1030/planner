package com.project.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.admin.model.service.AdminServiceImpl;
import com.project.member.model.MemberDto;

public class SaveMemberAction implements Action {
	
	private SaveMemberAction(){}
	private static SaveMemberAction saveMemberAction;
	static {
		saveMemberAction = new SaveMemberAction();
	}
	

	public static SaveMemberAction getSaveMemberAction() {
		return saveMemberAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDto member = new MemberDto();
		member.setM_id(request.getParameter("id"));
		member.setM_name(request.getParameter("name"));
		member.setM_pass(request.getParameter("pass"));
		member.setM_birth(request.getParameter("birth"));
		member.setM_gender(request.getParameter("gender"));
		
		String m_id = request.getParameter("originId");
		String m_pass = request.getParameter("originPass");
		
		AdminServiceImpl.getAdminServiceImpl().saveMemberDatas(member, m_id, m_pass);
		
		return null;
	}

}
