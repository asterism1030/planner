package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.action.FacebookAction;
import com.project.member.model.MemberDto;
import com.project.member.model.service.MemberServiceImpl;

public class FacebookAction implements Action{

	//single tone pattern
	private FacebookAction(){};
	private static FacebookAction facebookAction;
	static {
		facebookAction = new FacebookAction();
	}
	
	///////////////////////////////
	
	public static FacebookAction getFacebookSearchAction() {
		return facebookAction;
	}
	
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = "fb_" + request.getParameter("facebookEmail");
		String uid = "fb_" + request.getParameter("facebookId"); //pass로 사용
		
		if("fb_undefined".equals(email)) {
			email = "und_" + uid;
		}
		
		String name = request.getParameter("facebookName");
		String gender = (request.getParameter("facebookGender").equals("female")) ? "여자":"남자" ;
		
		
		
		MemberDto memberDto = MemberServiceImpl.getMemberService().facebookLogin(email, uid, name, gender);
		request.setAttribute("userInfo", memberDto);
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", memberDto);
		

		String path = "/main.jsp";
		return path;
	}

}
