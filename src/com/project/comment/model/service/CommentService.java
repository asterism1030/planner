package com.project.comment.model.service;

import com.project.comment.model.CommentDto;

public interface CommentService {
	
	 String groupCommentList(String p_id);
	 
	 void groupCommentWrite(CommentDto commentDto);
	 
	 void groupCommentDelete(int gc_id);
	 
	 void groupCommentModify(CommentDto commentDto);
	 
	 String commentList(String p_id);
	 
	 void commentWrite(CommentDto commentDto);
	 
	 void commentDelete(int gc_id);
	 
	 void commentModify(CommentDto commentDto);

}
