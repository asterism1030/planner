package com.project.factory;

import com.project.action.Action;
import com.project.admin.action.DeleteMemberAction;
import com.project.admin.action.ListMemberAction;
import com.project.admin.action.MemberDataAction;
import com.project.admin.action.PlannerDataAction;
import com.project.admin.action.SaveMemberAction;
import com.project.admin.action.SearchMemberAction;

public class AdminActionFactory {
	
	private static Action listMemberAction;
	private static Action searchMemberAction;
	private static Action saveMemberAction;
	private static Action deleteMemberAction;
	private static Action memberDataAction;
	private static Action plannerDataAction;
	
	static {
		listMemberAction = ListMemberAction.getListMemberAction();
		searchMemberAction = SearchMemberAction.getSearchMemberAction();
		saveMemberAction = SaveMemberAction.getSaveMemberAction();
		deleteMemberAction = DeleteMemberAction.getDeleteMemberAction();
		memberDataAction = MemberDataAction.getMemberDataAction();
		plannerDataAction = PlannerDataAction.getPlannerDataAction();
	}
	

	public static Action getListMemberAction() {
		return listMemberAction;
	}

	public static Action getSearchMemberAction() {
		return searchMemberAction;
	}

	public static Action getSaveMemberAction() {
		return saveMemberAction;
	}

	public static Action getDeleteMemberAction() {
		return deleteMemberAction;
	}

	public static Action getMemberDataAction() {
		return memberDataAction;
	}

	public static Action getPlannerDataAction() {
		return plannerDataAction;
	}
	
	
}
