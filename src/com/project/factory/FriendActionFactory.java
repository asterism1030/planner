package com.project.factory;

import com.project.action.Action;
import com.project.friend.action.*;

public class FriendActionFactory {

	private static Action deleteFriendAction;
	private static Action showFriendAction;
	private static Action addFriendAction;
	private static Action checkFriendAction;

	static {

		deleteFriendAction = DeleteFriendAction.getDeleteFriendAction();
		showFriendAction = ShowFriendListAction.getShowFriendListAction();
		addFriendAction = AddFriendAction.getAddFriendAction();
		checkFriendAction = CheckFriendIdAction.getCheckFriendIdAction();
	}

	public static Action getCheckFriendAction() {
		return checkFriendAction;
	}

	public static Action getAddFriendAction() {
		return addFriendAction;
	}

	public static Action getDeleteFriendAction() {
		return deleteFriendAction;
	}

	public static Action getShowFriendAction() {
		return showFriendAction;
	}

}
