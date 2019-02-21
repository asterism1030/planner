package com.project.admin.model.service;

import java.util.List;
import java.util.Map;

import com.project.admin.model.dao.AdminDao;
import com.project.admin.model.dao.AdminDaoImpl;
import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;

public class AdminServiceImpl implements AdminService {
	
	private AdminServiceImpl(){}
	private static AdminServiceImpl adminServiceImpl;
	static {
		adminServiceImpl = new AdminServiceImpl();
	}
	
	public static AdminServiceImpl getAdminServiceImpl() {
		return adminServiceImpl;
	}

	
	@Override
	public List<MemberDto> getMembers() {
		return AdminDaoImpl.getAdminDaoImpl().getMembers();
	}

	@Override
	public List<String> getFriends(String m_id) {
		return AdminDaoImpl.getAdminDaoImpl().getFriends(m_id);
	}

	@Override
	public List<PlannerDto> getPlanners(String m_id) {
		return AdminDaoImpl.getAdminDaoImpl().getPlanners(m_id);
	}


	@Override
	public List<MemberDto> getSearchMembers(String key, String word) {
		return AdminDaoImpl.getAdminDaoImpl().getSearchMembers(key, word);
	}


	@Override
	public void saveMemberDatas(MemberDto member, String m_id, String m_pass) {
		AdminDaoImpl.getAdminDaoImpl().saveMemberDatas(member, m_id, m_pass);
		
	}


	@Override
	public String deleteMemberDatas(List<String> members) {
		return AdminDaoImpl.getAdminDaoImpl().deleteMemberDatas(members);
	}


	@Override
	public Map<String, String> getMemberDatas() {
		return AdminDaoImpl.getAdminDaoImpl().getMemberDatas();
	}


	@Override
	public Map<String, String> getPlannerDatas() {
		return AdminDaoImpl.getAdminDaoImpl().getPlannerDatas();
	}

}
