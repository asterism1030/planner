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
		
		String path = "/member/join.jsp"; //���н� �ٽ� ȸ������ â����
		String root = request.getContextPath();
		
		MemberDto memberDto = new MemberDto();
		
		String email = request.getParameter("youremail");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("Year") + "-" + request.getParameter("Month") + "-" + request.getParameter("Day");
		String gender = request.getParameter("gender");
		
		memberDto.setM_id(email); //�̸���
		memberDto.setM_pass(pass);
		memberDto.setM_name(name);
		memberDto.setM_birth(birth);
		memberDto.setM_gender(gender);
		
		//������ 1, ���н� 0
		int reg = MemberServiceImpl.getMemberService().register(memberDto);
		//�α��� ������
		if (reg == 1)
			path = "/member/join_success.jsp";
		else if (reg == 0) //���н�
			path = "/member/join_fail.jsp";
		
		return path;
	}

}
