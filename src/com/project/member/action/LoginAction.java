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
		if(memberDto != null) { //로그인 성공시
			
			request.setAttribute("userInfo", memberDto);
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", memberDto);
			//session은 주소에 그 경로/값~ 등이 뜨지 않는다
			
			String idsv = request.getParameter("idsv");
			
			if("ok".equals(idsv)) {
				Cookie cookie = new Cookie("loginid", id);
				cookie.setMaxAge(60 * 60 * 24 * 3);
				cookie.setPath(root);
				response.addCookie(cookie); //현재 쿠키는 server가 가지고 있으므로 넘겨주기 위해 옆 코드 작성
			} else {
				Cookie cookie[] = request.getCookies();
				if (cookie != null) {
					int len = cookie.length;
					for (int i = 0; i < len; i++) {
						if("loginid".equals(cookie[i].getName())) {
							cookie[i].setMaxAge(0); //최대 지속시간을 0. 즉, 삭제와 같다
							cookie[i].setPath(root);//도메인을 지정한다(반드시!!)
							response.addCookie(cookie[i]); //클라이언트에게 쿠키를 추가한다
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
