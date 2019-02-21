package com.project.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.admin.model.service.AdminServiceImpl;
import com.project.member.model.MemberDto;

public class DeleteMemberAction implements Action {

	private DeleteMemberAction(){}
	private static DeleteMemberAction deleteMemberAction;
	static {
		deleteMemberAction = new DeleteMemberAction();
	}
	
	
	public static DeleteMemberAction getDeleteMemberAction() {
		return deleteMemberAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String namelist = request.getParameter("namelist");
		String list[] = namelist.split(",");
		
		//System.out.println(list[0]);
		
		List<String> members = new ArrayList<>();
		
		for(String member : list ) {
			members.add(member);
		}
		
		AdminServiceImpl.getAdminServiceImpl().deleteMemberDatas(members);
		
		
		return "삭제를 완료했습니다";
	}

}
