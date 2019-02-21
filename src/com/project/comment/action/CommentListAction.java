package com.project.comment.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.comment.model.service.CommentServiceImpl;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class CommentListAction implements Action{
	
	private static CommentListAction commentListAction;
	
	static {
		commentListAction = new CommentListAction();
	}
	
	private CommentListAction() {}

	public static CommentListAction getCommentListAction() {
		return commentListAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String p_id = request.getParameter("p_id");
		
		String list = CommentServiceImpl.getCommentServiceImpl().commentList(p_id);
		return list;
	}
	
}
