package com.project.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.comment.model.CommentDto;
import com.project.comment.model.service.CommentServiceImpl;

public class GroupCommentModifyAction implements Action {
	
	private static GroupCommentModifyAction groupCommentModifyAction;
	
	static {
		groupCommentModifyAction = new GroupCommentModifyAction();
	}
	
	private GroupCommentModifyAction() {}
	

	public static GroupCommentModifyAction getGroupCommentModifyAction() {
		return groupCommentModifyAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int gc_id = Integer.parseInt(request.getParameter("gc_id"));
		String p_id = request.getParameter("p_id");
		
		
		CommentDto commentDto = new CommentDto();
		commentDto.setGc_id(gc_id);
		commentDto.setGc_content(request.getParameter("comment"));
		
		CommentServiceImpl.getCommentServiceImpl().groupCommentModify(commentDto);
		
		String list = CommentServiceImpl.getCommentServiceImpl().groupCommentList(p_id);
		return list;
	}

}
