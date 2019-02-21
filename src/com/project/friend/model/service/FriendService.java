package com.project.friend.model.service;

import java.util.List;

import com.project.friend.model.FriendListDto;

public interface FriendService {

	int deleteFriend(String f_id, String m_id);
	List<FriendListDto> friendList(String m_id);
	
	int addFriend(String m_id, String m_name, String toid, String content);
	int checkFriendId(String toid);
}
