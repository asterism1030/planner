
package com.project.friend.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.friend.model.service.FriendServiceImpl;
import com.project.util.Encoder;

public class AddFriendAction implements Action{

	
	private static AddFriendAction addFriendAction;
	
	private AddFriendAction(){};
	
	static {
		
		addFriendAction = new AddFriendAction();
	}
	
	public static AddFriendAction getAddFriendAction() {
		return addFriendAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");
		String m_name = request.getParameter("m_name");
		System.out.println("얻어올 떄 꺠지냐 : " + m_name);
		String toid = request.getParameter("toid");
		String content = request.getParameter("content");
		FriendServiceImpl.getFriendServiceImpl().addFriend(m_id, m_name, toid, content);
		
		return "/friend/friends_list.jsp";
	}

	
	
}
