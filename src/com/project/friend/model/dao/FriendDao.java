package com.project.friend.model.dao;

import java.util.List;
import java.util.Map;

import com.project.friend.model.FriendListDto;

public interface FriendDao {

	int deleteFriend(String f_id, String m_id);
	List<FriendListDto> friendList(String m_id);
	
	int addFriend(Map<String, String>map);
	int checkFriendId(String toid);
}
