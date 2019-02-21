package com.project.comment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.factory.CommentActionFactory;
import com.project.factory.PlannerActionFactory;
import com.project.util.MovePage;

/**
 * Servlet implementation class CommentController
 */
@WebServlet("/comment")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String message = "";		
		
		String path = "";
		
		if("mvcomment".equals(act)) {
			path = CommentActionFactory.getMoveCommentAction().action(request, response);
			MovePage.forward(path, request, response);
		} else if("mvgroupcomment".equals(act)) {
			path = CommentActionFactory.getMoveGroupComment().action(request, response);
			MovePage.forward(path, request, response);
		} else if("write".equals(act)) {
			message = CommentActionFactory.getCommentWriteAction().action(request, response);
		} else if("commentList".equals(act)) {
			message = CommentActionFactory.getCommentListAction().action(request, response);
		} else if("delete".equals(act)) {
			message = CommentActionFactory.getCommentDeleteAction().action(request, response);
		} else if("modify".equals(act)) {
			message = CommentActionFactory.getCommentModifyAction().action(request, response);
		} else if("gwrite".equals(act)) {
			message = CommentActionFactory.getGroupCommentWriteAction().action(request, response);
		} else if("gcommentList".equals(act)) {
			message = CommentActionFactory.getGroupCommentListAction().action(request, response);
		} else if("gdelete".equals(act)) {
			message = CommentActionFactory.getGroupCommentDeleteAction().action(request, response);
		} else if("gmodify".equals(act)) {
			message = CommentActionFactory.getGroupCommentModifyAction().action(request, response);
		}
		out.println(message);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
