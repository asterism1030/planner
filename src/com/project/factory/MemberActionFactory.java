package com.project.factory;

import com.project.action.Action;
import com.project.member.action.*;

public class MemberActionFactory {

	
	private static Action joinAction;
	private static Action loginAction;
	private static Action modifyAction;
	private static Action logoutAction;
	private static Action emailSearchAction;
	private static Action facebookAction;
	private static Action changePassAction;
	private static Action findMemberInfoAction;
	
	static {
		
		joinAction = JoinAction.getJoinAction();
		loginAction = LoginAction.getLoginAction();
		modifyAction = ModifyAction.getModifyAction();
		logoutAction = LogOutAction.getLogOutAction();
		emailSearchAction = EmailSearchAction.getEmailSearchAction();
		facebookAction = FacebookAction.getFacebookSearchAction();
		changePassAction = ChangePassAction.getChangePassAction();
		findMemberInfoAction = FindMemberInfoAction.getFindMemberInfoAction();
	}


	
	public static Action getEmailSearchAction() {
		return emailSearchAction;
	}
	
	
	public static Action getFacebookAction() {
		return facebookAction;
	}


	public static Action getLogoutAction() {
		return logoutAction;
	}


	public static Action getJoinAction() {
		return joinAction;
	}


	public static Action getLoginAction() {
		return loginAction;
	}


	public static Action getModifyAction() {
		return modifyAction;
	}
	
	public static Action getChangePassAction() {
		return changePassAction;
	}


	public static Action getFindMemberInfoAction() {
		return findMemberInfoAction;
	}
	
	
	
	
}
