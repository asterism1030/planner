package com.project.message.model.service;

import java.util.*;

import com.project.group.model.GroupInvitationDto;
import com.project.member.model.dao.MemberDaoImpl;
import com.project.message.model.*;
import com.project.message.model.dao.MessageDao;
import com.project.message.model.dao.MessageDaoImpl;

public class MessageServiceImpl implements MessageService {

	private static MessageServiceImpl messageServiceImpl;
	
	private MessageServiceImpl(){};
	
	static {
		
		messageServiceImpl = new MessageServiceImpl();
	}
	
	
	
	public static MessageServiceImpl getMessageServiceImpl() {
		return messageServiceImpl;
	}

	@Override
	public List<FriendRequestDto> listFriendRequest(String m_id) {
		List<FriendRequestDto> list = MessageDaoImpl.getMessageDaoImpl().listFriendRequest(m_id);
		return list;
	}

	@Override
	public List<MessageDto> listMessage(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GroupInvitationDto> listGroupRequest(String m_id) {
		// TODO Auto-generated method stub
		return MessageDaoImpl.getMessageDaoImpl().listGroupRequest(m_id);
	}

	@Override
	public int acceptFriendRequest(String m_id, String m_name, String f_id, String f_name, String fr_id) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_name", m_name);
		map.put("f_id", f_id);
		map.put("f_name", f_name);
		map.put("fr_id", fr_id);
		
		return MessageDaoImpl.getMessageDaoImpl().acceptFriendRequest(map);
	}

	@Override
	public int denyFriendRequest(int fr_id) {

		return MessageDaoImpl.getMessageDaoImpl().denyFriendRequest(fr_id);
	}

	@Override
	public int acceptGroupRequest(GroupMembersDto groupMembersDto, int gi_id) {
		// TODO Auto-generated method stub
		return MessageDaoImpl.getMessageDaoImpl().acceptGroupRequest(groupMembersDto, gi_id);
	}

	@Override
	public int denyGroupRequest(int gi_id) {
		// TODO Auto-generated method stub
		return MessageDaoImpl.getMessageDaoImpl().denyGroupRequest(gi_id);
	}


}
