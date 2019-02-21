package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.member.model.service.MemberServiceImpl;

public class JoinAction implements Action {
	
	//single tone pattern
	private JoinAction(){}
	private static JoinAction joinAction;
	static{
		joinAction = new JoinAction();
	}
	

	public static JoinAction getJoinAction() {
		return joinAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = "/member/join.jsp"; //실패시 다시 회원가입 창으로
		String root = request.getContextPath();
		
		MemberDto memberDto = new MemberDto();
		
		String email = request.getParameter("youremail");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("Year") + "-" + request.getParameter("Month") + "-" + request.getParameter("Day");
		String gender = request.getParameter("gender");
		
		memberDto.setM_id(email); //이메일
		memberDto.setM_pass(pass);
		memberDto.setM_name(name);
		memberDto.setM_birth(birth);
		memberDto.setM_gender(gender);
		
		//성공시 1, 실패시 0
		int reg = MemberServiceImpl.getMemberService().register(memberDto);
		//로그인 성공시
		if (reg == 1)
			path = "/member/join_success.jsp";
		else if (reg == 0) //실패시
			path = "/member/join_fail.jsp";
		
		return path;
	}

}
