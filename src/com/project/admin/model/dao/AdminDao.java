package com.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;

public interface AdminDao {

	//모든 회원들에 대한 정보 가져옴
	List<MemberDto> getMembers();
	//각회원의 친구 목록 정보 가져옴
	List<String> getFriends(String m_id);
	//각회원의 플래너 목록 정보 가져옴
	List<PlannerDto> getPlanners(String m_id);
	
	//키와 워드에 대한 회원 정보를 가져옴
	List<MemberDto> getSearchMembers(String key, String word);
	
	//수정한 멤버의 정보를 저장함
	void saveMemberDatas(MemberDto member, String m_id, String m_pass);
	
	//각 멤버들을 삭제함
	String deleteMemberDatas(List<String> members);
	
	//멤버-통계정보를 가져옴
	Map<String, String> getMemberDatas();
	//플래너-통계정보를 가져옴
	Map<String, String> getPlannerDatas();
}
