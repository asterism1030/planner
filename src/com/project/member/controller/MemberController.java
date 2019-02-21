package com.project.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.json.simple.JSONObject;

import com.project.factory.MemberActionFactory;
import com.project.util.MovePage;

@WebServlet("/user")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String path = "/main.jsp";
		
		String act = request.getParameter("act");
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if("mvlogin".equals(act)) {
			path = "/member/login.jsp";
			MovePage.redirect(root + path, response);
			
		} else if("mvjoin".equals(act)){
			path = "/member/join.jsp";
			MovePage.redirect(root + path, response);			
			
		} else if("mvfindPass".equals(act)){
			path = "/member/findPass.jsp";
			MovePage.redirect(root + path, response);
			
		} else if("facebookLogin".equals(act)){
			path = MemberActionFactory.getFacebookAction().action(request, response);
			MovePage.redirect(root + path, response);
			
		} else if("checkEmail".equals(act)) { //이메일이 존재하는지 체크한다
			String result = MemberActionFactory.getEmailSearchAction().action(request, response);
			response.setContentType("text/plain;charset=utf-8");
			out = response.getWriter();
			out.println(result);
			
		} else if ("checkmember".equals(act)) { //해당하는 정보의 멤버가 존재하는지 확인, 비밀번호 변경
			JSONObject jobj = new JSONObject();
			
			String res = MemberActionFactory.getFindMemberInfoAction().action(request, response);
			if("0".equals(res)) {
				jobj.put("isSuccess", 0);
				out.println(jobj.toJSONString());
			} else {
				jobj.put("isSuccess", 1);
				out.println(jobj.toJSONString());
			}
		} else if ("modifyPassOk".equals(act)) {	
			path = "/member/modifyPassOk.jsp";
			MovePage.redirect(root + path, response);
			
		} else if("login".equals(act)){
			path = MemberActionFactory.getLoginAction().action(request, response);
			MovePage.redirect(root + path, response);
			
		}  else if("join".equals(act)) {
			path = MemberActionFactory.getJoinAction().action(request, response);
			MovePage.redirect(root + path, response);
			
		}else if ("logout".equals(act)) { 
			
			path = MemberActionFactory.getLogoutAction().action(request, response);
			MovePage.redirect(root + path, response);
			
		} else if ("modify".equals(act)) { 
			
			path = MemberActionFactory.getModifyAction().action(request, response);
			MovePage.forward(path, request, response);
			
		} else if ("passchg".equals(act)) { 
			
			path = MemberActionFactory.getChangePassAction().action(request, response);
			MovePage.forward(path, request, response);
			
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}
