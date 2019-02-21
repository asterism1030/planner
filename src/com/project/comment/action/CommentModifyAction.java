package com.project.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.comment.model.CommentDto;
import com.project.comment.model.service.CommentServiceImpl;

public class CommentModifyAction implements Action {
	
	private static CommentModifyAction commentModifyAction;
	
	static {
		commentModifyAction = new CommentModifyAction();
	}
	
	private CommentModifyAction() {}
	

	public static CommentModifyAction getCommentModifyAction() {
		return commentModifyAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int gc_id = Integer.parseInt(request.getParameter("gc_id"));
		String p_id = request.getParameter("p_id");
		
		
		CommentDto commentDto = new CommentDto();
		commentDto.setGc_id(gc_id);
		commentDto.setGc_content(request.getParameter("comment"));
		
		CommentServiceImpl.getCommentServiceImpl().commentModify(commentDto);
		
		String list = CommentServiceImpl.getCommentServiceImpl().commentList(p_id);
		return list;
	}

}
