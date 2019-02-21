package com.project.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.comment.model.CommentDto;
import com.project.comment.model.service.CommentServiceImpl;
import com.project.member.model.MemberDto;
import com.project.util.Encoder;

public class CommentWriteAction implements Action {
	
	private static CommentWriteAction commentWriteAction;
	
	static {
		commentWriteAction = new CommentWriteAction();
	}
	
	private CommentWriteAction() {}
	

	public static CommentWriteAction getCommentWriteAction() {
		return commentWriteAction;
	}


	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String p_id = request.getParameter("p_id");
//		String g_id = request.getParameter("g_id");
		
		CommentDto commentDto = new CommentDto();
		commentDto.setP_id(p_id);
//		commentDto.setG_id(g_id);
		commentDto.setM_id(memberDto.getM_id());
		commentDto.setM_name(memberDto.getM_name());
		commentDto.setGc_content(request.getParameter("comment"));
		
		CommentServiceImpl.getCommentServiceImpl().commentWrite(commentDto);
		
		String list = CommentServiceImpl.getCommentServiceImpl().commentList(p_id);
		return list;
	}

}
