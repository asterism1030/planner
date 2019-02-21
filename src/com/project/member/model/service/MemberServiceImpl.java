package com.project.member.model.service;

import java.util.*;

import com.project.member.model.MemberDto;
import com.project.member.model.dao.MemberDao;
import com.project.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {
	
	//single tone pattern
	private MemberServiceImpl(){}
	private static MemberService memberService;
	static {
		memberService = new MemberServiceImpl();
	}
	

	public static MemberService getMemberService() {
		return memberService;
	}

	@Override
	public int emailCheck(String email) {
		return MemberDaoImpl.getMemberDao().idCheck(email);
	}

	@Override
	public int register(MemberDto memberDto) {
		return MemberDaoImpl.getMemberDao().register(memberDto);
	}

	@Override
	public MemberDto login(String email, String pass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", email);
		map.put("userpass", pass);
		
		return MemberDaoImpl.getMemberDao().login(map);
	}

	@Override
	public MemberDto facebookLogin(String email, String pass, String name, String gender) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", email);
		map.put("userpass", pass);
		map.put("username", name);
		map.put("usergender", gender);
		
		return MemberDaoImpl.getMemberDao().facebookLogin(map);
	}

	@Override
	public void modifyMember(MemberDto memberDto) {
		MemberDaoImpl.getMemberDao().modifyMember(memberDto);
	}

	@Override
	public void changePass(String m_id, String pass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("pass", pass);
		MemberDaoImpl.getMemberDao().changePass(map);
	}

	
	@Override
	public int checkMember(String email, String name, String birth) {
		return MemberDaoImpl.getMemberDao().checkMember(email, name, birth);
	}

	@Override
	public String changePass(String email) {
		return MemberDaoImpl.getMemberDao().changePass(email);
		
	}
}
