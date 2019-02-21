package com.project.comment.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.comment.model.CommentDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.service.PlannerServiceImpl;

public class MoveGroupCommentAction implements Action {
	
	private static MoveGroupCommentAction moveGroupCommentAction;
	
	static {
		moveGroupCommentAction = new MoveGroupCommentAction();
	}
	
	private MoveGroupCommentAction() {}
	

	public static MoveGroupCommentAction getMoveGroupComment() {
		return moveGroupCommentAction;
	}



	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String p_id = request.getParameter("p_id");
		
		int firstLike = PlannerServiceImpl.getPlannerService().getLike(p_id, memberDto.getM_id());
		request.setAttribute("firstlike", firstLike);
		
		List<GroupMemberDto> glist = PlannerServiceImpl.getPlannerService().groupMember(p_id);
		request.setAttribute("groupmember", glist);
		
		
		return "/planner/groupcomment.jsp";
	}

}
