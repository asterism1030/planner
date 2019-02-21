package com.project.message.model.service;

import java.util.List;
import java.util.Map;

import com.project.group.model.GroupInvitationDto;
import com.project.message.model.*;

public interface MessageService {

	List<FriendRequestDto> listFriendRequest(String m_id);
	List<MessageDto> listMessage(String m_id);
	List<GroupInvitationDto> listGroupRequest(String m_id);
	
	int acceptFriendRequest(String m_id, String m_name, String f_id, String f_name, String fr_id);
	int denyFriendRequest(int fr_id);
	
	int acceptGroupRequest(GroupMembersDto groupMembersDto, int gi_id);
	int denyGroupRequest(int gi_id);
	
}
