package com.project.friend.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.friend.action.*;
import com.project.friend.model.FriendListDto;
import com.project.util.MovePage;

/**
 * Servlet implementation class FriendController
 */
@WebServlet("/friend")
public class FriendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String path = "/main.jsp";
		String act = request.getParameter("act");
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if("mvfriendlist".equals(act)) {
			path = "/friend/friends_list.jsp";
			MovePage.redirect(root + path, response);
		
		}else if("friendlist".equals(act)){
			
			String list = ShowFriendListAction.getShowFriendListAction().action(request, response);
			out.println(list);
		
		}else if("deleteFriend".equals(act)){
			String list = DeleteFriendAction.getDeleteFriendAction().action(request, response);
			out.println(list);
		
		}else if("addFriend".equals(act)){
			
			path = AddFriendAction.getAddFriendAction().action(request, response);
			MovePage.redirect(root+path, response);
		}else if("friendidcheck".equals(act)){
			String list = CheckFriendIdAction.getCheckFriendIdAction().action(request, response);
			out.println(list);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}
