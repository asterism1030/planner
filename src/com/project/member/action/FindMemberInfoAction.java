package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.mail.PostMan;
import com.project.member.model.service.MemberServiceImpl;
import com.project.util.Encoder;

public class FindMemberInfoAction implements Action {
	private FindMemberInfoAction(){}
	private static FindMemberInfoAction findMemberInfoAction;
	static {
		findMemberInfoAction = new FindMemberInfoAction();
	}

	public static FindMemberInfoAction getFindMemberInfoAction() {
		return findMemberInfoAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("id");
		String name = Encoder.isoToUtf(request.getParameter("name"));
		String birth = request.getParameter("birth");
		
		
		int isExist = MemberServiceImpl.getMemberService().checkMember(email, name, birth);
		

		if(isExist == 1) { //¸â¹ö Á¸Àç½Ã
			String pass = MemberServiceImpl.getMemberService().changePass(email);
			PostMan send = new PostMan(email, pass);
			send.result();
		}
		
		return ""+isExist;
	}

}
