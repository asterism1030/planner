package com.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;

public interface AdminDao {

	//��� ȸ���鿡 ���� ���� ������
	List<MemberDto> getMembers();
	//��ȸ���� ģ�� ��� ���� ������
	List<String> getFriends(String m_id);
	//��ȸ���� �÷��� ��� ���� ������
	List<PlannerDto> getPlanners(String m_id);
	
	//Ű�� ���忡 ���� ȸ�� ������ ������
	List<MemberDto> getSearchMembers(String key, String word);
	
	//������ ����� ������ ������
	void saveMemberDatas(MemberDto member, String m_id, String m_pass);
	
	//�� ������� ������
	String deleteMemberDatas(List<String> members);
	
	//���-��������� ������
	Map<String, String> getMemberDatas();
	//�÷���-��������� ������
	Map<String, String> getPlannerDatas();
}
