package com.project.group.dao;

import com.project.group.model.GroupInvitationDto;

public interface GroupDao {

	String getP_img(int p_id);
	String getP_subject(int p_id);
	int addGroupMember(GroupInvitationDto groupInvitationDto);
}
