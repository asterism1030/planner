package com.project.group.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.factory.GroupActionFactory;
import com.project.util.MovePage;

/**
 * Servlet implementation class GroupController
 */
@WebServlet("/group")
public class GroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String date =request.getParameter("date");
		String path = "/main.jsp";
		String p_id = request.getParameter("p_id");
		
		if("invitate".equals(act)){
			
			path = GroupActionFactory.getAddGroupMemberAction().action(request, response);
			path += "&startdate="+date;
			MovePage.redirect(root+path, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}
