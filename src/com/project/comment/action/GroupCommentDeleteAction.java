package com.project.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.comment.model.service.CommentServiceImpl;

public class GroupCommentDeleteAction implements Action {
	
	private static GroupCommentDeleteAction groupCommentDeleteAction;
	
	static {
		groupCommentDeleteAction = new GroupCommentDeleteAction();
	}
	
	private GroupCommentDeleteAction() {}

	public static GroupCommentDeleteAction getGroupCommentDeleteAction() {
		return groupCommentDeleteAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int gc_id = Integer.parseInt(request.getParameter("gc_id"));
		CommentServiceImpl.getCommentServiceImpl().groupCommentDelete(gc_id);
		
		String p_id = request.getParameter("p_id");
		String list = CommentServiceImpl.getCommentServiceImpl().groupCommentList(p_id);
		return list;
	}

}
