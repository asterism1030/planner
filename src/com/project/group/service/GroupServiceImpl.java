package com.project.group.service;

import com.project.group.dao.GroupDaoImpl;
import com.project.group.model.GroupInvitationDto;

public class GroupServiceImpl implements GroupService {

	private static GroupService groupService;
	private GroupServiceImpl(){};
	
	static {
		
		groupService = new GroupServiceImpl();
	}
	
	public static GroupService getGroupService() {
		return groupService;
	}


	@Override
	public int addGroupMember(GroupInvitationDto groupInvitationDto) {
		return GroupDaoImpl.getGroupDao().addGroupMember(groupInvitationDto);
	}

	@Override
	public String getP_subject(int p_id) {
		// TODO Auto-generated method stub
		return GroupDaoImpl.getGroupDao().getP_subject(p_id);
	}


	@Override
	public String getP_img(int p_id) {
		// TODO Auto-generated method stub
		return GroupDaoImpl.getGroupDao().getP_img(p_id);
	}

}
