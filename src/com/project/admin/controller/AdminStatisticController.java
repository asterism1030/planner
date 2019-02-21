package com.project.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.factory.AdminActionFactory;
import com.project.util.MovePage;


@WebServlet("/adminstatics")
public class AdminStatisticController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String act = request.getParameter("act");
		String root = request.getContextPath();
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if("mvStatistics".equals(act)){
			String path = "/admin/statistics.jsp";
			MovePage.redirect(root+path, response);
			
		}else if ("memberData".equals(act)) {
			String data = AdminActionFactory.getMemberDataAction().action(request, response);
			out.println(data);
			
		} else if ("plannerData".equals(act)) {
			String data = AdminActionFactory.getPlannerDataAction().action(request, response);
			out.println(data);
			
		} else if ("".equals(act)) {
			
		} else if ("".equals(act)) {
			
		} else if ("".equals(act)) {
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
