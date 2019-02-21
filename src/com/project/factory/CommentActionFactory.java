package com.project.factory;

import com.project.action.Action;
import com.project.comment.action.*;

public class CommentActionFactory {

	private static Action moveGroupComment;
	private static Action moveCommentAction;
	
	private static Action groupCommentDeleteAction;
	private static Action groupCommentListAction;
	private static Action groupCommentModifyAction;
	private static Action groupCommentWriteAction;
	
	private static Action commentDeleteAction;
	private static Action commentListAction;
	private static Action commentModifyAction;
	private static Action commentWriteAction;

	static {

		moveGroupComment = MoveGroupCommentAction.getMoveGroupComment();
		moveCommentAction = MoveCommentAction.getMoveCommentAction();
		groupCommentDeleteAction = GroupCommentDeleteAction.getGroupCommentDeleteAction();
		groupCommentListAction = GroupCommentListAction.getGroupCommentListAction();
		groupCommentModifyAction = GroupCommentModifyAction.getGroupCommentModifyAction();
		groupCommentWriteAction = GroupCommentWriteAction.getGroupCommentWriteAction();
		
		commentDeleteAction = CommentDeleteAction.getCommentDeleteAction();
		commentListAction = CommentListAction.getCommentListAction();
		commentModifyAction = CommentModifyAction.getCommentModifyAction();
		commentWriteAction = CommentWriteAction.getCommentWriteAction();

	}
	

	public static Action getMoveGroupComment() {
		return moveGroupComment;
	}
	
	public static Action getMoveCommentAction() {
		return moveCommentAction;
	}

	public static Action getGroupCommentDeleteAction() {
		return groupCommentDeleteAction;
	}

	public static Action getGroupCommentListAction() {
		return groupCommentListAction;
	}

	public static Action getGroupCommentModifyAction() {
		return groupCommentModifyAction;
	}

	public static Action getGroupCommentWriteAction() {
		return groupCommentWriteAction;
	}

	public static Action getCommentDeleteAction() {
		return commentDeleteAction;
	}

	public static Action getCommentListAction() {
		return commentListAction;
	}

	public static Action getCommentModifyAction() {
		return commentModifyAction;
	}

	public static Action getCommentWriteAction() {
		return commentWriteAction;
	}
	

}
