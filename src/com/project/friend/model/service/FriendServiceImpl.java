package com.project.friend.model.service;

import java.util.*;

import com.project.friend.model.FriendListDto;
import com.project.friend.model.dao.FriendDaoImpl;

public class FriendServiceImpl implements FriendService {

	
	private static FriendServiceImpl friendServiceImpl;
	
	private FriendServiceImpl(){};
	
	static {
		friendServiceImpl = new FriendServiceImpl();
	}
	
	public static FriendServiceImpl getFriendServiceImpl() {
		return friendServiceImpl;
	}



	@Override
	public List<FriendListDto> friendList(String m_id) {
		return FriendDaoImpl.getFriendDaoImpl().friendList(m_id);
	}



	@Override
	public int deleteFriend(String f_id, String m_id) {
		return FriendDaoImpl.getFriendDaoImpl().deleteFriend(f_id, m_id);
	}



	@Override
	public int addFriend(String m_id, String m_name, String toid, String content) {

		Map<String, String>map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_name", m_name);
		map.put("toid", toid);
		map.put("content", content);
		return FriendDaoImpl.getFriendDaoImpl().addFriend(map);
	}



	@Override
	public int checkFriendId(String toid) {
		
		return FriendDaoImpl.getFriendDaoImpl().checkFriendId(toid);
	}

}
