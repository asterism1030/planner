package com.project.message.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.factory.MessageActionFactory;
import com.project.message.action.*;
import com.project.util.MovePage;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/message")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act =request.getParameter("act");
		String root = request.getContextPath();
		String path = "/main.jsp";
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if("mvmessage".equals(act)){
			
			path = "/message/message.jsp";
			MovePage.redirect(root+path, response);
			
		}else if("showFriendRequestList".equals(act)){
			
			String list = MessageActionFactory.getShowFriendRequestListAction().action(request, response);
			out.println(list);
			
		}else if("acceptFriendRequest".equals(act)){
			
			String list = MessageActionFactory.getAcceptFriendRequestAction().action(request, response);
			out.println(list);
			
		}else if("denyFriendRequest".equals(act)){
			
			String list = MessageActionFactory.getDenyFriendRequestAction().action(request, response);
			out.println(list);
			
		}else if("showGroupRequestList".equals(act)){
			
			String list = MessageActionFactory.getShowGroupRequestListAction().action(request, response);
			out.println(list);
			
		}else if("acceptGroupRequest".equals(act)){
			MessageActionFactory.getAcceptGroupRequestAction().action(request, response);
			String list = MessageActionFactory.getShowGroupRequestListAction().action(request, response);
			out.println(list);
			
		}else if("denyGroupRequest".equals(act)){
			
			String list = MessageActionFactory.getDenyGroupRequestAction().action(request, response);
			out.println(list);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}
