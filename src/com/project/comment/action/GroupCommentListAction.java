package com.project.comment.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.comment.model.service.CommentServiceImpl;
import com.project.planner.model.PlannerDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class GroupCommentListAction implements Action{
	
	private static GroupCommentListAction groupCommentListAction;
	
	static {
		groupCommentListAction = new GroupCommentListAction();
	}
	
	private GroupCommentListAction() {}

	public static GroupCommentListAction getGroupCommentListAction() {
		return groupCommentListAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String p_id = request.getParameter("p_id");
		
		String list = CommentServiceImpl.getCommentServiceImpl().groupCommentList(p_id);
		return list;
	}
	
}
