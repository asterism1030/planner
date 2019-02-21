package com.project.group.service;

import com.project.group.model.GroupInvitationDto;

public interface GroupService {

	String getP_img(int p_id);
	String getP_subject(int p_id);
	int addGroupMember(GroupInvitationDto groupInvitationDto);
}
