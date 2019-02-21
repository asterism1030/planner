package com.project.comment.model.dao;

import java.util.List;

import com.project.comment.model.CommentDto;

public interface CommentDao {
	
	List<CommentDto> groupCommentList(String p_id);
	
	void groupCommentWrite (CommentDto commentDto);
	
	void groupCommentDelete (int gc_id);
	
	void groupCommentModify(CommentDto commentDto);
	
	List<CommentDto> commentList(String p_id);
	
	void commentWrite (CommentDto commentDto);
	
	void commentDelete (int gc_id);
	
	void commentModify(CommentDto commentDto);
}
