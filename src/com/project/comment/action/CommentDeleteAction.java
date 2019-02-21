package com.project.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.comment.model.service.CommentServiceImpl;

public class CommentDeleteAction implements Action {
	
	private static CommentDeleteAction commentDeleteAction;
	
	static {
		commentDeleteAction = new CommentDeleteAction();
	}
	
	private CommentDeleteAction() {}

	public static CommentDeleteAction getCommentDeleteAction() {
		return commentDeleteAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int gc_id = Integer.parseInt(request.getParameter("gc_id"));
		CommentServiceImpl.getCommentServiceImpl().commentDelete(gc_id);
		
		String p_id = request.getParameter("p_id");
		String list = CommentServiceImpl.getCommentServiceImpl().commentList(p_id);
		return list;
	}

}
