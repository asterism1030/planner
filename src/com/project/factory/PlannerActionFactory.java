package com.project.factory;

import com.project.action.Action;
import com.project.comment.action.GroupCommentDeleteAction;
import com.project.comment.action.GroupCommentListAction;
import com.project.comment.action.GroupCommentModifyAction;
import com.project.comment.action.GroupCommentWriteAction;
import com.project.planner.action.*;

public class PlannerActionFactory {

	private static Action dayPlannerAction;
	private static Action myPlannerAction;
	private static Action deletePlannerAction;
	
	private static Action changeCompleteAction;
	private static Action changePublicAction;
	private static Action changeLikeAction;
	private static Action moveSquareAction;

	private static Action savePlannerAction;
	private static Action makePlannerAction;
	private static Action getDayDataAction;
	
	private static Action calDateAction;
	
	private static Action moveCorrectPlannerAction;

	static {
		dayPlannerAction = DayPlannerAction.getDayPlannerAction();
		myPlannerAction = MyPlannerAction.getMyPlannerAction();
		deletePlannerAction = DeletePlannerAction.getDeletePlannerAction();
		
		changeCompleteAction = ChangeCompleteAction.getChangeCompleteAction();
		changePublicAction = ChangePublicAction.getChangePublicAction();
		changeLikeAction = ChangeLikeAction.getChangeLikeAction();
		moveSquareAction = MoveSquareAction.getMoveSquareAction();

		savePlannerAction = SavePlannerAction.getSavePlannerAction();
		makePlannerAction = MakePlannerAction.getMakePlannerAction();
		getDayDataAction = GetDayDataAction.getGetDayDataAction();
		
		calDateAction = CalDateAction.getCalDateAction();
		moveCorrectPlannerAction = MoveCorrectPlannerAction.getMoveCorrectPlannerAction();
	}

	

	private PlannerActionFactory() {
	}

	
	
	public static final Action getMoveCorrectPlannerAction() {
		return moveCorrectPlannerAction;
	}



	public static Action getCalDateAction() {
		return calDateAction;
	}


	public static Action getMakePlannerAction() {
		return makePlannerAction;
	}


	public static Action getSavePlannerAction() {
		return savePlannerAction;
	}
	
	
	public static Action getDayPlannerAction() {
		return dayPlannerAction;
	}

	public static Action getMyPlannerAction() {
		return myPlannerAction;
	}
	
	public static Action getDeletePlannerAction() {
		return deletePlannerAction;
	}

	public static Action getGetDayDataAction() {
		return getDayDataAction;
	}

	public static Action getChangeCompleteAction() {
		return changeCompleteAction;
	}
	

	public static Action getChangeLikeAction() {
		return changeLikeAction;
	}

	public static Action getChangePublicAction() {
		return changePublicAction;
	}
	

	public static Action getMoveSquareAction() {
		return moveSquareAction;
	}

	
}
