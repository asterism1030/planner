package com.project.message.model.dao;

import java.util.List;
import java.util.Map;

import com.project.group.model.GroupInvitationDto;
import com.project.message.model.*;

public interface MessageDao {

	
	List<FriendRequestDto> listFriendRequest(String m_id);
	List<MessageDto> listMessage(String m_id);
	List<GroupInvitationDto> listGroupRequest(String m_id);
	
	int acceptFriendRequest(Map<String, String>map);
	int denyFriendRequest(int fr_id);
	
	int acceptGroupRequest(GroupMembersDto groupMembersDto, int gi_id);
	int denyGroupRequest(int gi_id);
}
