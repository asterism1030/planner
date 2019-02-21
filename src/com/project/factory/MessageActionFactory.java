package com.project.factory;

import com.project.action.Action;
import com.project.message.action.*;

public class MessageActionFactory {

	private static Action acceptFriendRequestAction;
	private static Action acceptGroupRequestAction;
	private static Action acceptPlannerRequestAction;

	private static Action denyFriendRequestAction;
	private static Action denyGroupRequestAction;

	private static Action showFriendRequestListAction;
	private static Action showGroupRequestListAction;

	static {

		acceptFriendRequestAction = AcceptFriendRequestAction.getAcceptFriendRequestAction();
		acceptGroupRequestAction = AcceptGroupRequestAction.getAcceptGroupRequestAction();

		denyFriendRequestAction = DenyFriendRequestAction.getDenyFriendRequestAction();
		denyGroupRequestAction = DenyGroupRequestAction.getDenyGroupRequestAction();

		showFriendRequestListAction = ShowFriendRequestListAction.getShowFriendRequestListAction();
		showGroupRequestListAction = ShowGroupRequestListAction.getShowGroupRequestListAction();

	}

	public static Action getShowFriendRequestListAction() {
		return showFriendRequestListAction;
	}

	public static Action getShowGroupRequestListAction() {
		return showGroupRequestListAction;
	}

	public static Action getAcceptFriendRequestAction() {
		return acceptFriendRequestAction;
	}

	public static Action getAcceptGroupRequestAction() {
		return acceptGroupRequestAction;
	}

	public static Action getAcceptPlannerRequestAction() {
		return acceptPlannerRequestAction;
	}

	public static Action getDenyFriendRequestAction() {
		return denyFriendRequestAction;
	}

	public static Action getDenyGroupRequestAction() {
		return denyGroupRequestAction;
	}


}
