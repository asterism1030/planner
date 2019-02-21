package com.project.admin.model.service;

import java.util.List;
import java.util.Map;

import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;

public interface AdminService {

	List<MemberDto> getMembers();
	List<String> getFriends(String m_id);
	List<PlannerDto> getPlanners(String m_id);
	
	List<MemberDto> getSearchMembers(String key, String word);
	
	void saveMemberDatas(MemberDto member, String m_id, String m_pass);
	
	String deleteMemberDatas(List<String> members);
	
	Map<String, String> getMemberDatas();
	Map<String, String> getPlannerDatas();
}

