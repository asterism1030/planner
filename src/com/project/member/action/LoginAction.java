package com.project.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.member.model.MemberDto;
import com.project.member.model.service.MemberServiceImpl;


public class LoginAction implements Action {
	
	//single tone pattern
	private LoginAction(){};
	private static LoginAction loginAction;
	static {
		loginAction = new LoginAction();
	}
	
	public static LoginAction getLoginAction() {
		return loginAction;
	}
/////////////////////////////////////////////////////

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String root = request.getContextPath();
		String path = "";
		
		String id = request.getParameter("inputUsernameEmail");
		String pass = request.getParameter("inputPassword");
		
		
		
		MemberDto memberDto = MemberServiceImpl.getMemberService().login(id, pass);
		if(memberDto != null) { //�α��� ������
			
			request.setAttribute("userInfo", memberDto);
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", memberDto);
			//session�� �ּҿ� �� ���/��~ ���� ���� �ʴ´�
			
			String idsv = request.getParameter("idsv");
			
			if("ok".equals(idsv)) {
				Cookie cookie = new Cookie("loginid", id);
				cookie.setMaxAge(60 * 60 * 24 * 3);
				cookie.setPath(root);
				response.addCookie(cookie); //���� ��Ű�� server�� ������ �����Ƿ� �Ѱ��ֱ� ���� �� �ڵ� �ۼ�
			} else {
				Cookie cookie[] = request.getCookies();
				if (cookie != null) {
					int len = cookie.length;
					for (int i = 0; i < len; i++) {
						if("loginid".equals(cookie[i].getName())) {
							cookie[i].setMaxAge(0); //�ִ� ���ӽð��� 0. ��, ������ ����
							cookie[i].setPath(root);//�������� �����Ѵ�(�ݵ��!!)
							response.addCookie(cookie[i]); //Ŭ���̾�Ʈ���� ��Ű�� �߰��Ѵ�
							break;
						}
					}
					
				}
			}
			path = "/main.jsp";
			
		} else {
			
			path = "/member/login.jsp";
		}
		
		
		return path;
	}

}
