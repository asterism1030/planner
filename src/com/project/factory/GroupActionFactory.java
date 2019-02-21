package com.project.factory;

import com.project.action.Action;
import com.project.group.action.AddGroupMemberAction;
import com.project.message.action.AcceptFriendRequestAction;

public class GroupActionFactory {

	private static Action addGroupMemberAction;
	
	
	
	
	
	static {
		
		addGroupMemberAction = AddGroupMemberAction.getAddGroupMemberAction();
		
	}

	public static Action getAddGroupMemberAction() {
		return addGroupMemberAction;
	}
	
	
	
	
}
